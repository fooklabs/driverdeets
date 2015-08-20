package DriverDeets;
use Mojo::Base 'Mojolicious';

#use Mojo::Pg;
use Mojo::Home;
use Mojolicious::Plugin::Bcrypt;
use Mojolicious::Plugin::Authentication;
use Mojo::Util qw(md5_sum);

has db => sub {
  my $self = shift;
  my $schema_class = $self->config->{db_schema} or die "Unknown DB Schema Class";
  eval "require $schema_class" or die "Could not load Schema Class ($schema_class). $@\n";

  my $schema = $schema_class->connect(
    @{ $self->config }{ qw/db_dsn db_user db_pass db_options/ }
  ) or die "Could not connect to $schema_class using DSN " . $self->config->{db_dsn};

  return $schema;
};

has config_file => sub {
  my $self = shift;
  return $ENV{DRIVERDEETS_CONFIG} if $ENV{DRIVERDEETS_CONFIG};
  return $self->home->rel_file('driverdeets.conf');
};

sub load_config {
  my $app = shift;

  $app->plugin( Config => {
    file => $app->config_file,
  });

  if ( my $secrets = $app->config->{secrets} ) {
    $app->secrets($secrets) if @$secrets;
  } else {
     my $secrets = [md5_sum rand . $$ . time];
     $app->secrets($secrets);
  }
}

# This method will run once at server start
sub startup {
  my $app = shift;

  $app->load_config;

  $app->plugin('Mojolicious::Plugin::Bcrypt');

  $app->plugin('Mojolicious::Plugin::Authentication' => {
    load_user => sub {
      my ( $self, $login ) = @_;

      my $user = $self->schema->resultset('User')->find({ login => $login });;
      return $user if $user;
    },
    validate_user => sub {
      my ( $self, $login, $password ) = @_;

      my $user = $self->schema->resultset('User')->single({ login => $login });
      return unless $user;

      my $salt = substr $password, 0, 2;

      if ( $self->bcrypt_validate( $password, $user->password ) ) {
        $self->session( login => $user->login );
        $self->session( id    => $user->user_id );
        return $user->login;
      }
    },

  });

  $app->helper( schema => sub { shift->app->db } );

  # Router
  my $r = $app->routes;

  # Normal route to controller
  $r->get('/')->to(cb => sub {
    my $c = shift;
    $c->render(template => 'index', index => 1);
  })->name('index');

  # Register / login / logout
  $r->any('/register')->to('user#register')->name('register');
  $r->any('/login')->to('user#login')->name('login');

  $r->post('/vote/:review/:what/:type')->to('review#vote');
  $r->post('/plate/find')->to('plate#view');
  $r->get('/cities/:region')->to('region#cities');
  $r->get('/:country/:region/plate/:plate')->to('plate#view')->name('view');
  $r->get('/:country/:region/:type/:name')->to(
    'region#list',
    type => 'state',
    name => 'state',
  )->name('list');



  $r->any('/review')->to('plate#review')->name('review');
  $r->any('/search')->to('plates#search')->name('search');

  my $auth = $r->under('/' => sub {
    my $self = shift;
    $self->redirect_to('/login') and return 0 unless($self->is_user_authenticated);
    return 1;
  });

  # Authed can do the following:
  # Write reviews
  # Update their profile
  # Mark mean, funny, nice, useful
}
1;
