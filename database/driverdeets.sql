--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: platehate; Tablespace:
--

CREATE TABLE cities (
    city_id bigint NOT NULL,
    city text NOT NULL,
    stub text NOT NULL,
    region_id integer NOT NULL,
    metro_id bigint NOT NULL
);


ALTER TABLE cities OWNER TO platehate;

--
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: public; Owner: platehate
--

CREATE SEQUENCE cities_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_city_id_seq OWNER TO platehate;

--
-- Name: cities_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: platehate
--

ALTER SEQUENCE cities_city_id_seq OWNED BY cities.city_id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: platehate; Tablespace:
--

CREATE TABLE countries (
    country_id bigint NOT NULL,
    country text NOT NULL,
    stub text NOT NULL
);


ALTER TABLE countries OWNER TO platehate;

--
-- Name: countries_country_id_seq; Type: SEQUENCE; Schema: public; Owner: platehate
--

CREATE SEQUENCE countries_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_country_id_seq OWNER TO platehate;

--
-- Name: countries_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: platehate
--

ALTER SEQUENCE countries_country_id_seq OWNED BY countries.country_id;


--
-- Name: metros; Type: TABLE; Schema: public; Owner: platehate; Tablespace:
--

CREATE TABLE metros (
    metro_id bigint NOT NULL,
    metro text NOT NULL,
    stub text NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE metros OWNER TO platehate;

--
-- Name: metros_metro_id_seq; Type: SEQUENCE; Schema: public; Owner: platehate
--

CREATE SEQUENCE metros_metro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metros_metro_id_seq OWNER TO platehate;

--
-- Name: metros_metro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: platehate
--

ALTER SEQUENCE metros_metro_id_seq OWNED BY metros.metro_id;


--
-- Name: plates; Type: TABLE; Schema: public; Owner: platehate; Tablespace:
--

CREATE TABLE plates (
    plate_id bigint NOT NULL,
    plate text NOT NULL,
    region_id bigint NOT NULL
);


ALTER TABLE plates OWNER TO platehate;

--
-- Name: plates_plate_id_seq; Type: SEQUENCE; Schema: public; Owner: platehate
--

CREATE SEQUENCE plates_plate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plates_plate_id_seq OWNER TO platehate;

--
-- Name: plates_plate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: platehate
--

ALTER SEQUENCE plates_plate_id_seq OWNED BY plates.plate_id;


--
-- Name: plates; Type: TABLE; Schema: public; Owner: platehate; Tablespace:
--

CREATE TABLE votes (
    user_id bigint NOT NULL,
    review_id bigint NOT NULL,
    type text NOT NULL
);


ALTER TABLE votes OWNER TO platehate;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: platehate; Tablespace:
--

CREATE TABLE regions (
    region_id bigint NOT NULL,
    region text NOT NULL,
    stub text NOT NULL,
    country_id integer NOT NULL,
    abbr text
);


ALTER TABLE regions OWNER TO platehate;

--
-- Name: regions_region_id_seq; Type: SEQUENCE; Schema: public; Owner: platehate
--

CREATE SEQUENCE regions_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE regions_region_id_seq OWNER TO platehate;

--
-- Name: regions_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: platehate
--

ALTER SEQUENCE regions_region_id_seq OWNED BY regions.region_id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: platehate; Tablespace:
--

CREATE TABLE reviews (
    review_id bigint NOT NULL,
    user_id bigint NOT NULL,
    plate_id bigint NOT NULL,
    body text NOT NULL,
    rating smallint NOT NULL,
    city_id bigint NOT NULL,
    viewed boolean DEFAULT false NOT NULL,
    anonymous boolean DEFAULT false NOT NULL,
    funny integer DEFAULT 0 NOT NULL,
    useful integer DEFAULT 0 NOT NULL,
    mean integer DEFAULT 0 NOT NULL,
    nice integer DEFAULT 0 NOT NULL,
    created timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE reviews OWNER TO platehate;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: platehate
--

CREATE SEQUENCE reviews_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviews_review_id_seq OWNER TO platehate;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: platehate
--

ALTER SEQUENCE reviews_review_id_seq OWNED BY reviews.review_id;

--
-- Name: reviews; Type: TABLE; Schema: public; Owner: platehate; Tablespace:
--

CREATE TABLE messages (
    message_id bigint NOT NULL,
    user_id bigint NOT NULL,
    plate_id bigint NOT NULL,
    body text NOT NULL,
    viewed boolean DEFAULT false NOT NULL,
    created timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE messages OWNER TO platehate;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: platehate
--

CREATE SEQUENCE messages_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE messages_message_id_seq OWNER TO platehate;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: platehate
--

ALTER SEQUENCE messages_message_id_seq OWNED BY messages.message_id;

--
-- Name: users; Type: TABLE; Schema: public; Owner: platehate; Tablespace:
--

CREATE TABLE users (
    user_id bigint NOT NULL,
    email text,
    password text NOT NULL,
    login text NOT NULL,
    reset_code text
);


ALTER TABLE users OWNER TO platehate;

--
-- Name: users_plates; Type: TABLE; Schema: public; Owner: platehate; Tablespace:
--

CREATE TABLE users_plates (
    user_id bigint NOT NULL,
    plate_id bigint NOT NULL
);


ALTER TABLE users_plates OWNER TO platehate;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: platehate
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO platehate;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: platehate
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: city_id; Type: DEFAULT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY cities ALTER COLUMN city_id SET DEFAULT nextval('cities_city_id_seq'::regclass);


--
-- Name: country_id; Type: DEFAULT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY countries ALTER COLUMN country_id SET DEFAULT nextval('countries_country_id_seq'::regclass);


--
-- Name: metro_id; Type: DEFAULT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY metros ALTER COLUMN metro_id SET DEFAULT nextval('metros_metro_id_seq'::regclass);


--
-- Name: plate_id; Type: DEFAULT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY plates ALTER COLUMN plate_id SET DEFAULT nextval('plates_plate_id_seq'::regclass);


--
-- Name: region_id; Type: DEFAULT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY regions ALTER COLUMN region_id SET DEFAULT nextval('regions_region_id_seq'::regclass);


--
-- Name: review_id; Type: DEFAULT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY reviews ALTER COLUMN review_id SET DEFAULT nextval('reviews_review_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: platehate
--

COPY cities (city_id, city, stub, region_id, metro_id) FROM stdin;
1	Anchorage	anchorage	11	1
2	Anderson	anderson	11	2
3	Angoon	angoon	11	3
4	Atqasuk	atqasuk	11	2
5	Barrow	barrow	11	2
6	Bethel	bethel	11	1
7	Clear	clear	11	2
8	Cordova	cordova	11	1
9	Craig	craig	11	3
10	Delta Junction	delta-junction	11	2
11	Dillingham	dillingham	11	1
12	Eielson Air Force Base	eielson-air-force-base	11	2
13	Elmendorf Air Force Base	elmendorf-air-force-base	11	1
14	Fairbanks	fairbanks	11	2
15	Galena	galena	11	2
16	Glennallen	glennallen	11	1
17	Gustavus	gustavus	11	3
18	Haines	haines	11	3
19	Healy	healy	11	2
20	Homer	homer	11	1
21	Hoonah	hoonah	11	3
22	Juneau	juneau	11	3
23	Kenai	kenai	11	1
24	Ketchikan	ketchikan	11	3
25	Klawock	klawock	11	3
26	Kodiak	kodiak	11	1
27	Kotzebue	kotzebue	11	2
28	McGrath	mcgrath	11	2
29	Metlakatla	metlakatla	11	3
30	Mountain Village	mountain-village	11	1
31	Nikiski	nikiski	11	1
32	Nome	nome	11	2
33	North Pole	north-pole	11	2
34	Palmer	palmer	11	1
35	Pelican	pelican	11	3
36	Petersburg	petersburg	11	3
37	Port Lions	port-lions	11	1
38	Seward	seward	11	1
39	Sitka	sitka	11	3
40	Skagway	skagway	11	3
41	Soldotna	soldotna	11	1
42	Tanacross	tanacross	11	2
43	Thorne Bay	thorne-bay	11	3
44	Tok	tok	11	2
45	Tununak	tununak	11	1
46	Unalaska	unalaska	11	1
47	Valdez	valdez	11	1
48	Wasilla	wasilla	11	1
49	Whittier	whittier	11	1
50	Wrangell	wrangell	11	3
51	Yakutat	yakutat	11	3
52	College	college	11	2
53	Knik-Fairview	knik-fairview	11	1
54	Kongiganak	kongiganak	11	1
55	Point MacKenzie	point-mackenzie	11	1
56	Abbeville	abbeville	3	4
57	Adamsville	adamsville	3	5
58	Addison	addison	3	5
59	Adger	adger	3	5
60	Alabaster	alabaster	3	5
61	Albertville	albertville	3	6
62	Alexander City	alexander-city	3	7
63	Alexandria	alexandria	3	5
64	Allgood	allgood	3	5
65	Alpine	alpine	3	5
66	Andalusia	andalusia	3	7
67	Anniston	anniston	3	5
68	Arab	arab	3	6
69	Arlington	arlington	3	7
70	Ashford	ashford	3	4
71	Ashland	ashland	3	5
72	Ashville	ashville	3	5
73	Athens	athens	3	6
74	Atmore	atmore	3	8
75	Attalla	attalla	3	5
76	Auburn	auburn	3	9
77	Autaugaville	autaugaville	3	7
78	Axis	axis	3	8
79	Bay Minette	bay-minette	3	8
80	Berry	berry	3	5
81	Bessemer	bessemer	3	5
82	Birmingham	birmingham	3	5
83	Blountsville	blountsville	3	5
84	Boaz	boaz	3	6
85	Bremen	bremen	3	5
86	Brewton	brewton	3	8
87	Brookwood	brookwood	3	5
88	Brownsboro	brownsboro	3	6
89	Bucks	bucks	3	8
90	Buhl	buhl	3	5
91	Butler	butler	3	10
92	Calera	calera	3	5
93	Camden	camden	3	7
94	Carrollton	carrollton	3	5
95	Centre	centre	3	5
96	Centreville	centreville	3	5
97	Chapman	chapman	3	7
98	Chelsea	chelsea	3	5
99	Cherokee	cherokee	3	6
100	Childersburg	childersburg	3	5
101	Clanton	clanton	3	5
102	Clayton	clayton	3	9
103	Clio	clio	3	9
104	Coffeeville	coffeeville	3	8
105	Columbia	columbia	3	4
106	Columbiana	columbiana	3	5
107	Cottondale	cottondale	3	5
108	Cottonwood	cottonwood	3	4
109	Cowarts	cowarts	3	4
110	Creola	creola	3	8
111	Crossville	crossville	3	6
112	Cullman	cullman	3	5
113	Daleville	daleville	3	4
114	Daphne	daphne	3	8
115	Dauphin Island	dauphin-island	3	8
116	Deatsville	deatsville	3	7
117	Decatur	decatur	3	6
118	Demopolis	demopolis	3	7
119	Dixons Mills	dixons-mills	3	7
120	Dothan	dothan	3	4
121	Eastaboga	eastaboga	3	5
122	Eclectic	eclectic	3	7
123	Elba	elba	3	4
124	Elberta	elberta	3	8
125	Enterprise	enterprise	3	4
126	Eufaula	eufaula	3	9
127	Eutaw	eutaw	3	5
128	Evergreen	evergreen	3	8
129	Excel	excel	3	8
130	Fairfield	fairfield	3	5
131	Fairhope	fairhope	3	8
132	Fayette	fayette	3	5
133	Florence	florence	3	6
134	Foley	foley	3	8
135	Fruitdale	fruitdale	3	8
136	Fort Deposit	fort-deposit	3	7
137	Fort Payne	fort-payne	3	6
138	Fort Rucker	fort-rucker	3	4
139	Fulton	fulton	3	8
140	Fultondale	fultondale	3	5
141	Gadsden	gadsden	3	5
142	Gardendale	gardendale	3	5
143	Geneva	geneva	3	4
144	Glenwood	glenwood	3	7
145	Goodwater	goodwater	3	5
146	Gordo	gordo	3	5
147	Grand Bay	grand-bay	3	8
148	Graysville	graysville	3	5
149	Greensboro	greensboro	3	5
150	Greenville	greenville	3	7
151	Grove Hill	grove-hill	3	8
152	Guin	guin	3	5
153	Gulf Shores	gulf-shores	3	8
154	Guntersville	guntersville	3	6
155	Haleyville	haleyville	3	5
156	Hamilton	hamilton	3	5
157	Hanceville	hanceville	3	5
158	Hartselle	hartselle	3	6
159	Hatchechubbee	hatchechubbee	3	9
160	Hayden	hayden	3	5
161	Hayneville	hayneville	3	7
162	Hazel Green	hazel-green	3	6
163	Headland	headland	3	4
164	Heflin	heflin	3	11
165	Helena	helena	3	5
166	Hodges	hodges	3	6
167	Hope Hull	hope-hull	3	7
168	Huntsville	huntsville	3	6
169	Huxford	huxford	3	8
170	Ider	ider	3	6
171	Jack	jack	3	4
172	Jackson	jackson	3	8
173	Jacksonville	jacksonville	3	5
174	Jasper	jasper	3	5
175	Jefferson	jefferson	3	7
176	Kellyton	kellyton	3	5
177	Killen	killen	3	6
178	Laceys Spring	laceys-spring	3	6
179	La Fayette	la-fayette	3	9
180	Lanett	lanett	3	9
181	Leeds	leeds	3	5
182	Leesburg	leesburg	3	5
183	Lillian	lillian	3	8
184	Lincoln	lincoln	3	5
185	Linden	linden	3	7
186	Lineville	lineville	3	5
187	Livingston	livingston	3	10
188	Loachapoka	loachapoka	3	9
189	Locust Fork	locust-fork	3	5
190	Loxley	loxley	3	8
191	Luverne	luverne	3	7
192	Madison	madison	3	6
193	Marion	marion	3	7
194	Mathews	mathews	3	7
195	Millport	millport	3	12
196	Millry	millry	3	8
197	Mobile	mobile	3	8
198	Monroeville	monroeville	3	8
199	Montevallo	montevallo	3	5
200	Montgomery	montgomery	3	7
201	Montrose	montrose	3	8
202	Morris	morris	3	5
203	Moulton	moulton	3	6
204	Munford	munford	3	5
205	Muscle Shoals	muscle-shoals	3	6
206	New Brockton	new-brockton	3	4
207	New Market	new-market	3	6
208	Newton	newton	3	4
209	Newville	newville	3	4
210	Northport	northport	3	5
211	Notasulga	notasulga	3	7
212	Oakman	oakman	3	5
213	Oneonta	oneonta	3	5
214	Opelika	opelika	3	9
215	Opp	opp	3	7
216	Orange Beach	orange-beach	3	8
217	Oxford	oxford	3	5
218	Ozark	ozark	3	4
219	Paint Rock	paint-rock	3	6
220	Pelham	pelham	3	5
221	Pell City	pell-city	3	5
222	Pennington	pennington	3	10
223	Perdue Hill	perdue-hill	3	8
224	Phenix City	phenix-city	3	9
225	Piedmont	piedmont	3	5
226	Pike Road	pike-road	3	7
227	Pine Hill	pine-hill	3	7
228	Pinson	pinson	3	5
229	Pleasant Grove	pleasant-grove	3	5
230	Prattville	prattville	3	7
231	Quinton	quinton	3	5
232	Ragland	ragland	3	5
233	Rainbow City	rainbow-city	3	5
234	Rainsville	rainsville	3	6
235	Ramer	ramer	3	7
236	Red Bay	red-bay	3	6
237	Reform	reform	3	5
238	Roanoke	roanoke	3	11
239	Robertsdale	robertsdale	3	8
240	Russellville	russellville	3	6
241	Rutledge	rutledge	3	7
242	Saginaw	saginaw	3	5
243	Saraland	saraland	3	8
244	Scottsboro	scottsboro	3	6
245	Selma	selma	3	7
246	Semmes	semmes	3	8
247	Sheffield	sheffield	3	6
248	Shelby	shelby	3	5
249	Spanish Fort	spanish-fort	3	8
250	Springville	springville	3	5
251	Sulligent	sulligent	3	12
252	Sumiton	sumiton	3	5
253	Summerdale	summerdale	3	8
254	Sycamore	sycamore	3	5
255	Sylacauga	sylacauga	3	5
256	Talladega	talladega	3	5
257	Tallassee	tallassee	3	7
258	Theodore	theodore	3	8
259	Thomasville	thomasville	3	8
260	Toney	toney	3	6
261	Troy	troy	3	7
262	Trussville	trussville	3	5
263	Tuscaloosa	tuscaloosa	3	5
264	Tuscumbia	tuscumbia	3	6
265	Tuskegee	tuskegee	3	7
266	Union Springs	union-springs	3	7
267	Valley	valley	3	9
268	Vernon	vernon	3	12
269	Vinemont	vinemont	3	5
270	Wadley	wadley	3	11
271	Walnut Grove	walnut-grove	3	5
272	Warrior	warrior	3	5
273	Webb	webb	3	4
274	Wedowee	wedowee	3	11
275	Wetumpka	wetumpka	3	7
276	Winfield	winfield	3	5
277	York	york	3	10
278	Ardmore	ardmore	3	6
279	Blue Ridge	blue-ridge	3	7
280	Chatom	chatom	3	8
281	Dadeville	dadeville	3	7
282	Florala	florala	3	7
283	Forestdale	forestdale	3	5
284	Grant	grant	3	6
285	Harvest	harvest	3	6
286	Henagar	henagar	3	6
287	Homewood	homewood	3	5
288	Hoover	hoover	3	5
289	Hueytown	hueytown	3	5
290	Irondale	irondale	3	5
291	Millbrook	millbrook	3	7
292	Moody	moody	3	5
293	Mountain Brook	mountain-brook	3	5
294	New Hope	new-hope	3	6
295	Redstone Arsenal	redstone-arsenal	3	6
296	Smiths Station	smiths-station	3	9
297	Tarrant	tarrant	3	5
298	Tillmans Corner	tillmans-corner	3	8
299	Vestavia Hills	vestavia-hills	3	5
300	Adona	adona	16	13
301	Alexander	alexander	16	13
302	Alma	alma	16	14
303	Altheimer	altheimer	16	13
304	Amity	amity	16	13
305	Arkadelphia	arkadelphia	16	13
306	Armorel	armorel	16	15
307	Ash Flat	ash-flat	16	16
308	Ashdown	ashdown	16	17
309	Augusta	augusta	16	13
310	Bald Knob	bald-knob	16	13
311	Barling	barling	16	14
312	Batesville	batesville	16	13
313	Bauxite	bauxite	16	13
314	Bay	bay	16	16
315	Beebe	beebe	16	13
316	Bella Vista	bella-vista	16	14
317	Benton	benton	16	13
318	Bentonville	bentonville	16	14
319	Berryville	berryville	16	18
320	Bigelow	bigelow	16	13
321	Blytheville	blytheville	16	15
322	Booneville	booneville	16	14
323	Bradford	bradford	16	13
324	Branch	branch	16	14
325	Brinkley	brinkley	16	13
326	Brockwell	brockwell	16	13
327	Brookland	brookland	16	16
328	Bryant	bryant	16	13
329	Burdette	burdette	16	15
330	Cabot	cabot	16	13
331	Calico Rock	calico-rock	16	13
332	Camden	camden	16	13
333	Carlisle	carlisle	16	13
334	Carthage	carthage	16	13
335	Cave City	cave-city	16	16
336	Center Ridge	center-ridge	16	13
337	Charleston	charleston	16	14
338	Charlotte	charlotte	16	13
339	Cherokee Village	cherokee-village	16	16
340	Clarendon	clarendon	16	13
341	Clarksville	clarksville	16	14
342	Clinton	clinton	16	13
343	Compton	compton	16	18
344	Conway	conway	16	13
345	Corning	corning	16	16
346	Crossett	crossett	16	19
347	Danville	danville	16	13
348	Dardanelle	dardanelle	16	13
349	De Queen	de-queen	16	17
350	DeWitt	dewitt	16	13
351	Decatur	decatur	16	14
352	Dermott	dermott	16	13
353	Des Arc	des-arc	16	13
354	Dumas	dumas	16	13
355	Dyess	dyess	16	15
356	El Dorado	el-dorado	16	19
357	Elm Springs	elm-springs	16	14
358	England	england	16	13
359	Enola	enola	16	13
360	Eureka Springs	eureka-springs	16	18
361	Fairfield Bay	fairfield-bay	16	13
362	Farmington	farmington	16	14
363	Fayetteville	fayetteville	16	14
364	Flippin	flippin	16	18
365	Floral	floral	16	13
366	Fordyce	fordyce	16	13
367	Forrest City	forrest-city	16	15
368	Fountain Hill	fountain-hill	16	19
369	Friendship	friendship	16	13
370	Fort Smith	fort-smith	16	14
371	Gassville	gassville	16	18
372	Gentry	gentry	16	14
373	Gillham	gillham	16	17
374	Glenwood	glenwood	16	13
375	Gould	gould	16	13
376	Grady	grady	16	13
377	Gravette	gravette	16	14
378	Greenbrier	greenbrier	16	13
379	Greenwood	greenwood	16	14
380	Guion	guion	16	13
381	Hackett	hackett	16	14
382	Hamburg	hamburg	16	19
383	Hardy	hardy	16	16
384	Harrisburg	harrisburg	16	15
385	Harrison	harrison	16	18
386	Hartford	hartford	16	14
387	Hattieville	hattieville	16	13
388	Hazen	hazen	16	13
389	Heber Springs	heber-springs	16	13
390	Hector	hector	16	13
391	Higden	higden	16	13
392	Hope	hope	16	17
393	Hot Springs National Park	hot-springs-national-park	16	13
394	Hot Springs Village	hot-springs-village	16	13
395	Hoxie	hoxie	16	16
396	Humphrey	humphrey	16	13
397	Huntsville	huntsville	16	14
398	Imboden	imboden	16	16
399	Jacksonville	jacksonville	16	13
400	Jasper	jasper	16	18
401	Jessieville	jessieville	16	13
402	Joiner	joiner	16	15
403	Jonesboro	jonesboro	16	16
404	Keiser	keiser	16	15
405	Kensett	kensett	16	13
406	Lake Village	lake-village	16	13
407	Lavaca	lavaca	16	14
408	Lead Hill	lead-hill	16	18
409	Lepanto	lepanto	16	15
410	Leslie	leslie	16	13
411	Little Rock	little-rock	16	13
412	Little Rock Air Force Base	little-rock-air-force-base	16	13
413	Lockesburg	lockesburg	16	17
414	London	london	16	13
415	Lonoke	lonoke	16	13
416	Lowell	lowell	16	14
417	Luxora	luxora	16	15
418	Lynn	lynn	16	16
419	Magnolia	magnolia	16	17
420	Malvern	malvern	16	13
421	Mammoth Spring	mammoth-spring	16	18
422	Mansfield	mansfield	16	14
423	Marianna	marianna	16	15
424	Marion	marion	16	15
425	Marked Tree	marked-tree	16	15
426	Marmaduke	marmaduke	16	16
427	Marshall	marshall	16	13
428	Maumelle	maumelle	16	13
429	Maynard	maynard	16	16
430	McCrory	mccrory	16	13
431	McGehee	mcgehee	16	13
432	McRae	mcrae	16	13
433	Melbourne	melbourne	16	13
434	Mena	mena	16	13
435	Monticello	monticello	16	13
436	Morrilton	morrilton	16	13
437	Mount Holly	mount-holly	16	19
438	Mount Ida	mount-ida	16	13
439	Mount Pleasant	mount-pleasant	16	13
440	Mount Vernon	mount-vernon	16	13
441	Mountain Home	mountain-home	16	18
442	Mountain View	mountain-view	16	13
443	Mountainburg	mountainburg	16	14
444	Nashville	nashville	16	17
445	Newark	newark	16	13
446	Newport	newport	16	13
447	Norfork	norfork	16	18
448	Norman	norman	16	13
449	North Little Rock	north-little-rock	16	13
450	Osceola	osceola	16	15
451	Ozark	ozark	16	14
452	Palestine	palestine	16	15
453	Paragould	paragould	16	16
454	Paris	paris	16	14
455	Pea Ridge	pea-ridge	16	14
456	Pearcy	pearcy	16	13
457	Piggott	piggott	16	16
458	Pine Bluff	pine-bluff	16	13
459	Plainview	plainview	16	13
460	Plumerville	plumerville	16	13
461	Pocahontas	pocahontas	16	16
462	Poplar Grove	poplar-grove	16	15
463	Pottsville	pottsville	16	13
464	Prairie Grove	prairie-grove	16	14
465	Prescott	prescott	16	13
466	Quitman	quitman	16	13
467	Rector	rector	16	16
468	Rison	rison	16	13
469	Rogers	rogers	16	14
470	Romance	romance	16	13
471	Rosston	rosston	16	13
472	Russellville	russellville	16	13
473	Salem	salem	16	18
474	Scotland	scotland	16	13
475	Searcy	searcy	16	13
476	Sheridan	sheridan	16	13
477	Sherwood	sherwood	16	13
478	Siloam Springs	siloam-springs	16	14
479	Smackover	smackover	16	19
480	Springdale	springdale	16	14
481	Stamps	stamps	16	17
482	Star City	star-city	16	13
483	Stuttgart	stuttgart	16	13
484	Subiaco	subiaco	16	14
485	Sulphur Rock	sulphur-rock	16	13
486	Swifton	swifton	16	13
487	Texarkana	texarkana	16	17
488	Timbo	timbo	16	13
489	Tontitown	tontitown	16	14
490	Trumann	trumann	16	15
491	Valley Springs	valley-springs	16	18
492	Van Buren	van-buren	16	14
493	Vilonia	vilonia	16	13
494	Waldo	waldo	16	17
495	Waldron	waldron	16	14
496	Walnut Ridge	walnut-ridge	16	16
497	Ward	ward	16	13
498	Warren	warren	16	13
499	Washington	washington	16	17
500	Weiner	weiner	16	15
501	West Fork	west-fork	16	14
502	West Memphis	west-memphis	16	15
503	White Hall	white-hall	16	13
504	Winslow	winslow	16	14
505	Wiseman	wiseman	16	13
506	Wrightsville	wrightsville	16	13
507	Wynne	wynne	16	15
508	Yellville	yellville	16	18
509	Blue Eye	blue-eye	16	18
510	Hampton	hampton	16	13
511	Hatfield	hatfield	16	13
512	Helena-West Helena	helena-west-helena	16	15
513	Hot Springs	hot-springs	16	13
514	Lincoln	lincoln	16	14
515	Ajo	ajo	41	20
516	Alpine	alpine	41	21
517	Amado	amado	41	20
518	Apache Junction	apache-junction	41	21
519	Arizona City	arizona-city	41	21
520	Ash Fork	ash-fork	41	21
521	Avondale	avondale	41	21
522	Benson	benson	41	20
523	Bisbee	bisbee	41	20
524	Buckeye	buckeye	41	21
525	Bullhead City	bullhead-city	41	21
526	Camp Verde	camp-verde	41	21
527	Carefree	carefree	41	21
528	Casa Grande	casa-grande	41	21
529	Catalina	catalina	41	20
530	Cave Creek	cave-creek	41	21
531	Central	central	41	21
532	Chandler	chandler	41	21
533	Chinle	chinle	41	22
534	Chino Valley	chino-valley	41	21
535	Clarkdale	clarkdale	41	21
536	Clifton	clifton	41	21
537	Cochise	cochise	41	20
538	Colorado City	colorado-city	41	21
539	Congress	congress	41	21
540	Coolidge	coolidge	41	21
541	Cortaro	cortaro	41	20
542	Cottonwood	cottonwood	41	21
543	Dateland	dateland	41	23
544	Douglas	douglas	41	20
545	Duncan	duncan	41	21
546	Ehrenberg	ehrenberg	41	21
547	El Mirage	el-mirage	41	21
548	Elgin	elgin	41	20
549	Eloy	eloy	41	21
550	Flagstaff	flagstaff	41	21
551	Florence	florence	41	21
552	Fountain Hills	fountain-hills	41	21
553	Fredonia	fredonia	41	21
554	Fort Defiance	fort-defiance	41	22
555	Fort Huachuca	fort-huachuca	41	20
556	Fort Mohave	fort-mohave	41	21
557	Fort Thomas	fort-thomas	41	21
558	Ganado	ganado	41	22
559	Gila Bend	gila-bend	41	21
560	Gilbert	gilbert	41	21
561	Glendale	glendale	41	21
562	Globe	globe	41	21
563	Goodyear	goodyear	41	21
564	Grand Canyon National Park	grand-canyon-national-park	41	21
565	Green Valley	green-valley	41	20
566	Hayden	hayden	41	21
567	Holbrook	holbrook	41	21
568	Hotevilla-Bacavi	hotevilla-bacavi	41	21
569	Joseph City	joseph-city	41	21
570	Kayenta	kayenta	41	21
571	Keams Canyon	keams-canyon	41	21
572	Kearny	kearny	41	21
573	Kingman	kingman	41	21
574	Kykotsmovi Village	kykotsmovi-village	41	21
575	Lake Havasu City	lake-havasu-city	41	21
576	Lake Montezuma	lake-montezuma	41	21
577	Litchfield Park	litchfield-park	41	21
578	Littlefield	littlefield	41	21
579	Luke AFB	luke-afb	41	21
580	Mammoth	mammoth	41	21
581	Many Farms	many-farms	41	22
582	Marana	marana	41	20
583	Maricopa	maricopa	41	21
584	Mayer	mayer	41	21
585	Mesa	mesa	41	21
586	Miami	miami	41	21
587	Mohave Valley	mohave-valley	41	21
588	Morenci	morenci	41	21
589	Morristown	morristown	41	21
590	Naco	naco	41	20
591	New River	new-river	41	21
592	Nogales	nogales	41	20
593	Oracle	oracle	41	21
594	Page	page	41	21
595	Palo Verde	palo-verde	41	21
596	Paradise Valley	paradise-valley	41	21
597	Parker	parker	41	21
598	Parks	parks	41	21
599	Payson	payson	41	21
600	Peoria	peoria	41	21
601	Phoenix	phoenix	41	21
602	Pima	pima	41	21
603	Poston	poston	41	21
604	Prescott	prescott	41	21
605	Prescott Valley	prescott-valley	41	21
606	Quartzsite	quartzsite	41	21
607	Queen Creek	queen-creek	41	21
608	Red Rock	red-rock	41	21
609	Rio Rico	rio-rico	41	20
610	Rio Verde	rio-verde	41	21
611	Sacaton	sacaton	41	21
612	Safford	safford	41	21
613	Sahuarita	sahuarita	41	20
614	Salome	salome	41	21
615	San Carlos	san-carlos	41	21
616	San Luis	san-luis	41	23
617	San Manuel	san-manuel	41	21
618	San Simon	san-simon	41	20
619	Sanders	sanders	41	22
620	Scottsdale	scottsdale	41	21
621	Sedona	sedona	41	21
622	Seligman	seligman	41	21
623	Sells	sells	41	20
624	Show Low	show-low	41	21
625	Sierra Vista	sierra-vista	41	20
626	Skull Valley	skull-valley	41	21
627	Snowflake	snowflake	41	21
628	Solomon	solomon	41	21
629	Somerton	somerton	41	23
630	Springerville	springerville	41	21
631	Saint David	saint-david	41	20
632	Saint Johns	saint-johns	41	21
633	Saint Michaels	saint-michaels	41	22
634	Stanfield	stanfield	41	21
635	Sun City	sun-city	41	21
636	Sun City West	sun-city-west	41	21
637	Superior	superior	41	21
638	Surprise	surprise	41	21
639	Teec Nos Pos	teec-nos-pos	41	22
640	Tempe	tempe	41	21
641	Thatcher	thatcher	41	21
642	Tolleson	tolleson	41	21
643	Tombstone	tombstone	41	20
644	Tonopah	tonopah	41	21
645	Topawa	topawa	41	20
646	Tuba City	tuba-city	41	21
647	Tucson	tucson	41	20
648	Vail	vail	41	20
649	Waddell	waddell	41	21
650	Wellton	wellton	41	23
651	Whiteriver	whiteriver	41	21
652	Wickenburg	wickenburg	41	21
653	Wikieup	wikieup	41	21
654	Willcox	willcox	41	20
655	Williams	williams	41	21
656	Window Rock	window-rock	41	22
657	Winkelman	winkelman	41	21
658	Winslow	winslow	41	21
659	Wittmann	wittmann	41	21
660	Youngtown	youngtown	41	21
661	Yuma	yuma	41	23
662	Casas Adobes	casas-adobes	41	20
663	Catalina Foothills	catalina-foothills	41	20
664	Corona de Tucson	corona-de-tucson	41	20
665	Drexel Heights	drexel-heights	41	20
666	Fortuna Foothills	fortuna-foothills	41	23
667	Gold Canyon	gold-canyon	41	21
668	Grand Canyon Village	grand-canyon-village	41	21
669	Oro Valley	oro-valley	41	20
670	Pinetop-Lakeside	pinetop-lakeside	41	21
671	San Tan Valley	san-tan-valley	41	21
672	Sun Lakes	sun-lakes	41	21
673	Tanque Verde	tanque-verde	41	20
674	Tusayan	tusayan	41	21
675	Valencia West	valencia-west	41	20
676	Village of Oak Creek	village-of-oak-creek	41	21
677	Acton	acton	13	24
678	Adelanto	adelanto	13	24
679	Agoura Hills	agoura-hills	13	24
680	Alameda	alameda	13	25
681	Alamo	alamo	13	25
682	Albany	albany	13	25
683	Albion	albion	13	25
684	Alhambra	alhambra	13	24
685	Aliso Viejo	aliso-viejo	13	24
686	Alleghany	alleghany	13	26
687	Alpaugh	alpaugh	13	27
688	Alpine	alpine	13	28
689	Alta	alta	13	26
690	Altadena	altadena	13	24
691	Alturas	alturas	13	29
692	American Canyon	american-canyon	13	25
693	Anaheim	anaheim	13	24
694	Anderson	anderson	13	29
695	Angels Camp	angels-camp	13	26
696	Angwin	angwin	13	25
697	Annapolis	annapolis	13	25
698	Antelope	antelope	13	26
699	Antioch	antioch	13	25
700	Apple Valley	apple-valley	13	24
701	Aptos	aptos	13	30
702	Arbuckle	arbuckle	13	26
703	Arcadia	arcadia	13	24
704	Arcata	arcata	13	31
705	Arnold	arnold	13	26
706	Aromas	aromas	13	30
707	Arroyo Grande	arroyo-grande	13	32
708	Artesia	artesia	13	24
709	Arvin	arvin	13	33
710	Atascadero	atascadero	13	32
711	Atherton	atherton	13	25
712	Atwater	atwater	13	27
713	Auberry	auberry	13	27
714	Auburn	auburn	13	26
715	Avalon	avalon	13	24
716	Avenal	avenal	13	27
717	Avila Beach	avila-beach	13	32
718	Azusa	azusa	13	24
719	Badger	badger	13	27
720	Baker	baker	13	24
721	Bakersfield	bakersfield	13	33
722	Baldwin Park	baldwin-park	13	24
723	Bangor	bangor	13	29
724	Banning	banning	13	24
725	Barstow	barstow	13	24
726	Beale Air Force Base	beale-air-force-base	13	26
727	Beaumont	beaumont	13	24
728	Bell	bell	13	24
729	Bell Gardens	bell-gardens	13	24
730	Bella Vista	bella-vista	13	29
731	Bellflower	bellflower	13	24
732	Belmont	belmont	13	25
733	Belvedere Tiburon	belvedere-tiburon	13	25
734	Ben Lomond	ben-lomond	13	30
735	Benicia	benicia	13	25
736	Berkeley	berkeley	13	25
737	Bethel Island	bethel-island	13	25
738	Beverly Hills	beverly-hills	13	24
739	Big Bear	big-bear	13	24
740	Big Bear Lake	big-bear-lake	13	24
741	Big Bend	big-bend	13	29
742	Big Creek	big-creek	13	27
743	Groveland-Big Oak Flat	groveland-big-oak-flat	13	26
744	Big Pine	big-pine	13	24
745	Big Sur	big-sur	13	30
746	Biggs	biggs	13	29
747	Bishop	bishop	13	24
748	Bloomington	bloomington	13	24
749	Blue Jay	blue-jay	13	24
750	Blue Lake	blue-lake	13	31
751	Blythe	blythe	13	24
752	Bodega Bay	bodega-bay	13	25
753	Bolinas	bolinas	13	25
754	Bonsall	bonsall	13	28
755	Boonville	boonville	13	25
756	Boron	boron	13	24
757	Borrego Springs	borrego-springs	13	28
758	Boulder Creek	boulder-creek	13	30
759	Boyes Hot Springs	boyes-hot-springs	13	25
760	Bradley	bradley	13	30
761	Brawley	brawley	13	34
762	Brea	brea	13	24
763	Brentwood	brentwood	13	25
764	Bridgeport	bridgeport	13	35
765	Brisbane	brisbane	13	25
766	Brookdale	brookdale	13	30
767	Buellton	buellton	13	32
768	Buena Park	buena-park	13	24
769	Burbank	burbank	13	24
770	Burlingame	burlingame	13	25
771	Burney	burney	13	29
772	Burrel	burrel	13	27
773	Butte City	butte-city	13	29
774	Buttonwillow	buttonwillow	13	33
775	Byron	byron	13	25
776	Cabazon	cabazon	13	24
777	Calabasas	calabasas	13	24
778	Calexico	calexico	13	34
779	California City	california-city	13	24
780	California Hot Springs	california-hot-springs	13	27
781	Calimesa	calimesa	13	24
782	Calipatria	calipatria	13	34
783	Calistoga	calistoga	13	25
784	Calpella	calpella	13	25
785	Camarillo	camarillo	13	24
786	Cambria	cambria	13	32
787	Camino	camino	13	26
788	Camp Pendleton North	camp-pendleton-north	13	28
789	Campbell	campbell	13	25
790	Campo	campo	13	28
791	Camptonville	camptonville	13	26
792	Canyon	canyon	13	25
793	Capitola	capitola	13	30
794	Carlsbad	carlsbad	13	28
795	Carmel	carmel	13	30
796	Carmel Valley	carmel-valley	13	30
797	Carmichael	carmichael	13	26
798	Carpinteria	carpinteria	13	32
799	Carson	carson	13	24
800	Caruthers	caruthers	13	27
801	Castaic	castaic	13	24
802	Castro Valley	castro-valley	13	25
803	Castroville	castroville	13	30
804	Cathedral City	cathedral-city	13	36
805	Cayucos	cayucos	13	32
806	Cazadero	cazadero	13	25
807	Ceres	ceres	13	26
808	Cerritos	cerritos	13	24
809	Chester	chester	13	26
810	Chicago Park	chicago-park	13	26
811	Chico	chico	13	29
812	Chinese Camp	chinese-camp	13	26
813	Chino	chino	13	24
814	Chino Hills	chino-hills	13	24
815	Chowchilla	chowchilla	13	27
816	Chualar	chualar	13	30
817	Chula Vista	chula-vista	13	28
818	Citrus Heights	citrus-heights	13	26
819	City of Industry	city-of-industry	13	24
820	Claremont	claremont	13	24
821	Clayton	clayton	13	25
822	Clearlake	clearlake	13	25
823	Clearlake Oaks	clearlake-oaks	13	25
824	Clements	clements	13	26
825	Cloverdale	cloverdale	13	25
826	Clovis	clovis	13	27
827	Coachella	coachella	13	36
828	Coalinga	coalinga	13	27
829	Cobb	cobb	13	25
830	Coleville	coleville	13	35
831	Colfax	colfax	13	26
832	Coloma	coloma	13	26
833	Colton	colton	13	24
834	Columbia	columbia	13	26
835	Colusa	colusa	13	26
836	Compton	compton	13	24
837	Concord	concord	13	25
838	Copperopolis	copperopolis	13	26
839	Corcoran	corcoran	13	27
840	Corning	corning	13	29
841	Corona	corona	13	24
842	Coronado	coronado	13	28
843	Corte Madera	corte-madera	13	25
844	Costa Mesa	costa-mesa	13	24
845	Cottonwood	cottonwood	13	29
846	Coulterville	coulterville	13	27
847	Covelo	covelo	13	25
848	Covina	covina	13	24
849	Crescent City	crescent-city	13	31
850	Crestline	crestline	13	24
851	Crockett	crockett	13	25
852	Crows Landing	crows-landing	13	26
853	Culver City	culver-city	13	24
854	Cupertino	cupertino	13	25
855	Cypress	cypress	13	24
856	Daggett	daggett	13	24
857	Daly City	daly-city	13	25
858	Dana Point	dana-point	13	24
859	Danville	danville	13	25
860	Davis	davis	13	26
861	Death Valley	death-valley	13	24
862	Deer Park	deer-park	13	25
863	Del Mar	del-mar	13	28
864	Delano	delano	13	33
865	Delhi	delhi	13	27
866	Del Rio	del-rio	13	26
867	Desert Center	desert-center	13	24
868	Diablo	diablo	13	25
869	Diamond Bar	diamond-bar	13	24
870	Diamond Springs	diamond-springs	13	26
871	Dinuba	dinuba	13	27
872	Dixon	dixon	13	26
873	Dorris	dorris	13	37
874	Dos Palos	dos-palos	13	27
875	Downey	downey	13	24
876	Downieville	downieville	13	26
877	Duarte	duarte	13	24
878	Dublin	dublin	13	25
879	Ducor	ducor	13	27
880	Dunnigan	dunnigan	13	26
881	Dunsmuir	dunsmuir	13	37
882	Durham	durham	13	29
883	Dutch Flat	dutch-flat	13	26
884	Earlimart	earlimart	13	27
885	Earp	earp	13	24
886	Edison	edison	13	33
887	El Cajon	el-cajon	13	28
888	El Centro	el-centro	13	34
889	El Cerrito	el-cerrito	13	25
890	El Dorado Hills	el-dorado-hills	13	26
891	El Granada	el-granada	13	25
892	El Monte	el-monte	13	24
893	El Segundo	el-segundo	13	24
894	El Sobrante	el-sobrante	13	25
895	Eldridge	eldridge	13	25
896	Elk	elk	13	25
897	Elk Creek	elk-creek	13	29
898	Elk Grove	elk-grove	13	26
899	Elmira	elmira	13	26
900	Elverta	elverta	13	26
901	Emeryville	emeryville	13	25
902	Empire	empire	13	26
903	Encinitas	encinitas	13	28
904	Escalon	escalon	13	26
905	Escondido	escondido	13	28
906	Esparto	esparto	13	26
907	Etna	etna	13	37
908	Eureka	eureka	13	31
909	Exeter	exeter	13	27
910	Fair Oaks	fair-oaks	13	26
911	Fairfax	fairfax	13	25
912	Fairfield	fairfield	13	26
913	Fall River Mills	fall-river-mills	13	29
914	Fallbrook	fallbrook	13	28
915	Farmersville	farmersville	13	27
916	Farmington	farmington	13	26
917	Felton	felton	13	30
918	Ferndale	ferndale	13	31
919	Fiddletown	fiddletown	13	26
920	Fillmore	fillmore	13	24
921	Firebaugh	firebaugh	13	27
922	Five Points	five-points	13	27
923	Folsom	folsom	13	26
924	Fontana	fontana	13	24
925	Forbestown	forbestown	13	29
926	Forest Knolls	forest-knolls	13	25
927	Forest Ranch	forest-ranch	13	29
928	Foresthill	foresthill	13	26
929	Forestville	forestville	13	25
930	Fortuna	fortuna	13	31
931	Fountain Valley	fountain-valley	13	24
932	Fowler	fowler	13	27
933	Frazier Park	frazier-park	13	33
934	Freedom	freedom	13	30
935	Fremont	fremont	13	25
936	French Gulch	french-gulch	13	29
937	Fresno	fresno	13	27
938	Friant	friant	13	27
939	Fort Bragg	fort-bragg	13	25
940	Fort Irwin	fort-irwin	13	24
941	Fullerton	fullerton	13	24
942	Fulton	fulton	13	25
943	Galt	galt	13	26
944	Garberville	garberville	13	31
945	Garden Grove	garden-grove	13	24
946	Gardena	gardena	13	24
947	Gazelle	gazelle	13	37
948	Georgetown	georgetown	13	26
949	Geyserville	geyserville	13	25
950	Gilroy	gilroy	13	25
951	Glen Ellen	glen-ellen	13	25
952	Glendale	glendale	13	24
953	Glendora	glendora	13	24
954	Glennville	glennville	13	33
955	Goleta	goleta	13	32
956	Gonzales	gonzales	13	30
957	Grand Terrace	grand-terrace	13	24
958	Grass Valley	grass-valley	13	26
959	Greenfield	greenfield	13	30
960	Greenville	greenville	13	26
961	Greenwood	greenwood	13	26
962	Grenada	grenada	13	37
963	Gridley	gridley	13	29
964	Grizzly Flats	grizzly-flats	13	26
965	Groveland	groveland	13	26
966	Grover Beach	grover-beach	13	32
967	Guadalupe	guadalupe	13	32
968	Gualala	gualala	13	25
969	Guerneville	guerneville	13	25
970	Guinda	guinda	13	26
971	Gustine	gustine	13	27
972	Hacienda Heights	hacienda-heights	13	24
973	Half Moon Bay	half-moon-bay	13	25
974	Hanford	hanford	13	27
975	Happy Camp	happy-camp	13	37
976	Hawthorne	hawthorne	13	24
977	Hayfork	hayfork	13	29
978	Hayward	hayward	13	25
979	Healdsburg	healdsburg	13	25
980	Heber	heber	13	34
981	Helendale	helendale	13	24
982	Hemet	hemet	13	24
983	Herald	herald	13	26
984	Hercules	hercules	13	25
985	Herlong	herlong	13	35
986	Hermosa Beach	hermosa-beach	13	24
987	Hesperia	hesperia	13	24
988	Hickman	hickman	13	26
989	Highland	highland	13	24
990	Hilmar	hilmar	13	27
991	Hollister	hollister	13	30
992	Holtville	holtville	13	34
993	Homeland	homeland	13	24
994	Homewood	homewood	13	26
995	Honeydew	honeydew	13	31
996	Hoopa	hoopa	13	31
997	Hornbrook	hornbrook	13	37
998	Hughson	hughson	13	26
999	Huntington Beach	huntington-beach	13	24
1000	Huntington Park	huntington-park	13	24
1001	Huron	huron	13	27
1002	Hydesville	hydesville	13	31
1003	Igo	igo	13	29
1004	Imperial	imperial	13	34
1005	Imperial Beach	imperial-beach	13	28
1006	Independence	independence	13	24
1007	Indian Wells	indian-wells	13	36
1008	Indio	indio	13	36
1009	Inglewood	inglewood	13	24
1010	Inverness	inverness	13	25
1011	Ione	ione	13	26
1012	Irvine	irvine	13	24
1013	Isleton	isleton	13	26
1014	Ivanhoe	ivanhoe	13	27
1015	Jackson	jackson	13	26
1016	Jacumba Hot Springs	jacumba-hot-springs	13	28
1017	Jamestown	jamestown	13	26
1018	Jamul	jamul	13	28
1019	Jenner	jenner	13	25
1020	Joshua Tree	joshua-tree	13	24
1021	Julian	julian	13	28
1022	June Lake	june-lake	13	35
1023	Kelseyville	kelseyville	13	25
1024	Kentfield	kentfield	13	25
1025	Kenwood	kenwood	13	25
1026	Kerman	kerman	13	27
1027	Kernville	kernville	13	33
1028	King City	king-city	13	30
1029	Kings Beach	kings-beach	13	26
1030	Kings Canyon National Park	kings-canyon-national-park	13	27
1031	Kingsburg	kingsburg	13	27
1032	Klamath	klamath	13	31
1033	Kneeland	kneeland	13	31
1034	Knights Landing	knights-landing	13	26
1035	Knightsen	knightsen	13	25
1036	La Canada Flintridge	la-canada-flintridge	13	24
1037	La Crescenta-Montrose	la-crescenta-montrose	13	24
1038	La Habra	la-habra	13	24
1039	La Honda	la-honda	13	25
1040	La Mesa	la-mesa	13	28
1041	La Mirada	la-mirada	13	24
1042	La Palma	la-palma	13	24
1043	La Puente	la-puente	13	24
1044	La Quinta	la-quinta	13	36
1045	La Verne	la-verne	13	24
1046	Ladera Ranch	ladera-ranch	13	24
1047	Lafayette	lafayette	13	25
1048	Laguna Beach	laguna-beach	13	24
1049	Laguna Hills	laguna-hills	13	24
1050	Laguna Niguel	laguna-niguel	13	24
1051	Lake Arrowhead	lake-arrowhead	13	24
1052	Lake Elsinore	lake-elsinore	13	24
1053	Lake Forest	lake-forest	13	24
1054	Lake Hughes	lake-hughes	13	24
1055	Lake Isabella	lake-isabella	13	33
1056	Lakeport	lakeport	13	25
1057	Lakeside	lakeside	13	28
1058	Lakewood	lakewood	13	24
1059	Lancaster	lancaster	13	24
1060	Larkspur	larkspur	13	25
1061	Lathrop	lathrop	13	26
1062	Laton	laton	13	27
1063	Lawndale	lawndale	13	24
1064	Laytonville	laytonville	13	25
1065	Le Grand	le-grand	13	27
1066	Lebec	lebec	13	33
1067	Lee Vining	lee-vining	13	35
1068	Leggett	leggett	13	25
1069	Lemon Cove	lemon-cove	13	27
1070	Lemon Grove	lemon-grove	13	28
1071	Lemoore	lemoore	13	27
1072	Lewiston	lewiston	13	29
1073	Lincoln	lincoln	13	26
1074	Linden	linden	13	26
1075	Lindsay	lindsay	13	27
1076	Littlerock	littlerock	13	24
1077	Live Oak	live-oak	13	26
1078	Livermore	livermore	13	25
1079	Livingston	livingston	13	27
1080	Lockeford	lockeford	13	26
1081	Lodi	lodi	13	26
1082	Loma Linda	loma-linda	13	24
1083	Lomita	lomita	13	24
1084	Lompoc	lompoc	13	32
1085	Lone Pine	lone-pine	13	24
1086	Long Beach	long-beach	13	24
1087	Loomis	loomis	13	26
1088	Los Alamitos	los-alamitos	13	24
1089	Los Altos	los-altos	13	25
1090	Los Angeles	los-angeles	13	24
1091	Los Banos	los-banos	13	27
1092	Los Gatos	los-gatos	13	25
1093	Los Molinos	los-molinos	13	29
1094	Los Olivos	los-olivos	13	32
1095	Lost Hills	lost-hills	13	33
1096	Lower Lake	lower-lake	13	25
1097	Loyalton	loyalton	13	26
1098	Lucerne	lucerne	13	25
1099	Lucerne Valley	lucerne-valley	13	24
1100	Lynwood	lynwood	13	24
1101	Lyoth	lyoth	13	26
1102	Mad River	mad-river	13	29
1103	Madera	madera	13	27
1104	Magalia	magalia	13	29
1105	Malibu	malibu	13	24
1106	Mammoth Lakes	mammoth-lakes	13	35
1107	Manhattan Beach	manhattan-beach	13	24
1108	Manteca	manteca	13	26
1109	March Air Reserve Base	march-air-reserve-base	13	24
1110	Marina	marina	13	30
1111	Marina del Rey	marina-del-rey	13	24
1112	Mariposa	mariposa	13	27
1113	Markleeville	markleeville	13	35
1114	Marshall	marshall	13	25
1115	Martinez	martinez	13	25
1116	Marysville	marysville	13	26
1117	Mather	mather	13	26
1118	Maxwell	maxwell	13	26
1119	Maywood	maywood	13	24
1120	McFarland	mcfarland	13	33
1121	McKittrick	mckittrick	13	33
1122	McClellan Park	mcclellan-park	13	26
1123	McKinleyville	mckinleyville	13	31
1124	Meadow Vista	meadow-vista	13	26
1125	Mecca	mecca	13	36
1126	Mendocino	mendocino	13	25
1127	Mendota	mendota	13	27
1128	Menifee	menifee	13	24
1129	Menlo Park	menlo-park	13	25
1130	Mentone	mentone	13	24
1131	Merced	merced	13	27
1132	Meridian	meridian	13	26
1133	Mi-Wuk Village	mi-wuk-village	13	26
1134	Middletown	middletown	13	25
1135	Midway City	midway-city	13	24
1136	Mill Valley	mill-valley	13	25
1137	Millbrae	millbrae	13	25
1138	Millville	millville	13	29
1139	Milpitas	milpitas	13	25
1140	Mira Loma	mira-loma	13	24
1141	Miramonte	miramonte	13	27
1142	Miranda	miranda	13	31
1143	Mission Viejo	mission-viejo	13	24
1144	Moccasin	moccasin	13	26
1145	Modesto	modesto	13	26
1146	Mojave	mojave	13	24
1147	Mokelumne Hill	mokelumne-hill	13	26
1148	Monrovia	monrovia	13	24
1149	Montague	montague	13	37
1150	Montara	montara	13	25
1151	Montclair	montclair	13	24
1152	Monte Rio	monte-rio	13	25
1153	Montebello	montebello	13	24
1154	Monterey	monterey	13	30
1155	Monterey Park	monterey-park	13	24
1156	Moorpark	moorpark	13	24
1157	Moraga	moraga	13	25
1158	Moreno Valley	moreno-valley	13	24
1159	Morgan Hill	morgan-hill	13	25
1160	Morro Bay	morro-bay	13	32
1161	Moss Beach	moss-beach	13	25
1162	Moss Landing	moss-landing	13	30
1163	Mount Baldy	mount-baldy	13	24
1164	Mount Hamilton	mount-hamilton	13	25
1165	Mount Laguna	mount-laguna	13	28
1166	Mount Shasta	mount-shasta	13	37
1167	Mount Wilson	mount-wilson	13	24
1168	Mountain View	mountain-view	13	25
1169	Murrieta	murrieta	13	24
1170	Napa	napa	13	25
1171	National City	national-city	13	28
1172	Navarro	navarro	13	25
1173	Needles	needles	13	24
1174	Nevada City	nevada-city	13	26
1175	New Cuyama	new-cuyama	13	32
1176	Newark	newark	13	25
1177	Newberry Springs	newberry-springs	13	24
1178	Newcastle	newcastle	13	26
1179	Newman	newman	13	26
1180	Newport Beach	newport-beach	13	24
1181	Nicasio	nicasio	13	25
1182	Nicolaus	nicolaus	13	26
1183	Nipomo	nipomo	13	32
1184	Norco	norco	13	24
1185	Norden	norden	13	26
1186	North Fork	north-fork	13	27
1187	North Highlands	north-highlands	13	26
1188	Desert Hot Springs	desert-hot-springs	13	36
1189	North San Juan	north-san-juan	13	26
1190	Norwalk	norwalk	13	24
1191	Novato	novato	13	25
1192	Nuevo	nuevo	13	24
1193	O Neals	o-neals	13	27
1194	Oak Park	oak-park	13	24
1195	Oak View	oak-view	13	24
1196	Oakdale	oakdale	13	26
1197	Oakhurst	oakhurst	13	27
1198	Oakland	oakland	13	25
1199	Oakley	oakley	13	25
1200	Oakville	oakville	13	25
1201	Occidental	occidental	13	25
1202	Oceano	oceano	13	32
1203	Oceanside	oceanside	13	28
1204	Ojai	ojai	13	24
1205	Olancha	olancha	13	24
1206	Olympic Valley	olympic-valley	13	26
1207	Ontario	ontario	13	24
1208	Orange	orange	13	24
1209	Orangevale	orangevale	13	26
1210	Orinda	orinda	13	25
1211	Orland	orland	13	29
1212	Orleans	orleans	13	31
1213	Oro Grande	oro-grande	13	24
1214	Orosi	orosi	13	27
1215	Oroville	oroville	13	29
1216	Oxnard	oxnard	13	24
1217	Pacific Grove	pacific-grove	13	30
1218	Pacifica	pacifica	13	25
1219	Pala	pala	13	28
1220	Palm Desert	palm-desert	13	36
1221	Palm Springs	palm-springs	13	36
1222	Palmdale	palmdale	13	24
1223	Palo Alto	palo-alto	13	25
1224	Palo Cedro	palo-cedro	13	29
1225	Palomar Mountain	palomar-mountain	13	28
1226	Palos Verdes Peninsula	palos-verdes-peninsula	13	24
1227	Paradise	paradise	13	29
1228	Paramount	paramount	13	24
1229	Parker Dam	parker-dam	13	24
1230	Parlier	parlier	13	27
1231	Pasadena	pasadena	13	24
1232	Paskenta	paskenta	13	29
1233	Paso Robles	paso-robles	13	32
1234	Patterson	patterson	13	26
1235	Pearblossom	pearblossom	13	24
1236	Penn Valley	penn-valley	13	26
1237	Penngrove	penngrove	13	25
1238	Penryn	penryn	13	26
1239	Perris	perris	13	24
1240	Pescadero	pescadero	13	25
1241	Petaluma	petaluma	13	25
1242	Petrolia	petrolia	13	31
1243	Phelan	phelan	13	24
1244	Phillipsville	phillipsville	13	31
1245	Pico Rivera	pico-rivera	13	24
1246	Piedmont	piedmont	13	25
1247	Piercy	piercy	13	25
1248	Pine Grove	pine-grove	13	26
1249	Pine Valley	pine-valley	13	28
1250	Pinecrest	pinecrest	13	26
1251	Pinole	pinole	13	25
1252	Pismo Beach	pismo-beach	13	32
1253	Pittsburg	pittsburg	13	25
1254	Pixley	pixley	13	27
1255	Placentia	placentia	13	24
1256	Placerville	placerville	13	26
1257	Planada	planada	13	27
1258	Pleasant Grove	pleasant-grove	13	26
1259	Pleasant Hill	pleasant-hill	13	25
1260	Pleasanton	pleasanton	13	25
1261	Plymouth	plymouth	13	26
1262	Point Arena	point-arena	13	25
1263	Naval Air Station Point Mugu	naval-air-station-point-mugu	13	24
1264	Point Reyes Station	point-reyes-station	13	25
1265	Pollock Pines	pollock-pines	13	26
1266	Pomona	pomona	13	24
1267	Port Costa	port-costa	13	25
1268	Port Hueneme	port-hueneme	13	24
1269	Naval Construction Battalion Center Port Hueneme	naval-construction-battalion-center-port-hueneme	13	24
1270	Porterville	porterville	13	27
1271	Portola	portola	13	26
1272	Portola Valley	portola-valley	13	25
1273	Poway	poway	13	28
1274	Quincy	quincy	13	26
1275	Raisin City	raisin-city	13	27
1276	Rancho Cordova	rancho-cordova	13	26
1277	Rancho Cucamonga	rancho-cucamonga	13	24
1278	Rancho Mirage	rancho-mirage	13	36
1279	Rancho Palos Verdes	rancho-palos-verdes	13	24
1280	Rancho Santa Fe	rancho-santa-fe	13	28
1281	Rancho Santa Margarita	rancho-santa-margarita	13	24
1282	Randsburg	randsburg	13	24
1283	Raymond	raymond	13	27
1284	Red Bluff	red-bluff	13	29
1285	Redding	redding	13	29
1286	Redlands	redlands	13	24
1287	Redondo Beach	redondo-beach	13	24
1288	Redwood City	redwood-city	13	25
1289	Redwood Valley	redwood-valley	13	25
1290	Reedley	reedley	13	27
1291	Rescue	rescue	13	26
1292	Rialto	rialto	13	24
1293	Richgrove	richgrove	13	27
1294	Richmond	richmond	13	25
1295	Richvale	richvale	13	29
1296	Ridgecrest	ridgecrest	13	24
1297	Rio Dell	rio-dell	13	31
1298	Rio Linda	rio-linda	13	26
1299	Rio Oso	rio-oso	13	26
1300	Rio Vista	rio-vista	13	26
1301	Ripon	ripon	13	26
1302	Riverbank	riverbank	13	26
1303	Riverdale	riverdale	13	27
1304	Riverside	riverside	13	24
1305	Robbins	robbins	13	26
1306	Rocklin	rocklin	13	26
1307	Rodeo	rodeo	13	25
1308	Rohnert Park	rohnert-park	13	25
1309	Rosamond	rosamond	13	24
1310	Rosemead	rosemead	13	24
1311	Roseville	roseville	13	26
1312	Ross	ross	13	25
1313	Rough and Ready	rough-and-ready	13	26
1314	Rowland Heights	rowland-heights	13	24
1315	Sacramento	sacramento	13	26
1316	Salida	salida	13	26
1317	Salinas	salinas	13	30
1318	San Andreas	san-andreas	13	26
1319	San Anselmo	san-anselmo	13	25
1320	San Ardo	san-ardo	13	30
1321	San Bernardino	san-bernardino	13	24
1322	San Bruno	san-bruno	13	25
1323	San Carlos	san-carlos	13	25
1324	San Clemente	san-clemente	13	24
1325	San Diego	san-diego	13	28
1326	San Dimas	san-dimas	13	24
1327	San Fernando	san-fernando	13	24
1328	San Francisco	san-francisco	13	25
1329	San Gabriel	san-gabriel	13	24
1330	San Gregorio	san-gregorio	13	25
1331	San Jacinto	san-jacinto	13	24
1332	San Joaquin	san-joaquin	13	27
1333	San Jose	san-jose	13	25
1334	San Juan Bautista	san-juan-bautista	13	30
1335	San Juan Capistrano	san-juan-capistrano	13	24
1336	San Leandro	san-leandro	13	25
1337	San Lorenzo	san-lorenzo	13	25
1338	San Lucas	san-lucas	13	30
1339	San Luis Obispo	san-luis-obispo	13	32
1340	San Marcos	san-marcos	13	28
1341	San Marino	san-marino	13	24
1342	San Martin	san-martin	13	25
1343	San Mateo	san-mateo	13	25
1344	San Miguel	san-miguel	13	32
1345	San Pablo	san-pablo	13	25
1346	San Quentin	san-quentin	13	25
1347	San Rafael	san-rafael	13	25
1348	San Ramon	san-ramon	13	25
1349	San Simeon	san-simeon	13	32
1350	Sanger	sanger	13	27
1351	Santa Ana	santa-ana	13	24
1352	Santa Barbara	santa-barbara	13	32
1353	Santa Clara	santa-clara	13	25
1354	Santa Clarita	santa-clarita	13	24
1355	Santa Cruz	santa-cruz	13	30
1356	Santa Fe Springs	santa-fe-springs	13	24
1357	Santa Margarita	santa-margarita	13	32
1358	Santa Maria	santa-maria	13	32
1359	Santa Monica	santa-monica	13	24
1360	Santa Paula	santa-paula	13	24
1361	Santa Rosa	santa-rosa	13	25
1362	Santa Ynez	santa-ynez	13	32
1363	Santee	santee	13	28
1364	Saratoga	saratoga	13	25
1365	Sausalito	sausalito	13	25
1366	Scotts Valley	scotts-valley	13	30
1367	Seal Beach	seal-beach	13	24
1368	Seaside	seaside	13	30
1369	Sebastopol	sebastopol	13	25
1370	Selma	selma	13	27
1371	Sequoia National Park	sequoia-national-park	13	27
1372	Shafter	shafter	13	33
1373	Shandon	shandon	13	32
1374	Shasta	shasta	13	29
1375	Shasta Lake	shasta-lake	13	29
1376	Sheep Ranch	sheep-ranch	13	26
1377	Shingle Springs	shingle-springs	13	26
1378	Shoshone	shoshone	13	24
1379	Sierra Madre	sierra-madre	13	24
1380	Sierraville	sierraville	13	26
1381	Silverado	silverado	13	24
1382	Simi Valley	simi-valley	13	24
1383	Sloughhouse	sloughhouse	13	26
1384	Smartsville	smartsville	13	26
1385	Snelling	snelling	13	27
1386	Soda Springs	soda-springs	13	26
1387	Solana Beach	solana-beach	13	28
1388	Soledad	soledad	13	30
1389	Solvang	solvang	13	32
1390	Somis	somis	13	24
1391	Sonoma	sonoma	13	25
1392	Sonora	sonora	13	26
1393	Soquel	soquel	13	30
1394	South El Monte	south-el-monte	13	24
1395	South Gate	south-gate	13	24
1396	South Lake Tahoe	south-lake-tahoe	13	35
1397	South Pasadena	south-pasadena	13	24
1398	South San Francisco	south-san-francisco	13	25
1399	Spreckels	spreckels	13	30
1400	Spring Valley	spring-valley	13	28
1401	Springville	springville	13	27
1402	Squaw Valley	squaw-valley	13	27
1403	Saint Helena	saint-helena	13	25
1404	Stanford	stanford	13	25
1405	Stanton	stanton	13	24
1406	Stevenson Ranch	stevenson-ranch	13	24
1407	Stevinson	stevinson	13	27
1408	Stinson Beach	stinson-beach	13	25
1409	Stockton	stockton	13	26
1410	Stonyford	stonyford	13	26
1411	Strathmore	strathmore	13	27
1412	Suisun City	suisun-city	13	26
1413	Sultana	sultana	13	27
1414	Sunnyvale	sunnyvale	13	25
1415	Sunol	sunol	13	25
1416	Susanville	susanville	13	35
1417	Sutter	sutter	13	26
1418	Sutter Creek	sutter-creek	13	26
1419	Taft	taft	13	33
1420	Tahoe City	tahoe-city	13	26
1421	Tahoe Vista	tahoe-vista	13	26
1422	Tehachapi	tehachapi	13	33
1423	Temecula	temecula	13	24
1424	Temple City	temple-city	13	24
1425	Templeton	templeton	13	32
1426	Thermal	thermal	13	36
1427	Thornton	thornton	13	26
1428	Thousand Oaks	thousand-oaks	13	24
1429	Thousand Palms	thousand-palms	13	36
1430	Three Rivers	three-rivers	13	27
1431	Tipton	tipton	13	27
1432	Tollhouse	tollhouse	13	27
1433	Tomales	tomales	13	25
1434	Topanga	topanga	13	24
1435	Torrance	torrance	13	24
1436	Trabuco Canyon	trabuco-canyon	13	24
1437	Tracy	tracy	13	26
1438	Tranquillity	tranquillity	13	27
1439	Traver	traver	13	27
1440	Travis Air Force Base	travis-air-force-base	13	26
1441	Truckee	truckee	13	26
1442	Tulare	tulare	13	27
1443	Tulelake	tulelake	13	37
1444	Tupman	tupman	13	33
1445	Turlock	turlock	13	26
1446	Tustin	tustin	13	24
1447	Twain Harte	twain-harte	13	26
1448	Twentynine Palms	twentynine-palms	13	24
1449	Twin Peaks	twin-peaks	13	24
1450	Ukiah	ukiah	13	25
1451	Union City	union-city	13	25
1452	Universal City	universal-city	13	24
1453	Upland	upland	13	24
1454	Upper Lake	upper-lake	13	25
1455	Vacaville	vacaville	13	26
1456	Vallejo	vallejo	13	25
1457	Valley Center	valley-center	13	28
1458	Valley Springs	valley-springs	13	26
1459	Venice	venice	13	24
1460	Ventura	ventura	13	24
1461	Victorville	victorville	13	24
1462	Vidal	vidal	13	24
1463	Villa Park	villa-park	13	24
1464	Visalia	visalia	13	27
1465	Vista	vista	13	28
1466	Wallace	wallace	13	26
1467	Walnut	walnut	13	24
1468	Walnut Creek	walnut-creek	13	25
1469	Warner Springs	warner-springs	13	28
1470	Wasco	wasco	13	33
1471	Washington	washington	13	26
1472	Waterford	waterford	13	26
1473	Watsonville	watsonville	13	30
1474	Waukena	waukena	13	27
1475	Weaverville	weaverville	13	29
1476	Weed	weed	13	37
1477	Weldon	weldon	13	33
1478	Weott	weott	13	31
1479	West Covina	west-covina	13	24
1480	West Hollywood	west-hollywood	13	24
1481	West Sacramento	west-sacramento	13	26
1482	Westlake Village	westlake-village	13	24
1483	Westley	westley	13	26
1484	Westminster	westminster	13	24
1485	Westmorland	westmorland	13	34
1486	Westwood	westwood	13	35
1487	Wheatland	wheatland	13	26
1488	Whitethorn	whitethorn	13	31
1489	Whittier	whittier	13	24
1490	Wildomar	wildomar	13	24
1491	Williams	williams	13	26
1492	Willits	willits	13	25
1493	Willow Creek	willow-creek	13	31
1494	Willows	willows	13	29
1495	Wilton	wilton	13	26
1496	Winchester	winchester	13	24
1497	Windsor	windsor	13	25
1498	Winterhaven	winterhaven	13	34
1499	Winters	winters	13	26
1500	Woodacre	woodacre	13	25
1501	Woodbridge	woodbridge	13	26
1502	Woodlake	woodlake	13	27
1503	Woodland	woodland	13	26
1504	Wrightwood	wrightwood	13	24
1505	Yermo	yermo	13	24
1506	Yolo	yolo	13	26
1507	Yorba Linda	yorba-linda	13	24
1508	Yosemite Valley	yosemite-valley	13	27
1509	Yountville	yountville	13	25
1510	Yreka	yreka	13	37
1511	Yuba City	yuba-city	13	26
1512	Yucaipa	yucaipa	13	24
1513	Yucca Valley	yucca-valley	13	24
1514	New Pine Creek	new-pine-creek	13	37
1515	Alta Sierra	alta-sierra	13	26
1516	Arden-Arcade	arden-arcade	13	26
1517	Avocado Heights	avocado-heights	13	24
1518	Bay Point	bay-point	13	25
1519	Baywood-Los Osos	baywood-los-osos	13	32
1520	Blackhawk	blackhawk	13	25
1521	Bonita	bonita	13	28
1522	Cameron Park	cameron-park	13	26
1523	Camp Pendleton South	camp-pendleton-south	13	28
1524	Canyon Lake	canyon-lake	13	24
1525	Commerce	commerce	13	24
1526	Cotati	cotati	13	25
1527	Coto de Caza	coto-de-caza	13	24
1528	Del Monte Forest	del-monte-forest	13	30
1529	Discovery Bay	discovery-bay	13	25
1530	East Whittier	east-whittier	13	24
1531	East Los Angeles	east-los-angeles	13	24
1532	East Palo Alto	east-palo-alto	13	25
1533	Eastvale	eastvale	13	24
1534	Edwards Air Force Base	edwards-air-force-base	13	24
1535	El Camino Village	el-camino-village	13	24
1536	Florence-Graham	florence-graham	13	24
1537	Florin	florin	13	26
1538	Foothill Farms	foothill-farms	13	26
1539	Foster City	foster-city	13	25
1540	Furnace Creek	furnace-creek	13	24
1541	Gold River	gold-river	13	26
1542	Granite Bay	granite-bay	13	26
1543	Graton	graton	13	25
1544	Happy Valley	happy-valley	13	29
1545	Hawaiian Gardens	hawaiian-gardens	13	24
1546	Hidden Meadows	hidden-meadows	13	28
1547	Hillsborough	hillsborough	13	25
1548	Idyllwild-Pine Cove	idyllwild-pine-cove	13	24
1549	Irwindale	irwindale	13	24
1550	Isla Vista	isla-vista	13	32
1551	Janesville	janesville	13	35
1552	La Riviera	la-riviera	13	26
1553	Laguna Woods	laguna-woods	13	24
1554	Lake of the Pines	lake-of-the-pines	13	26
1555	Linda	linda	13	26
1556	Live Oak	live-oak	13	30
1557	Los Altos Hills	los-altos-hills	13	25
1558	Lucas Valley-Marinwood	lucas-valley-marinwood	13	25
1559	Montecito	montecito	13	32
1560	North Tustin	north-tustin	13	24
1561	Oildale	oildale	13	33
1562	Olivehurst	olivehurst	13	26
1563	Orange Cove	orange-cove	13	27
1564	Orcutt	orcutt	13	32
1565	Pine Mountain Club	pine-mountain-club	13	33
1566	Prunedale	prunedale	13	30
1567	Rainbow	rainbow	13	28
1568	Rancho Calaveras	rancho-calaveras	13	26
1569	Rancho Murieta	rancho-murieta	13	26
1570	Rancho San Diego	rancho-san-diego	13	28
1571	Rosemont	rosemont	13	26
1572	Rossmoor	rossmoor	13	24
1573	Signal Hill	signal-hill	13	24
1574	South Whittier	south-whittier	13	24
1575	Tamalpais-Homestead Valley	tamalpais-homestead-valley	13	25
1576	Valle Vista	valle-vista	13	24
1577	Vandenberg Air Force Base	vandenberg-air-force-base	13	32
1578	Vineyard	vineyard	13	26
1579	West Carson	west-carson	13	24
1580	West Point	west-point	13	26
1581	West Rancho Dominguez	west-rancho-dominguez	13	24
1582	Willowbrook	willowbrook	13	24
1583	Woodcrest	woodcrest	13	24
1584	Woodside	woodside	13	25
1585	Yosemite Lakes	yosemite-lakes	13	27
1586	Agate	agate	1	38
1587	Akron	akron	1	38
1588	Alamosa	alamosa	1	38
1589	Allenspark	allenspark	1	38
1590	Alma	alma	1	38
1591	Anton	anton	1	38
1592	Arapahoe	arapahoe	1	38
1593	Arvada	arvada	1	38
1594	Aspen	aspen	1	38
1595	Ault	ault	1	38
1596	Aurora	aurora	1	38
1597	Avon	avon	1	38
1598	Bailey	bailey	1	38
1599	Basalt	basalt	1	38
1600	Bayfield	bayfield	1	39
1601	Bennett	bennett	1	38
1602	Berthoud	berthoud	1	38
1603	Bethune	bethune	1	38
1604	Black Hawk	black-hawk	1	38
1605	Boulder	boulder	1	38
1606	Breckenridge	breckenridge	1	38
1607	Briggsdale	briggsdale	1	38
1608	Brighton	brighton	1	38
1609	Broomfield	broomfield	1	38
1610	Brush	brush	1	38
1611	Buena Vista	buena-vista	1	38
1612	Buffalo Creek	buffalo-creek	1	38
1613	Burlington	burlington	1	38
1614	Byers	byers	1	38
1615	Calhan	calhan	1	40
1616	Campo	campo	1	40
1617	Canon City	canon-city	1	40
1618	Carbondale	carbondale	1	38
1619	Castle Rock	castle-rock	1	38
1620	Cedaredge	cedaredge	1	38
1621	Center	center	1	38
1622	Central City	central-city	1	38
1623	Cheraw	cheraw	1	40
1624	Cheyenne Wells	cheyenne-wells	1	38
1625	Clifton	clifton	1	41
1626	Coal Creek	coal-creek	1	40
1627	Collbran	collbran	1	41
1628	Colorado Springs	colorado-springs	1	40
1629	Commerce City	commerce-city	1	38
1630	Aspen Park	aspen-park	1	38
1631	Cortez	cortez	1	39
1632	Craig	craig	1	38
1633	Crawford	crawford	1	38
1634	Creede	creede	1	38
1635	Crested Butte	crested-butte	1	38
1636	Cripple Creek	cripple-creek	1	40
1637	Dacono	dacono	1	38
1638	De Beque	de-beque	1	41
1639	Deer Trail	deer-trail	1	38
1640	Del Norte	del-norte	1	38
1641	Delta	delta	1	38
1642	Denver	denver	1	38
1643	Dillon	dillon	1	38
1644	Dinosaur	dinosaur	1	38
1645	Divide	divide	1	40
1646	Dolores	dolores	1	39
1647	Dove Creek	dove-creek	1	38
1648	Dupont	dupont	1	38
1649	Durango	durango	1	39
1650	Eagle	eagle	1	38
1651	Eaton	eaton	1	38
1652	Edwards	edwards	1	38
1653	Elbert	elbert	1	38
1654	Eldorado Springs	eldorado-springs	1	38
1655	Elizabeth	elizabeth	1	38
1656	Empire	empire	1	38
1657	Englewood	englewood	1	38
1658	Erie	erie	1	38
1659	Estes Park	estes-park	1	38
1660	Evergreen	evergreen	1	38
1661	Fairplay	fairplay	1	38
1662	Firestone	firestone	1	38
1663	Fleming	fleming	1	38
1664	Florence	florence	1	40
1665	Florissant	florissant	1	40
1666	Fountain	fountain	1	40
1667	Franktown	franktown	1	38
1668	Frederick	frederick	1	38
1669	Frisco	frisco	1	38
1670	Fruita	fruita	1	41
1671	Fort Collins	fort-collins	1	38
1672	Fort Lupton	fort-lupton	1	38
1673	Fort Morgan	fort-morgan	1	38
1674	Georgetown	georgetown	1	38
1675	Gilcrest	gilcrest	1	38
1676	Glen Haven	glen-haven	1	38
1677	Glenwood Springs	glenwood-springs	1	38
1678	Golden	golden	1	38
1679	Granby	granby	1	38
1680	Grand Junction	grand-junction	1	41
1681	Grand Lake	grand-lake	1	38
1682	Grant	grant	1	38
1683	Greeley	greeley	1	38
1684	Grover	grover	1	38
1685	Guffey	guffey	1	38
1686	Gunnison	gunnison	1	38
1687	Gypsum	gypsum	1	38
1688	Hartman	hartman	1	38
1689	Haxtun	haxtun	1	38
1690	Hayden	hayden	1	38
1691	Henderson	henderson	1	38
1692	Holyoke	holyoke	1	38
1693	Hot Sulphur Springs	hot-sulphur-springs	1	38
1694	Hotchkiss	hotchkiss	1	38
1695	Hudson	hudson	1	38
1696	Hugo	hugo	1	38
1697	Hygiene	hygiene	1	38
1698	Idaho Springs	idaho-springs	1	38
1699	Idledale	idledale	1	38
1700	Ignacio	ignacio	1	39
1701	Indian Hills	indian-hills	1	38
1702	Jamestown	jamestown	1	38
1703	Jefferson	jefferson	1	38
1704	Joes	joes	1	38
1705	Johnstown	johnstown	1	38
1706	Julesburg	julesburg	1	38
1707	Keenesburg	keenesburg	1	38
1708	Kersey	kersey	1	38
1709	Kiowa	kiowa	1	38
1710	Kittredge	kittredge	1	38
1711	Kremmling	kremmling	1	38
1712	La Jara	la-jara	1	38
1713	La Junta	la-junta	1	40
1714	La Salle	la-salle	1	38
1715	Lafayette	lafayette	1	38
1716	Lamar	lamar	1	38
1717	Laporte	laporte	1	38
1718	Larkspur	larkspur	1	38
1719	Las Animas	las-animas	1	40
1720	Leadville	leadville	1	38
1721	Limon	limon	1	38
1722	Littleton	littleton	1	38
1723	Livermore	livermore	1	38
1724	Longmont	longmont	1	38
1725	Louisville	louisville	1	38
1726	Louviers	louviers	1	38
1727	Loveland	loveland	1	38
1728	Lyons	lyons	1	38
1729	Mancos	mancos	1	39
1730	Manitou Springs	manitou-springs	1	40
1731	Mead	mead	1	38
1732	Meeker	meeker	1	38
1733	Merino	merino	1	38
1734	Mesa	mesa	1	41
1735	Minturn	minturn	1	38
1736	Moffat	moffat	1	38
1737	Monte Vista	monte-vista	1	38
1738	Montrose	montrose	1	41
1739	Monument	monument	1	40
1740	Morrison	morrison	1	38
1741	Nederland	nederland	1	38
1742	New Castle	new-castle	1	38
1743	Raymer	raymer	1	38
1744	Niwot	niwot	1	38
1745	Nucla	nucla	1	41
1746	Nunn	nunn	1	38
1747	Oak Creek	oak-creek	1	38
1748	Otis	otis	1	38
1749	Ouray	ouray	1	38
1750	Ovid	ovid	1	38
1751	Pagosa Springs	pagosa-springs	1	38
1752	Palmer Lake	palmer-lake	1	40
1753	Paonia	paonia	1	38
1754	Parachute	parachute	1	38
1755	Parker	parker	1	38
1756	Peetz	peetz	1	38
1757	Penrose	penrose	1	40
1758	Peyton	peyton	1	40
1759	Pine	pine	1	38
1760	Pinecliffe	pinecliffe	1	38
1761	Pitkin	pitkin	1	38
1762	Platteville	platteville	1	38
1763	Pleasant View	pleasant-view	1	39
1764	Pueblo	pueblo	1	40
1765	Rangely	rangely	1	38
1766	Red Feather Lakes	red-feather-lakes	1	38
1767	Ridgway	ridgway	1	38
1768	Rifle	rifle	1	38
1769	Rocky Ford	rocky-ford	1	40
1770	Roggen	roggen	1	38
1771	Rye	rye	1	40
1772	Saguache	saguache	1	38
1773	Salida	salida	1	38
1774	San Luis	san-luis	1	38
1775	Sanford	sanford	1	38
1776	Sedalia	sedalia	1	38
1777	Shawnee	shawnee	1	38
1778	Silt	silt	1	38
1779	Silver Plume	silver-plume	1	38
1780	Silverthorne	silverthorne	1	38
1781	Silverton	silverton	1	38
1782	Simla	simla	1	38
1783	Snowmass	snowmass	1	38
1784	Somerset	somerset	1	38
1785	Springfield	springfield	1	40
1786	Steamboat Springs	steamboat-springs	1	38
1787	Sterling	sterling	1	38
1788	Strasburg	strasburg	1	38
1789	Telluride	telluride	1	38
1790	Towaoc	towaoc	1	39
1791	Trinidad	trinidad	1	40
1792	U.S. Air Force Academy	u-s-air-force-academy	1	40
1793	Vail	vail	1	38
1794	Victor	victor	1	40
1795	Vilas	vilas	1	40
1796	Walden	walden	1	38
1797	Walsenburg	walsenburg	1	40
1798	Ward	ward	1	38
1799	Weldona	weldona	1	38
1800	Wellington	wellington	1	38
1801	Westcliffe	westcliffe	1	40
1802	Westminster	westminster	1	38
1803	Wheat Ridge	wheat-ridge	1	38
1804	Wiggins	wiggins	1	38
1805	Windsor	windsor	1	38
1806	Winter Park	winter-park	1	38
1807	Wolcott	wolcott	1	38
1808	Woodland Park	woodland-park	1	40
1809	Woody Creek	woody-creek	1	38
1810	Wray	wray	1	38
1811	Yuma	yuma	1	38
1812	Black Forest	black-forest	1	40
1813	Castle Pines	castle-pines	1	38
1814	Centennial	centennial	1	38
1815	Cherry Hills Village	cherry-hills-village	1	38
1816	Colorado City	colorado-city	1	40
1817	Columbine	columbine	1	38
1818	Flagler	flagler	1	38
1819	Fort Carson	fort-carson	1	40
1820	Fraser	fraser	1	38
1821	Glendale	glendale	1	38
1822	Greenwood Village	greenwood-village	1	38
1823	Highlands Ranch	highlands-ranch	1	38
1824	Ken Caryl	ken-caryl	1	38
1825	Keystone	keystone	1	38
1826	Lakewood	lakewood	1	38
1827	Lone Tree	lone-tree	1	38
1828	North Washington	north-washington	1	38
1829	Northglenn	northglenn	1	38
1830	Pueblo West	pueblo-west	1	40
1831	Roxborough Park	roxborough-park	1	38
1832	Security-Widefield	security-widefield	1	40
1833	Sherrelwood	sherrelwood	1	38
1834	Superior	superior	1	38
1835	The Pinery	the-pinery	1	38
1836	Thornton	thornton	1	38
1837	West Pleasant View	west-pleasant-view	1	38
1838	Woodmoor	woodmoor	1	40
1839	Andover	andover	24	42
1840	Ansonia	ansonia	24	42
1841	Ashford	ashford	24	42
1842	Avon	avon	24	42
1843	Barkhamsted	barkhamsted	24	42
1844	Beacon Falls	beacon-falls	24	42
1845	Berlin	berlin	24	42
1846	Bethany	bethany	24	42
1847	Bethlehem	bethlehem	24	42
1848	Bloomfield	bloomfield	24	42
1849	Bolton	bolton	24	42
1850	Bozrah	bozrah	24	42
1851	Branford	branford	24	42
1852	Bridgeport	bridgeport	24	43
1853	Bridgewater	bridgewater	24	42
1854	Bristol	bristol	24	42
1855	Brookfield	brookfield	24	43
1856	Brooklyn	brooklyn	24	42
1857	Burlington	burlington	24	42
1858	Canaan	canaan	24	42
1859	Canterbury	canterbury	24	42
1860	Canton	canton	24	42
1861	Chaplin	chaplin	24	42
1862	Cheshire	cheshire	24	42
1863	Chester	chester	24	42
1864	Clinton	clinton	24	42
1865	Colebrook	colebrook	24	42
1866	Columbia	columbia	24	42
1867	Cornwall	cornwall	24	42
1868	Coventry	coventry	24	42
1869	Cromwell	cromwell	24	42
1870	Danbury	danbury	24	43
1871	Darien	darien	24	43
1872	Derby	derby	24	42
1873	East Granby	east-granby	24	42
1874	East Haddam	east-haddam	24	42
1875	East Hartford	east-hartford	24	42
1876	East Haven	east-haven	24	42
1877	East Lyme	east-lyme	24	42
1878	East Windsor	east-windsor	24	42
1879	Eastford	eastford	24	42
1880	Easton	easton	24	43
1881	Ellington	ellington	24	42
1882	Enfield	enfield	24	42
1883	Essex	essex	24	42
1884	Fairfield	fairfield	24	43
1885	Farmington	farmington	24	42
1886	Georgetown	georgetown	24	43
1887	Glastonbury	glastonbury	24	42
1888	Goshen	goshen	24	42
1889	Granby	granby	24	42
1890	Greenwich	greenwich	24	43
1891	Haddam	haddam	24	42
1892	Hamden	hamden	24	42
1893	Hampton	hampton	24	42
1894	Hartford	hartford	24	42
1895	Harwinton	harwinton	24	42
1896	Hebron	hebron	24	42
1897	Kent	kent	24	42
1898	Killingworth	killingworth	24	42
1899	Lebanon	lebanon	24	42
1900	Ledyard	ledyard	24	42
1901	Marlborough	marlborough	24	42
1902	Meriden	meriden	24	42
1903	Middlebury	middlebury	24	42
1904	Middlefield	middlefield	24	42
1905	Middletown	middletown	24	42
1906	Milford	milford	24	42
1907	Monroe	monroe	24	43
1908	Montville	montville	24	42
1909	Morris	morris	24	42
1910	Naugatuck	naugatuck	24	42
1911	New Britain	new-britain	24	42
1912	New Canaan	new-canaan	24	43
1913	New Fairfield	new-fairfield	24	43
1914	New Hartford	new-hartford	24	42
1915	New Haven	new-haven	24	42
1916	New London	new-london	24	42
1917	New Milford	new-milford	24	42
1918	Newington	newington	24	42
1919	Norfolk	norfolk	24	42
1920	North Branford	north-branford	24	42
1921	North Haven	north-haven	24	42
1922	North Stonington	north-stonington	24	42
1923	Northford	northford	24	42
1924	Norwalk	norwalk	24	43
1925	Norwich	norwich	24	42
1926	Old Lyme	old-lyme	24	42
1927	Old Saybrook	old-saybrook	24	42
1928	Orange	orange	24	42
1929	Oxford	oxford	24	42
1930	Plainfield	plainfield	24	42
1931	Plainville	plainville	24	42
1932	Plymouth	plymouth	24	42
1933	Pomfret	pomfret	24	42
1934	Preston	preston	24	42
1935	Prospect	prospect	24	42
1936	Putnam	putnam	24	42
1937	Redding	redding	24	43
1938	Ridgefield	ridgefield	24	43
1939	Rocky Hill	rocky-hill	24	42
1940	Roxbury	roxbury	24	42
1941	Salem	salem	24	42
1942	Salisbury	salisbury	24	42
1943	Scotland	scotland	24	42
1944	Seymour	seymour	24	42
1945	Sharon	sharon	24	42
1946	Shelton	shelton	24	43
1947	Sherman	sherman	24	43
1948	Somers	somers	24	42
1949	South Windsor	south-windsor	24	42
1950	Southbury	southbury	24	42
1951	Southington	southington	24	42
1952	Stafford	stafford	24	42
1953	Stamford	stamford	24	43
1954	Sterling	sterling	24	42
1955	Stratford	stratford	24	43
1956	Suffield	suffield	24	42
1957	Thomaston	thomaston	24	42
1958	Thompson	thompson	24	42
1959	Tolland	tolland	24	42
1960	Torrington	torrington	24	42
1961	Trumbull	trumbull	24	43
1962	Vernon	vernon	24	42
1963	Voluntown	voluntown	24	42
1964	Washington	washington	24	42
1965	Waterbury	waterbury	24	42
1966	Watertown	watertown	24	42
1967	West Hartford	west-hartford	24	42
1968	West Hartland	west-hartland	24	42
1969	West Haven	west-haven	24	42
1970	Weston	weston	24	43
1971	Westport	westport	24	43
1972	Wethersfield	wethersfield	24	42
1973	Willington	willington	24	42
1974	Wilton	wilton	24	43
1975	Windham	windham	24	42
1976	Windsor	windsor	24	42
1977	Windsor Locks	windsor-locks	24	42
1978	Wolcott	wolcott	24	42
1979	Woodbridge	woodbridge	24	42
1980	Woodbury	woodbury	24	42
1981	Woodstock	woodstock	24	42
1982	Bethel	bethel	24	43
1983	Colchester	colchester	24	42
1984	Deep River	deep-river	24	42
1985	Durham	durham	24	42
1986	East Hampton	east-hampton	24	42
1987	Griswold	griswold	24	42
1988	Groton	groton	24	42
1989	Guilford	guilford	24	42
1990	Killingly	killingly	24	42
1991	Litchfield	litchfield	24	42
1992	Madison	madison	24	42
1993	Manchester	manchester	24	42
1994	Mansfield	mansfield	24	42
1995	Newtown	newtown	24	43
1996	Portland	portland	24	42
1997	Simsbury	simsbury	24	42
1998	Stonington	stonington	24	42
1999	Wallingford	wallingford	24	42
2000	Waterford	waterford	24	42
2001	Westbrook	westbrook	24	42
2002	Winchester	winchester	24	42
2003	Washington	washington	10	44
2004	Bear	bear	14	45
2005	Bethany Beach	bethany-beach	14	46
2006	Bridgeville	bridgeville	14	46
2007	Cheswold	cheswold	14	45
2008	Claymont	claymont	14	45
2009	Clayton	clayton	14	45
2010	Dagsboro	dagsboro	14	46
2011	Delaware City	delaware-city	14	45
2012	Delmar	delmar	14	46
2013	Dover	dover	14	45
2014	Dover Air Force Base	dover-air-force-base	14	45
2015	Felton	felton	14	45
2016	Fenwick Island	fenwick-island	14	46
2017	Frederica	frederica	14	45
2018	Georgetown	georgetown	14	46
2019	Greenwood	greenwood	14	46
2020	Harrington	harrington	14	45
2021	Hartly	hartly	14	45
2022	Hockessin	hockessin	14	45
2023	Houston	houston	14	45
2024	Kenton	kenton	14	45
2025	Laurel	laurel	14	46
2026	Lewes	lewes	14	46
2027	Little Creek	little-creek	14	45
2028	Magnolia	magnolia	14	45
2029	Middletown	middletown	14	45
2030	Milford	milford	14	46
2031	Millsboro	millsboro	14	46
2032	Milton	milton	14	46
2033	New Castle	new-castle	14	45
2034	Newark	newark	14	45
2035	Ocean View	ocean-view	14	46
2036	Odessa	odessa	14	45
2037	Rehoboth Beach	rehoboth-beach	14	46
2038	Rockland	rockland	14	45
2039	Seaford	seaford	14	46
2040	Selbyville	selbyville	14	46
2041	Smyrna	smyrna	14	45
2042	Saint Georges	saint-georges	14	45
2043	Townsend	townsend	14	45
2044	Viola	viola	14	45
2045	Wilmington	wilmington	14	45
2046	Winterthur	winterthur	14	45
2047	Woodside	woodside	14	45
2048	Yorklyn	yorklyn	14	45
2049	Bellefonte	bellefonte	14	45
2050	Brookside	brookside	14	45
2051	Edgemoor	edgemoor	14	45
2052	Elsmere	elsmere	14	45
2053	Glasgow	glasgow	14	45
2054	Greenville	greenville	14	45
2055	Long Neck	long-neck	14	46
2056	Newport	newport	14	45
2057	North Star	north-star	14	45
2058	Pike Creek	pike-creek	14	45
2059	Wilmington Manor	wilmington-manor	14	45
2060	Alachua	alachua	26	47
2061	Altamonte Springs	altamonte-springs	26	48
2062	Altha	altha	26	49
2063	Anna Maria	anna-maria	26	50
2064	Anthony	anthony	26	48
2065	Apalachicola	apalachicola	26	49
2066	Apopka	apopka	26	48
2067	Arcadia	arcadia	26	51
2068	Atlantic Beach	atlantic-beach	26	52
2069	Auburndale	auburndale	26	50
2070	Avon Park	avon-park	26	50
2071	Bartow	bartow	26	50
2072	Belle Glade	belle-glade	26	53
2073	Belleview	belleview	26	48
2074	Big Pine Key	big-pine-key	26	54
2075	Blountstown	blountstown	26	49
2076	Boca Grande	boca-grande	26	51
2077	Boca Raton	boca-raton	26	53
2078	Bonifay	bonifay	26	49
2079	Bonita Springs	bonita-springs	26	51
2080	Boynton Beach	boynton-beach	26	53
2081	Bradenton	bradenton	26	50
2082	Brandon	brandon	26	50
2083	Branford	branford	26	55
2084	Bronson	bronson	26	47
2085	Brooksville	brooksville	26	50
2086	Bunnell	bunnell	26	48
2087	Bushnell	bushnell	26	48
2088	Callahan	callahan	26	52
2089	Candler	candler	26	48
2090	Cape Canaveral	cape-canaveral	26	48
2091	Cape Coral	cape-coral	26	51
2092	Casselberry	casselberry	26	48
2093	Century	century	26	56
2094	Chattahoochee	chattahoochee	26	55
2095	Chiefland	chiefland	26	47
2096	Chipley	chipley	26	49
2097	Clarcona	clarcona	26	48
2098	Clearwater	clearwater	26	50
2099	Clermont	clermont	26	48
2100	Clewiston	clewiston	26	51
2101	Cocoa	cocoa	26	48
2102	Cocoa Beach	cocoa-beach	26	48
2103	Cottondale	cottondale	26	49
2104	Crawfordville	crawfordville	26	55
2105	Crescent City	crescent-city	26	52
2106	Crestview	crestview	26	56
2107	Cross City	cross-city	26	47
2108	Crystal River	crystal-river	26	50
2109	Crystal Springs	crystal-springs	26	50
2110	Dade City	dade-city	26	50
2111	Dania Beach	dania-beach	26	54
2112	Davenport	davenport	26	50
2113	Daytona Beach	daytona-beach	26	48
2114	De Leon Springs	de-leon-springs	26	48
2115	DeBary	debary	26	48
2116	Deerfield Beach	deerfield-beach	26	54
2117	DeFuniak Springs	defuniak-springs	26	49
2118	DeLand	deland	26	48
2119	Delray Beach	delray-beach	26	53
2120	Deltona	deltona	26	48
2121	Destin	destin	26	56
2122	Dover	dover	26	50
2123	Dundee	dundee	26	50
2124	Dunedin	dunedin	26	50
2125	Eagle Lake	eagle-lake	26	50
2126	Eastpoint	eastpoint	26	49
2127	Edgewater	edgewater	26	48
2128	Eglin Air Force Base	eglin-air-force-base	26	56
2129	Elfers	elfers	26	50
2130	Ellenton	ellenton	26	50
2131	Englewood	englewood	26	50
2132	Estero	estero	26	51
2133	Eustis	eustis	26	48
2134	Fernandina Beach	fernandina-beach	26	52
2135	Flagler Beach	flagler-beach	26	48
2136	Freeport	freeport	26	49
2137	Frostproof	frostproof	26	50
2138	Fruitland Park	fruitland-park	26	48
2139	Fort Lauderdale	fort-lauderdale	26	54
2140	Fort Meade	fort-meade	26	50
2141	Fort Myers	fort-myers	26	51
2142	Fort Myers Beach	fort-myers-beach	26	51
2143	Fort Pierce	fort-pierce	26	53
2144	Fort Walton Beach	fort-walton-beach	26	56
2145	Gainesville	gainesville	26	47
2146	Geneva	geneva	26	48
2147	Gibsonton	gibsonton	26	50
2148	Glenwood	glenwood	26	48
2149	Goldenrod	goldenrod	26	48
2150	Graceville	graceville	26	49
2151	Graham	graham	26	52
2152	Green Cove Springs	green-cove-springs	26	52
2153	Groveland	groveland	26	48
2154	Gulf Breeze	gulf-breeze	26	56
2155	Haines City	haines-city	26	50
2156	Hallandale Beach	hallandale-beach	26	54
2157	Havana	havana	26	55
2158	Hawthorne	hawthorne	26	47
2159	Hernando	hernando	26	50
2160	Hialeah	hialeah	26	54
2161	High Springs	high-springs	26	47
2162	Hilliard	hilliard	26	52
2163	Hobe Sound	hobe-sound	26	53
2164	Holiday	holiday	26	50
2165	Hollywood	hollywood	26	54
2166	Homestead	homestead	26	54
2167	Homosassa	homosassa	26	50
2168	Homosassa Springs	homosassa-springs	26	50
2169	Hudson	hudson	26	50
2170	Hurlburt Field	hurlburt-field	26	56
2171	Immokalee	immokalee	26	51
2172	Indialantic	indialantic	26	48
2173	Indian Rocks Beach	indian-rocks-beach	26	50
2174	Indiantown	indiantown	26	53
2175	Inverness	inverness	26	50
2176	Islamorada	islamorada	26	54
2177	Jacksonville	jacksonville	26	52
2178	Jacksonville Beach	jacksonville-beach	26	52
2179	Jasper	jasper	26	55
2180	Jay	jay	26	56
2181	Jensen Beach	jensen-beach	26	53
2182	Jupiter	jupiter	26	53
2183	Kenansville	kenansville	26	48
2184	Key Biscayne	key-biscayne	26	54
2185	Key Largo	key-largo	26	54
2186	Key West	key-west	26	54
2187	Keystone Heights	keystone-heights	26	52
2188	Kissimmee	kissimmee	26	48
2189	LaBelle	labelle	26	51
2190	Lady Lake	lady-lake	26	48
2191	Lake Butler	lake-butler	26	52
2192	Lake City	lake-city	26	52
2193	Lake Helen	lake-helen	26	48
2194	Lake Mary	lake-mary	26	48
2195	Lake Placid	lake-placid	26	50
2196	Lake Wales	lake-wales	26	50
2197	Lake Worth	lake-worth	26	53
2198	Lakeland	lakeland	26	50
2199	Land O  Lakes	land-o-lakes	26	50
2200	Largo	largo	26	50
2201	Laurel Hill	laurel-hill	26	56
2202	Lecanto	lecanto	26	50
2203	Lee	lee	26	55
2204	Leesburg	leesburg	26	48
2205	Lehigh Acres	lehigh-acres	26	51
2206	Live Oak	live-oak	26	55
2207	Longboat Key	longboat-key	26	50
2208	Longwood	longwood	26	48
2209	Loxahatchee Groves	loxahatchee-groves	26	53
2210	Lutz	lutz	26	50
2211	Lynn Haven	lynn-haven	26	49
2212	Macclenny	macclenny	26	52
2213	Madison	madison	26	55
2214	Maitland	maitland	26	48
2215	Malabar	malabar	26	48
2216	Marathon	marathon	26	54
2217	Marco Island	marco-island	26	51
2218	Marianna	marianna	26	49
2219	Mary Esther	mary-esther	26	56
2220	Mayo	mayo	26	55
2221	McDavid	mcdavid	26	56
2222	Melbourne	melbourne	26	48
2223	Merritt Island	merritt-island	26	48
2224	Mexico Beach	mexico-beach	26	49
2225	Miami	miami	26	54
2226	Miami Beach	miami-beach	26	54
2227	Middleburg	middleburg	26	52
2228	Milton	milton	26	56
2229	Minneola	minneola	26	48
2230	Molino	molino	26	56
2231	Monticello	monticello	26	55
2232	Montverde	montverde	26	48
2233	Mount Dora	mount-dora	26	48
2234	Mount Pleasant	mount-pleasant	26	55
2235	Mulberry	mulberry	26	50
2236	Myakka City	myakka-city	26	50
2237	Naples	naples	26	51
2238	Navarre	navarre	26	56
2239	Neptune Beach	neptune-beach	26	52
2240	New Port Richey	new-port-richey	26	50
2241	New Smyrna Beach	new-smyrna-beach	26	48
2242	Newberry	newberry	26	47
2243	Niceville	niceville	26	56
2244	Nokomis	nokomis	26	50
2245	North Fort Myers	north-fort-myers	26	51
2246	North Miami Beach	north-miami-beach	26	54
2247	North Palm Beach	north-palm-beach	26	53
2248	North Port	north-port	26	50
2249	Ocala	ocala	26	48
2250	Ocoee	ocoee	26	48
2251	Odessa	odessa	26	50
2252	Okahumpka	okahumpka	26	48
2253	Okeechobee	okeechobee	26	53
2254	Oldsmar	oldsmar	26	50
2255	Opa-locka	opa-locka	26	54
2256	Orange City	orange-city	26	48
2257	Orange Park	orange-park	26	52
2258	Orlando	orlando	26	48
2259	Ormond Beach	ormond-beach	26	48
2260	Osprey	osprey	26	50
2261	Oviedo	oviedo	26	48
2262	Pahokee	pahokee	26	53
2263	Palatka	palatka	26	52
2264	Palm Bay	palm-bay	26	48
2265	Palm Beach	palm-beach	26	53
2266	Palm City	palm-city	26	53
2267	Palm Coast	palm-coast	26	48
2268	Palm Harbor	palm-harbor	26	50
2269	Palmetto	palmetto	26	50
2270	Panama City	panama-city	26	49
2271	Panama City Beach	panama-city-beach	26	49
2272	Patrick Air Force Base	patrick-air-force-base	26	48
2273	Pembroke Pines	pembroke-pines	26	54
2274	Pensacola	pensacola	26	56
2275	Perry	perry	26	55
2276	Pierson	pierson	26	48
2277	Pinellas Park	pinellas-park	26	50
2278	Placida	placida	26	51
2279	Plant City	plant-city	26	50
2280	Plymouth	plymouth	26	48
2281	Polk City	polk-city	26	50
2282	Pomona Park	pomona-park	26	52
2283	Pompano Beach	pompano-beach	26	54
2284	Ponte Vedra Beach	ponte-vedra-beach	26	52
2285	Port Charlotte	port-charlotte	26	51
2286	Port Orange	port-orange	26	48
2287	Port Richey	port-richey	26	50
2288	Port Saint Joe	port-saint-joe	26	49
2289	Port St. Lucie	port-st-lucie	26	53
2290	Punta Gorda	punta-gorda	26	51
2291	Quincy	quincy	26	55
2292	Reddick	reddick	26	48
2293	Riverview	riverview	26	50
2294	Rockledge	rockledge	26	48
2295	Safety Harbor	safety-harbor	26	50
2296	San Antonio	san-antonio	26	50
2297	Sanford	sanford	26	48
2298	Sanibel	sanibel	26	51
2299	Sarasota	sarasota	26	50
2300	Satellite Beach	satellite-beach	26	48
2301	Sebastian	sebastian	26	53
2302	Sebring	sebring	26	50
2303	Seffner	seffner	26	50
2304	Seminole	seminole	26	50
2305	Shalimar	shalimar	26	56
2306	Silver Springs	silver-springs	26	48
2307	Sorrento	sorrento	26	48
2308	South Bay	south-bay	26	53
2309	Spring Hill	spring-hill	26	50
2310	St. Augustine	st-augustine	26	52
2311	Saint Cloud	saint-cloud	26	48
2312	Saint James City	saint-james-city	26	51
2313	St. Petersburg	st-petersburg	26	50
2314	Starke	starke	26	52
2315	Stuart	stuart	26	53
2316	Summerland Key	summerland-key	26	54
2317	Sun City	sun-city	26	50
2318	Sunnyside	sunnyside	26	49
2319	Tallahassee	tallahassee	26	55
2320	Tampa	tampa	26	50
2321	Tarpon Springs	tarpon-springs	26	50
2322	Tavares	tavares	26	48
2323	Tavernier	tavernier	26	54
2324	Thonotosassa	thonotosassa	26	50
2325	Titusville	titusville	26	48
2326	Trenton	trenton	26	47
2327	Valparaiso	valparaiso	26	56
2328	Valrico	valrico	26	50
2329	Venice	venice	26	50
2330	Venus	venus	26	50
2331	Vero Beach	vero-beach	26	53
2332	Wabasso	wabasso	26	53
2333	Wauchula	wauchula	26	50
2334	Wellborn	wellborn	26	55
2335	West Palm Beach	west-palm-beach	26	53
2336	Weston	weston	26	54
2337	Wildwood	wildwood	26	48
2338	Williston	williston	26	47
2339	Wimauma	wimauma	26	50
2340	Windermere	windermere	26	48
2341	Winter Garden	winter-garden	26	48
2342	Winter Haven	winter-haven	26	50
2343	Winter Park	winter-park	26	48
2344	Winter Springs	winter-springs	26	48
2345	Yulee	yulee	26	52
2346	Zellwood	zellwood	26	48
2347	Zephyrhills	zephyrhills	26	50
2348	Apollo Beach	apollo-beach	26	50
2349	Aventura	aventura	26	54
2350	Azalea Park	azalea-park	26	48
2351	Bal Harbour	bal-harbour	26	54
2352	Bay Lake	bay-lake	26	48
2353	Bayonet Point	bayonet-point	26	50
2354	Bayshore Gardens	bayshore-gardens	26	50
2355	Bee Ridge	bee-ridge	26	50
2356	Bellair-Meadowbrook Terrace	bellair-meadowbrook-terrace	26	52
2357	Belle Isle	belle-isle	26	48
2358	Bellview	bellview	26	56
2359	Beverly Hills	beverly-hills	26	50
2360	Bithlo	bithlo	26	48
2361	Boca Del Mar	boca-del-mar	26	53
2362	Brent	brent	26	56
2363	Buckingham	buckingham	26	51
2364	Buena Ventura Lakes	buena-ventura-lakes	26	48
2365	Callaway	callaway	26	49
2366	Captiva	captiva	26	51
2367	Celebration	celebration	26	48
2368	Cheval	cheval	26	50
2369	Citrus Park	citrus-park	26	50
2370	Citrus Springs	citrus-springs	26	50
2371	Coconut Creek	coconut-creek	26	54
2372	Cooper City	cooper-city	26	54
2373	Coral Gables	coral-gables	26	54
2374	Coral Springs	coral-springs	26	54
2375	Coral Terrace	coral-terrace	26	54
2376	Country Club	country-club	26	54
2377	Cutler Bay	cutler-bay	26	54
2378	Cypress Gardens	cypress-gardens	26	50
2379	Cypress Lake	cypress-lake	26	51
2380	Davie	davie	26	54
2381	Daytona Beach Shores	daytona-beach-shores	26	48
2382	Desoto Lakes	desoto-lakes	26	50
2383	Doctor Phillips	doctor-phillips	26	48
2384	Doral	doral	26	54
2385	Duck Key	duck-key	26	54
2386	Dunnellon	dunnellon	26	48
2387	East Lake	east-lake	26	50
2388	East Lake-Orient Park	east-lake-orient-park	26	50
2389	Egypt Lake-Leto	egypt-lake-leto	26	50
2390	Ensley	ensley	26	56
2391	Fairview Shores	fairview-shores	26	48
2392	Feather Sound	feather-sound	26	50
2393	Ferry Pass	ferry-pass	26	56
2394	Florida City	florida-city	26	54
2395	Forest City	forest-city	26	48
2396	Fontainebleau	fontainebleau	26	54
2397	Four Corners	four-corners	26	48
2398	Fruit Cove	fruit-cove	26	52
2399	Fruitville	fruitville	26	50
2400	Gateway	gateway	26	51
2401	Glenvar Heights	glenvar-heights	26	54
2402	Golden Gate	golden-gate	26	51
2403	Golf	golf	26	53
2404	Gonzalez	gonzalez	26	56
2405	Greater Carrollwood	greater-carrollwood	26	50
2406	Greater Northdale	greater-northdale	26	50
2407	Greenacres	greenacres	26	53
2408	Gulf Gate Estates	gulf-gate-estates	26	50
2409	Gulfport	gulfport	26	50
2410	Hamptons at Boca Raton	hamptons-at-boca-raton	26	53
2411	Harbour Heights	harbour-heights	26	51
2412	Heathrow	heathrow	26	48
2413	Hialeah Gardens	hialeah-gardens	26	54
2414	Holly Hill	holly-hill	26	48
2415	Holmes Beach	holmes-beach	26	50
2416	Hunters Creek	hunters-creek	26	48
2417	Indian Harbour Beach	indian-harbour-beach	26	48
2418	Interlachen	interlachen	26	52
2419	Inverness Highlands South	inverness-highlands-south	26	50
2420	Iona	iona	26	51
2421	Ives Estates	ives-estates	26	54
2422	Jan Phyl Village	jan-phyl-village	26	50
2423	Jasmine Estates	jasmine-estates	26	50
2424	Juno Beach	juno-beach	26	53
2425	Kathleen	kathleen	26	50
2426	Kendale Lakes	kendale-lakes	26	54
2427	Kendall	kendall	26	54
2428	Kendall West	kendall-west	26	54
2429	Keystone	keystone	26	50
2430	Kings Point	kings-point	26	53
2431	Laguna Beach	laguna-beach	26	49
2432	Lake Butler	lake-butler	26	48
2433	Lake Hart	lake-hart	26	48
2434	Lake Lorraine	lake-lorraine	26	56
2435	Lake Magdalene	lake-magdalene	26	50
2436	Lakeland Highlands	lakeland-highlands	26	50
2437	Lakeside	lakeside	26	52
2438	Lakewood Park	lakewood-park	26	53
2439	Lantana	lantana	26	53
2440	Lauderdale Lakes	lauderdale-lakes	26	54
2441	Lauderdale-by-the-Sea	lauderdale-by-the-sea	26	54
2442	Lauderhill	lauderhill	26	54
2443	Laurel	laurel	26	50
2444	Leisure City	leisure-city	26	54
2445	Lely Resort	lely-resort	26	51
2446	Lighthouse Point	lighthouse-point	26	54
2447	Lockhart	lockhart	26	48
2448	Loughman	loughman	26	50
2449	Lower Grand Lagoon	lower-grand-lagoon	26	49
2450	Madeira Beach	madeira-beach	26	50
2451	Mango	mango	26	50
2452	Margate	margate	26	54
2453	Meadow Woods	meadow-woods	26	48
2454	Medley	medley	26	54
2455	Melbourne Beach	melbourne-beach	26	48
2456	Miami Gardens	miami-gardens	26	54
2457	Miami Lakes	miami-lakes	26	54
2458	Miami Shores	miami-shores	26	54
2459	Miami Springs	miami-springs	26	54
2460	Miramar	miramar	26	54
2461	Miramar Beach	miramar-beach	26	49
2462	Mission Bay	mission-bay	26	53
2463	Mount Plymouth	mount-plymouth	26	48
2464	Myrtle Grove	myrtle-grove	26	56
2465	Naranja	naranja	26	54
2466	New Port Richey East	new-port-richey-east	26	50
2467	North Bay Village	north-bay-village	26	54
2468	North Lauderdale	north-lauderdale	26	54
2469	North Miami	north-miami	26	54
2470	North Naples	north-naples	26	51
2471	North Redington Beach	north-redington-beach	26	50
2472	North Sarasota	north-sarasota	26	50
2473	North Weeki Wachee	north-weeki-wachee	26	50
2474	Oak Ridge	oak-ridge	26	48
2475	Oakland Park	oakland-park	26	54
2476	Okaloosa Island	okaloosa-island	26	56
2477	Orangetree	orangetree	26	51
2478	Pace	pace	26	56
2479	Palm Beach Gardens	palm-beach-gardens	26	53
2480	Palm Beach Shores	palm-beach-shores	26	53
2481	Palm River-Clair Mel	palm-river-clair-mel	26	50
2482	Palm Springs	palm-springs	26	53
2483	Palm Valley	palm-valley	26	52
2484	Palmetto Bay	palmetto-bay	26	54
2485	Palmetto Estates	palmetto-estates	26	54
2486	Parkland	parkland	26	54
2487	Pensacola Beach	pensacola-beach	26	56
2488	Perdido Key	perdido-key	26	56
2489	Pine Hills	pine-hills	26	48
2490	Pine Ridge	pine-ridge	26	50
2491	Pinecrest	pinecrest	26	54
2492	Plantation	plantation	26	54
2493	Poinciana	poinciana	26	48
2494	Port Salerno	port-salerno	26	53
2495	Port Saint John	port-saint-john	26	48
2496	Princeton	princeton	26	54
2497	Richmond West	richmond-west	26	54
2498	Ridge Manor	ridge-manor	26	50
2499	Riviera Beach	riviera-beach	26	53
2500	Rotonda West	rotonda-west	26	51
2501	Royal Palm Beach	royal-palm-beach	26	53
2502	Ruskin	ruskin	26	50
2503	Samoset	samoset	26	50
2504	San Carlos Park	san-carlos-park	26	51
2505	Sandalfoot Cove	sandalfoot-cove	26	53
2506	Sarasota Springs	sarasota-springs	26	50
2507	Shady Hills	shady-hills	26	50
2508	Siesta Key	siesta-key	26	50
2509	Silver Springs Shores	silver-springs-shores	26	48
2510	Sky Lake	sky-lake	26	48
2511	South Bradenton	south-bradenton	26	50
2512	South Miami	south-miami	26	54
2513	South Miami Heights	south-miami-heights	26	54
2514	South Venice	south-venice	26	50
2515	Southchase	southchase	26	48
2516	Saint Augustine Beach	saint-augustine-beach	26	52
2517	Saint Augustine Shores	saint-augustine-shores	26	52
2518	Saint Pete Beach	saint-pete-beach	26	50
2519	Sugarmill Woods	sugarmill-woods	26	50
2520	Sun City Center	sun-city-center	26	50
2521	Sunny Isles Beach	sunny-isles-beach	26	54
2522	Sunrise	sunrise	26	54
2523	Sunset	sunset	26	54
2524	Surfside	surfside	26	54
2525	Tamarac	tamarac	26	54
2526	Tamiami	tamiami	26	54
2527	Temple Terrace	temple-terrace	26	50
2528	Tequesta	tequesta	26	53
2529	The Crossings	the-crossings	26	54
2530	The Hammocks	the-hammocks	26	54
2531	The Meadows	the-meadows	26	50
2532	The Villages	the-villages	26	48
2533	Three Lakes	three-lakes	26	54
2534	Three Oaks	three-oaks	26	51
2535	Town  n  Country	town-n-country	26	50
2536	Treasure Island	treasure-island	26	50
2537	Trinity	trinity	26	50
2538	Tyndall Air Force Base	tyndall-air-force-base	26	49
2539	Umatilla	umatilla	26	48
2540	Union Park	union-park	26	48
2541	University	university	26	50
2542	University Park	university-park	26	54
2543	Upper Grand Lagoon	upper-grand-lagoon	26	49
2544	Vamo	vamo	26	50
2545	Villas	villas	26	51
2546	Vineyards	vineyards	26	51
2547	Warrington	warrington	26	56
2548	Wedgefield	wedgefield	26	48
2549	Wekiva Springs	wekiva-springs	26	48
2550	Wellington	wellington	26	53
2551	Wesley Chapel	wesley-chapel	26	50
2552	Wesley Chapel South	wesley-chapel-south	26	50
2553	West Little River	west-little-river	26	54
2554	West Melbourne	west-melbourne	26	48
2555	West Pensacola	west-pensacola	26	56
2556	Westchase	westchase	26	50
2557	Westchester	westchester	26	54
2558	Westview	westview	26	54
2559	Whisper Walk	whisper-walk	26	53
2560	Whitfield	whitfield	26	50
2561	Williamsburg	williamsburg	26	48
2562	Willow Oak	willow-oak	26	50
2563	Wilton Manors	wilton-manors	26	54
2564	Wright	wright	26	56
2565	Zephyrhills West	zephyrhills-west	26	50
2566	Abbeville	abbeville	2	57
2567	Acworth	acworth	2	58
2568	Adairsville	adairsville	2	58
2569	Adel	adel	2	59
2570	Alamo	alamo	2	57
2571	Albany	albany	2	59
2572	Alma	alma	2	60
2573	Alpharetta	alpharetta	2	58
2574	Americus	americus	2	61
2575	Appling	appling	2	62
2576	Ashburn	ashburn	2	59
2577	Athens	athens	2	58
2578	Atlanta	atlanta	2	58
2579	Auburn	auburn	2	58
2580	Augusta	augusta	2	62
2581	Austell	austell	2	58
2582	Avondale Estates	avondale-estates	2	58
2583	Bainbridge	bainbridge	2	63
2584	Ball Ground	ball-ground	2	58
2585	Barnesville	barnesville	2	58
2586	Bartow	bartow	2	62
2587	Baxley	baxley	2	60
2588	Blackshear	blackshear	2	64
2589	Blairsville	blairsville	2	58
2590	Blakely	blakely	2	65
2591	Blue Ridge	blue-ridge	2	58
2592	Blythe	blythe	2	62
2593	Bogart	bogart	2	58
2594	Bolingbroke	bolingbroke	2	57
2595	Bowdon	bowdon	2	58
2596	Braselton	braselton	2	58
2597	Bremen	bremen	2	58
2598	Brooklet	brooklet	2	60
2599	Brunswick	brunswick	2	64
2600	Buchanan	buchanan	2	58
2601	Buckhead	buckhead	2	58
2602	Buena Vista	buena-vista	2	61
2603	Buford	buford	2	58
2604	Butler	butler	2	57
2605	Byron	byron	2	57
2606	Cairo	cairo	2	63
2607	Calhoun	calhoun	2	58
2608	Camak	camak	2	62
2609	Camilla	camilla	2	59
2610	Canton	canton	2	58
2611	Carnesville	carnesville	2	66
2612	Carrollton	carrollton	2	58
2613	Cartersville	cartersville	2	58
2614	Cave Spring	cave-spring	2	58
2615	Cedartown	cedartown	2	58
2616	Chatsworth	chatsworth	2	67
2617	Chickamauga	chickamauga	2	67
2618	Clarkesville	clarkesville	2	58
2619	Clarkston	clarkston	2	58
2620	Clayton	clayton	2	58
2621	Clermont	clermont	2	58
2622	Cleveland	cleveland	2	58
2623	Cobb	cobb	2	61
2624	Cochran	cochran	2	57
2625	Colquitt	colquitt	2	63
2626	Columbus	columbus	2	61
2627	Commerce	commerce	2	58
2628	Concord	concord	2	58
2629	Conley	conley	2	58
2630	Conyers	conyers	2	58
2631	Cordele	cordele	2	59
2632	Cornelia	cornelia	2	58
2633	Covington	covington	2	58
2634	Crawfordville	crawfordville	2	62
2635	Crescent	crescent	2	60
2636	Cumming	cumming	2	58
2637	Cusseta	cusseta	2	61
2638	Cuthbert	cuthbert	2	61
2639	Dacula	dacula	2	58
2640	Dahlonega	dahlonega	2	58
2641	Dallas	dallas	2	58
2642	Dalton	dalton	2	67
2643	Danielsville	danielsville	2	58
2644	Darien	darien	2	60
2645	Dawson	dawson	2	59
2646	Dawsonville	dawsonville	2	58
2647	Dearing	dearing	2	62
2648	Decatur	decatur	2	58
2649	Demorest	demorest	2	58
2650	Dexter	dexter	2	57
2651	Dillard	dillard	2	58
2652	Donalsonville	donalsonville	2	63
2653	Douglas	douglas	2	59
2654	Douglasville	douglasville	2	58
2655	Dublin	dublin	2	57
2656	Duluth	duluth	2	58
2657	East Ellijay	east-ellijay	2	58
2658	Eastman	eastman	2	57
2659	Eatonton	eatonton	2	58
2660	Edison	edison	2	59
2661	Elberton	elberton	2	66
2662	Ellaville	ellaville	2	61
2663	Ellenwood	ellenwood	2	58
2664	Ellijay	ellijay	2	58
2665	Enigma	enigma	2	59
2666	Evans	evans	2	62
2667	Experiment	experiment	2	58
2668	Fairburn	fairburn	2	58
2669	Fairmount	fairmount	2	58
2670	Farmington	farmington	2	58
2671	Fayetteville	fayetteville	2	58
2672	Fitzgerald	fitzgerald	2	59
2673	Flowery Branch	flowery-branch	2	58
2674	Folkston	folkston	2	64
2675	Forest Park	forest-park	2	58
2676	Forsyth	forsyth	2	57
2677	Franklin	franklin	2	58
2678	Franklin Springs	franklin-springs	2	66
2679	Fort Benning	fort-benning	2	61
2680	Fort Gaines	fort-gaines	2	61
2681	Fort Oglethorpe	fort-oglethorpe	2	67
2682	Fort Stewart	fort-stewart	2	60
2683	Fort Valley	fort-valley	2	57
2684	Gainesville	gainesville	2	58
2685	Glennville	glennville	2	60
2686	Glenwood	glenwood	2	57
2687	Gordon	gordon	2	57
2688	Grantville	grantville	2	58
2689	Gray	gray	2	57
2690	Grayson	grayson	2	58
2691	Greensboro	greensboro	2	58
2692	Greenville	greenville	2	58
2693	Griffin	griffin	2	58
2694	Grovetown	grovetown	2	62
2695	Guyton	guyton	2	60
2696	Hahira	hahira	2	63
2697	Hamilton	hamilton	2	61
2698	Hampton	hampton	2	58
2699	Harlem	harlem	2	62
2700	Hartwell	hartwell	2	66
2701	Hawkinsville	hawkinsville	2	57
2702	Hazlehurst	hazlehurst	2	60
2703	Helen	helen	2	58
2704	Hephzibah	hephzibah	2	62
2705	Hiawassee	hiawassee	2	58
2706	Hinesville	hinesville	2	60
2707	Hiram	hiram	2	58
2708	Homer	homer	2	58
2709	Homerville	homerville	2	63
2710	Hoschton	hoschton	2	58
2711	Irwinton	irwinton	2	57
2712	Jackson	jackson	2	58
2713	Jasper	jasper	2	58
2714	Jefferson	jefferson	2	58
2715	Jeffersonville	jeffersonville	2	57
2716	Jenkinsburg	jenkinsburg	2	58
2717	Jesup	jesup	2	60
2718	Jewell	jewell	2	62
2719	Jonesboro	jonesboro	2	58
2720	Kennesaw	kennesaw	2	58
2721	Kings Bay Base	kings-bay-base	2	64
2722	Kingsland	kingsland	2	64
2723	Kingston	kingston	2	58
2724	LaFayette	lafayette	2	67
2725	LaGrange	lagrange	2	58
2726	Lake Park	lake-park	2	63
2727	Lakeland	lakeland	2	63
2728	Lavonia	lavonia	2	66
2729	Lawrenceville	lawrenceville	2	58
2730	Leesburg	leesburg	2	59
2731	Lenox	lenox	2	59
2732	Leslie	leslie	2	61
2733	Lexington	lexington	2	58
2734	Lilburn	lilburn	2	58
2735	Lincolnton	lincolnton	2	62
2736	Lithia Springs	lithia-springs	2	58
2737	Lithonia	lithonia	2	58
2738	Lizella	lizella	2	57
2739	Locust Grove	locust-grove	2	58
2740	Loganville	loganville	2	58
2741	Lookout Mountain	lookout-mountain	2	67
2742	Louisville	louisville	2	62
2743	Ludowici	ludowici	2	60
2744	Lula	lula	2	58
2745	Luthersville	luthersville	2	58
2746	Lyons	lyons	2	60
2747	Mableton	mableton	2	58
2748	Macon	macon	2	57
2749	Madison	madison	2	58
2750	Manchester	manchester	2	58
2751	Marble Hill	marble-hill	2	58
2752	Marietta	marietta	2	58
2753	McRae	mcrae	2	57
2754	McDonough	mcdonough	2	58
2755	Meansville	meansville	2	58
2756	Menlo	menlo	2	67
2757	Metter	metter	2	60
2758	Milledgeville	milledgeville	2	57
2759	Millen	millen	2	62
2760	Monroe	monroe	2	58
2761	Montezuma	montezuma	2	57
2762	Monticello	monticello	2	58
2763	Morgan	morgan	2	59
2764	Morrow	morrow	2	58
2765	Moultrie	moultrie	2	59
2766	Mount Vernon	mount-vernon	2	60
2767	Mountain City	mountain-city	2	58
2768	Nahunta	nahunta	2	64
2769	Nashville	nashville	2	59
2770	Nelson	nelson	2	58
2771	Newington	newington	2	60
2772	Newnan	newnan	2	58
2773	Newton	newton	2	59
2774	Nicholls	nicholls	2	59
2775	Norcross	norcross	2	58
2776	Oakwood	oakwood	2	58
2777	Ochlocknee	ochlocknee	2	63
2778	Ocilla	ocilla	2	59
2779	Oconee	oconee	2	57
2780	Oglethorpe	oglethorpe	2	57
2781	Oxford	oxford	2	58
2782	Palmetto	palmetto	2	58
2783	Peachtree City	peachtree-city	2	58
2784	Pearson	pearson	2	59
2785	Pelham	pelham	2	59
2786	Pembroke	pembroke	2	60
2787	Pendergrass	pendergrass	2	58
2788	Perkins	perkins	2	62
2789	Perry	perry	2	57
2790	Pine Lake	pine-lake	2	58
2791	Pine Mountain	pine-mountain	2	61
2792	Pooler	pooler	2	60
2793	Powder Springs	powder-springs	2	58
2794	Preston	preston	2	61
2795	Quitman	quitman	2	63
2796	Rabun Gap	rabun-gap	2	58
2797	Ranger	ranger	2	58
2798	Redan	redan	2	58
2799	Reidsville	reidsville	2	60
2800	Rentz	rentz	2	57
2801	Rex	rex	2	58
2802	Reynolds	reynolds	2	57
2803	Riceboro	riceboro	2	60
2804	Richmond Hill	richmond-hill	2	60
2805	Rincon	rincon	2	60
2806	Ringgold	ringgold	2	67
2807	Riverdale	riverdale	2	58
2808	Roberta	roberta	2	57
2809	Rochelle	rochelle	2	57
2810	Rock Spring	rock-spring	2	67
2811	Rockmart	rockmart	2	58
2812	Rome	rome	2	58
2813	Roopville	roopville	2	58
2814	Rossville	rossville	2	67
2815	Roswell	roswell	2	58
2816	Rutledge	rutledge	2	58
2817	Sandersville	sandersville	2	57
2818	Sardis	sardis	2	62
2819	Sautee Nacoochee	sautee-nacoochee	2	58
2820	Savannah	savannah	2	60
2821	Scottdale	scottdale	2	58
2822	Screven	screven	2	60
2823	Senoia	senoia	2	58
2824	Sharon	sharon	2	62
2825	Shellman	shellman	2	61
2826	Smyrna	smyrna	2	58
2827	Snellville	snellville	2	58
2828	Social Circle	social-circle	2	58
2829	Soperton	soperton	2	57
2830	Sparta	sparta	2	57
2831	Springfield	springfield	2	60
2832	Saint Marys	saint-marys	2	64
2833	Saint Simons Island	saint-simons-island	2	64
2834	Statenville	statenville	2	63
2835	Statesboro	statesboro	2	60
2836	Statham	statham	2	58
2837	Stockbridge	stockbridge	2	58
2838	Stone Mountain	stone-mountain	2	58
2839	Summerville	summerville	2	67
2840	Suwanee	suwanee	2	58
2841	Swainsboro	swainsboro	2	62
2842	Sylvania	sylvania	2	60
2843	Sylvester	sylvester	2	59
2844	Talbotton	talbotton	2	61
2845	Tallapoosa	tallapoosa	2	58
2846	Temple	temple	2	58
2847	Tennille	tennille	2	57
2848	Thomaston	thomaston	2	58
2849	Thomasville	thomasville	2	63
2850	Thomson	thomson	2	62
2851	Tifton	tifton	2	59
2852	Toccoa	toccoa	2	66
2853	Toccoa Falls	toccoa-falls	2	66
2854	Trenton	trenton	2	67
2855	Trion	trion	2	67
2856	Tucker	tucker	2	58
2857	Tunnel Hill	tunnel-hill	2	67
2858	Tybee Island	tybee-island	2	60
2859	Tyrone	tyrone	2	58
2860	Union City	union-city	2	58
2861	Union Point	union-point	2	58
2862	Valdosta	valdosta	2	63
2863	Vidalia	vidalia	2	60
2864	Vienna	vienna	2	57
2865	Villa Rica	villa-rica	2	58
2866	Waleska	waleska	2	58
2867	Warm Springs	warm-springs	2	58
2868	Warner Robins	warner-robins	2	57
2869	Warrenton	warrenton	2	62
2870	Warwick	warwick	2	59
2871	Washington	washington	2	62
2872	Watkinsville	watkinsville	2	58
2873	Waycross	waycross	2	64
2874	Waynesboro	waynesboro	2	62
2875	Waynesville	waynesville	2	64
2876	West Point	west-point	2	58
2877	Whitesburg	whitesburg	2	58
2878	Winder	winder	2	58
2879	Winston	winston	2	58
2880	Winterville	winterville	2	58
2881	Woodstock	woodstock	2	58
2882	Wrens	wrens	2	62
2883	Wrightsville	wrightsville	2	57
2884	Young Harris	young-harris	2	58
2885	Zebulon	zebulon	2	58
2886	Brookhaven	brookhaven	2	58
2887	Candler-McAfee	candler-mcafee	2	58
2888	Chamblee	chamblee	2	58
2889	College Park	college-park	2	58
2890	Dock Junction	dock-junction	2	64
2891	Doraville	doraville	2	58
2892	Druid Hills	druid-hills	2	58
2893	Dunwoody	dunwoody	2	58
2894	East Point	east-point	2	58
2895	Garden City	garden-city	2	60
2896	Georgetown	georgetown	2	60
2897	Hapeville	hapeville	2	58
2898	Holly Springs	holly-springs	2	58
2899	Johns Creek	johns-creek	2	58
2900	Martinez	martinez	2	62
2901	Midway	midway	2	60
2902	Milton	milton	2	58
2903	Mountain Park	mountain-park	2	58
2904	North Decatur	north-decatur	2	58
2905	North Druid Hills	north-druid-hills	2	58
2906	Panthersville	panthersville	2	58
2907	Port Wentworth	port-wentworth	2	60
2908	Porterdale	porterdale	2	58
2909	Sandy Springs	sandy-springs	2	58
2910	Skidaway Island	skidaway-island	2	60
2911	Sugar Hill	sugar-hill	2	58
2912	Vinings	vinings	2	58
2913	Wilmington Island	wilmington-island	2	60
2914	Aiea	aiea	18	68
2915	Captain Cook	captain-cook	18	68
2916	Eleele	eleele	18	68
2917	Ewa Beach	ewa-beach	18	68
2918	Haiku-Pauwela	haiku-pauwela	18	68
2919	Haleiwa	haleiwa	18	68
2920	Hana	hana	18	68
2921	Hanalei	hanalei	18	68
2922	Hickam Field	hickam-field	18	68
2923	Hilo	hilo	18	68
2924	Honokaa	honokaa	18	68
2925	Honolulu	honolulu	18	68
2926	Ho olehua	ho-olehua	18	68
2927	Kahului	kahului	18	68
2928	Kailua	kailua	18	68
2929	Kailua-Kona	kailua-kona	18	68
2930	Kalaheo	kalaheo	18	68
2931	Waimea	waimea	18	68
2932	Kaneohe	kaneohe	18	68
2933	Kapaa	kapaa	18	68
2934	Kapaau	kapaau	18	68
2935	Kapolei	kapolei	18	68
2936	Kaunakakai	kaunakakai	18	68
2937	Keaau	keaau	18	68
2938	Kealakekua	kealakekua	18	68
2939	Kekaha	kekaha	18	68
2940	Kihei	kihei	18	68
2941	Kilauea	kilauea	18	68
2942	Koloa	koloa	18	68
2943	Kula	kula	18	68
2944	Lahaina	lahaina	18	68
2945	Laie	laie	18	68
2946	Lanai City	lanai-city	18	68
2947	Lihue	lihue	18	68
2948	Makawao	makawao	18	68
2949	Maunaloa	maunaloa	18	68
2950	Mililani	mililani	18	68
2951	Mountain View	mountain-view	18	68
2952	Naalehu	naalehu	18	68
2953	Pahala	pahala	18	68
2954	Pahoa	pahoa	18	68
2955	Paia	paia	18	68
2956	Pearl City	pearl-city	18	68
2957	Pukalani	pukalani	18	68
2958	Wahiawa	wahiawa	18	68
2959	Waialua	waialua	18	68
2960	Waianae	waianae	18	68
2961	Waikoloa Village	waikoloa-village	18	68
2962	Wailuku	wailuku	18	68
2963	Waipahu	waipahu	18	68
2964	Wheeler Army Airfield	wheeler-army-airfield	18	68
2965	Ewa Gentry	ewa-gentry	18	68
2966	Ewa Villages	ewa-villages	18	68
2967	Halawa	halawa	18	68
2968	Kaanapali	kaanapali	18	68
2969	Kalaoa	kalaoa	18	68
2970	Makakilo	makakilo	18	68
2971	Marine Corps Base Hawaii	marine-corps-base-hawaii	18	68
2972	Nanakuli	nanakuli	18	68
2973	Napili-Honokowai	napili-honokowai	18	68
2974	Princeville	princeville	18	68
2975	Puako	puako	18	68
2976	Pupukea	pupukea	18	68
2977	Schofield Barracks	schofield-barracks	18	68
2978	Village Park	village-park	18	68
2979	Wailea-Makena	wailea-makena	18	68
2980	Wailua	wailua	18	68
2981	Waimalu	waimalu	18	68
2982	Waipio	waipio	18	68
2983	Ackley	ackley	4	69
2984	Adair	adair	4	69
2985	Adel	adel	4	69
2986	Afton	afton	4	69
2987	Agency	agency	4	70
2988	Ainsworth	ainsworth	4	71
2989	Akron	akron	4	72
2990	Albert City	albert-city	4	72
2991	Albia	albia	4	69
2992	Alburnett	alburnett	4	71
2993	Alden	alden	4	69
2994	Alexander	alexander	4	69
2995	Algona	algona	4	69
2996	Alleman	alleman	4	69
2997	Allerton	allerton	4	69
2998	Allison	allison	4	71
2999	Alta	alta	4	72
3000	Altoona	altoona	4	69
3001	Amana	amana	4	71
3002	Ames	ames	4	69
3003	Anamosa	anamosa	4	71
3004	Andrew	andrew	4	73
3005	Anita	anita	4	74
3006	Ankeny	ankeny	4	69
3007	Anthon	anthon	4	72
3008	Aplington	aplington	4	71
3009	Arcadia	arcadia	4	69
3010	Arlington	arlington	4	71
3011	Armstrong	armstrong	4	72
3012	Atlantic	atlantic	4	74
3013	Audubon	audubon	4	69
3014	Aurelia	aurelia	4	72
3015	Avoca	avoca	4	74
3016	Badger	badger	4	69
3017	Baldwin	baldwin	4	73
3018	Batavia	batavia	4	70
3019	Baxter	baxter	4	69
3020	Bedford	bedford	4	69
3021	Belle Plaine	belle-plaine	4	71
3022	Bellevue	bellevue	4	73
3023	Belmond	belmond	4	69
3024	Bennett	bennett	4	71
3025	Benton	benton	4	69
3026	Bernard	bernard	4	71
3027	Bettendorf	bettendorf	4	73
3028	Blairsburg	blairsburg	4	69
3029	Blairstown	blairstown	4	71
3030	Bloomfield	bloomfield	4	70
3031	Bode	bode	4	69
3032	Bonaparte	bonaparte	4	70
3033	Bondurant	bondurant	4	69
3034	Boone	boone	4	69
3035	Boxholm	boxholm	4	69
3036	Boyden	boyden	4	72
3037	Breda	breda	4	69
3038	Britt	britt	4	75
3039	Brooklyn	brooklyn	4	69
3040	Buffalo Center	buffalo-center	4	75
3041	Burlington	burlington	4	73
3042	Burnside	burnside	4	69
3043	Burt	burt	4	69
3044	Bussey	bussey	4	69
3045	Callender	callender	4	69
3046	Calmar	calmar	4	71
3047	Camanche	camanche	4	73
3048	Cantril	cantril	4	70
3049	Carlisle	carlisle	4	69
3050	Carroll	carroll	4	69
3051	Carson	carson	4	74
3052	Carter Lake	carter-lake	4	74
3053	Cascade	cascade	4	71
3054	Casey	casey	4	69
3055	Castana	castana	4	72
3056	Cedar Falls	cedar-falls	4	71
3057	Cedar Rapids	cedar-rapids	4	71
3058	Center Junction	center-junction	4	71
3059	Center Point	center-point	4	71
3060	Centerville	centerville	4	69
3061	Central City	central-city	4	71
3062	Chariton	chariton	4	69
3063	Charles City	charles-city	4	75
3064	Charter Oak	charter-oak	4	74
3065	Cherokee	cherokee	4	72
3066	Churdan	churdan	4	69
3067	Clarence	clarence	4	71
3068	Clarinda	clarinda	4	74
3069	Clarion	clarion	4	69
3070	Clarksville	clarksville	4	71
3071	Clear Lake	clear-lake	4	75
3072	Clinton	clinton	4	73
3073	Clive	clive	4	69
3074	Coin	coin	4	74
3075	Colesburg	colesburg	4	71
3076	Colfax	colfax	4	69
3077	College Springs	college-springs	4	74
3078	Colo	colo	4	69
3079	Columbus Junction	columbus-junction	4	73
3080	Conrad	conrad	4	71
3081	Coon Rapids	coon-rapids	4	69
3082	Coralville	coralville	4	71
3083	Corning	corning	4	69
3084	Correctionville	correctionville	4	72
3085	Corydon	corydon	4	69
3086	Council Bluffs	council-bluffs	4	74
3087	Crescent	crescent	4	74
3088	Cresco	cresco	4	75
3089	Creston	creston	4	69
3090	Crystal Lake	crystal-lake	4	75
3091	Cumberland	cumberland	4	74
3092	Cumming	cumming	4	69
3093	Cylinder	cylinder	4	72
3094	Dakota City	dakota-city	4	69
3095	Melcher-Dallas	melcher-dallas	4	69
3096	Dallas Center	dallas-center	4	69
3097	Danville	danville	4	73
3098	Davenport	davenport	4	73
3099	De Soto	de-soto	4	69
3100	DeWitt	dewitt	4	73
3101	Decatur City	decatur-city	4	69
3102	Decorah	decorah	4	71
3103	Defiance	defiance	4	74
3104	Delhi	delhi	4	71
3105	Delmar	delmar	4	73
3106	Denison	denison	4	74
3107	Denver	denver	4	71
3108	Des Moines	des-moines	4	69
3109	Dexter	dexter	4	69
3110	Diagonal	diagonal	4	69
3111	Dickens	dickens	4	72
3112	Dike	dike	4	71
3113	Donnellson	donnellson	4	76
3114	Doon	doon	4	77
3115	Dows	dows	4	69
3116	Dubuque	dubuque	4	71
3117	Dumont	dumont	4	71
3118	Dunkerton	dunkerton	4	71
3119	Dunlap	dunlap	4	74
3120	Durant	durant	4	71
3121	Dyersville	dyersville	4	71
3122	Dysart	dysart	4	71
3123	Eagle Grove	eagle-grove	4	69
3124	Earlham	earlham	4	69
3125	Earling	earling	4	74
3126	Eddyville	eddyville	4	70
3127	Edgewood	edgewood	4	71
3128	Eldon	eldon	4	70
3129	Eldora	eldora	4	69
3130	Eldridge	eldridge	4	73
3131	Elgin	elgin	4	71
3132	Elk Horn	elk-horn	4	74
3133	Elkader	elkader	4	71
3134	Ellsworth	ellsworth	4	69
3135	Emerson	emerson	4	74
3136	Emmetsburg	emmetsburg	4	72
3137	Epworth	epworth	4	71
3138	Essex	essex	4	74
3139	Estherville	estherville	4	72
3140	Everly	everly	4	72
3141	Exira	exira	4	69
3142	Fairbank	fairbank	4	71
3143	Fairfield	fairfield	4	70
3144	Farley	farley	4	71
3145	Farragut	farragut	4	74
3146	Fayette	fayette	4	71
3147	Fenton	fenton	4	69
3148	Ferguson	ferguson	4	69
3149	Fontanelle	fontanelle	4	69
3150	Forest City	forest-city	4	75
3151	Fredericksburg	fredericksburg	4	71
3152	Fremont	fremont	4	69
3153	Fort Dodge	fort-dodge	4	69
3154	Fort Madison	fort-madison	4	76
3155	Garnavillo	garnavillo	4	71
3156	Garner	garner	4	75
3157	Garwin	garwin	4	71
3158	George	george	4	77
3159	Gilbert	gilbert	4	69
3160	Gillett Grove	gillett-grove	4	72
3161	Gilman	gilman	4	69
3162	Gladbrook	gladbrook	4	71
3163	Glenwood	glenwood	4	74
3164	Glidden	glidden	4	69
3165	Goldfield	goldfield	4	69
3166	Goose Lake	goose-lake	4	73
3167	Gowrie	gowrie	4	69
3168	Graettinger	graettinger	4	72
3169	Grand Junction	grand-junction	4	69
3170	Grand Mound	grand-mound	4	73
3171	Granger	granger	4	69
3172	Granville	granville	4	72
3173	Greene	greene	4	71
3174	Greenfield	greenfield	4	69
3175	Grimes	grimes	4	69
3176	Grinnell	grinnell	4	69
3177	Griswold	griswold	4	74
3178	Grundy Center	grundy-center	4	71
3179	Guthrie Center	guthrie-center	4	69
3180	Guttenberg	guttenberg	4	71
3181	Hamburg	hamburg	4	74
3182	Hampton	hampton	4	69
3183	Harlan	harlan	4	74
3184	Hartley	hartley	4	72
3185	Hartwick	hartwick	4	69
3186	Hastings	hastings	4	74
3187	Havelock	havelock	4	69
3188	Hawarden	hawarden	4	72
3189	Henderson	henderson	4	74
3190	Hiawatha	hiawatha	4	71
3191	Hills	hills	4	71
3192	Hinton	hinton	4	72
3193	Holstein	holstein	4	72
3194	Hornick	hornick	4	72
3195	Hospers	hospers	4	72
3196	Hubbard	hubbard	4	69
3197	Hudson	hudson	4	71
3198	Hull	hull	4	72
3199	Humboldt	humboldt	4	69
3200	Humeston	humeston	4	69
3201	Huxley	huxley	4	69
3202	Ida Grove	ida-grove	4	72
3203	Independence	independence	4	71
3204	Indianola	indianola	4	69
3205	Inwood	inwood	4	77
3206	Iowa City	iowa-city	4	71
3207	Iowa Falls	iowa-falls	4	69
3208	Janesville	janesville	4	71
3209	Jefferson	jefferson	4	69
3210	Jesup	jesup	4	71
3211	Jewell	jewell	4	69
3212	Johnston	johnston	4	69
3213	Kalona	kalona	4	71
3214	Kamrar	kamrar	4	69
3215	Kanawha	kanawha	4	75
3216	Kensett	kensett	4	75
3217	Keokuk	keokuk	4	76
3218	Keosauqua	keosauqua	4	70
3219	Keota	keota	4	71
3220	Keystone	keystone	4	71
3221	Kingsley	kingsley	4	72
3222	Knoxville	knoxville	4	69
3223	La Porte City	la-porte-city	4	71
3224	Lake City	lake-city	4	69
3225	Lake Mills	lake-mills	4	75
3226	Lake Park	lake-park	4	72
3227	Lake View	lake-view	4	72
3228	Lamoni	lamoni	4	69
3229	Lansing	lansing	4	71
3230	Latimer	latimer	4	69
3231	Laurel	laurel	4	69
3232	Laurens	laurens	4	69
3233	Lawton	lawton	4	72
3234	Le Mars	le-mars	4	72
3235	Lehigh	lehigh	4	69
3236	Lenox	lenox	4	69
3237	Leon	leon	4	69
3238	Letts	letts	4	73
3239	Liberty Center	liberty-center	4	69
3240	Lime Springs	lime-springs	4	75
3241	Lineville	lineville	4	69
3242	Lisbon	lisbon	4	71
3243	Livermore	livermore	4	69
3244	Logan	logan	4	74
3245	Lone Tree	lone-tree	4	71
3246	Lost Nation	lost-nation	4	73
3247	Lovilia	lovilia	4	69
3248	Lu Verne	lu-verne	4	69
3249	Lynnville	lynnville	4	69
3250	Madrid	madrid	4	69
3251	Malcom	malcom	4	69
3252	Mallard	mallard	4	72
3253	Malvern	malvern	4	74
3254	Manchester	manchester	4	71
3255	Manilla	manilla	4	74
3256	Manly	manly	4	75
3257	Manning	manning	4	69
3258	Manson	manson	4	69
3259	Mapleton	mapleton	4	72
3260	Maquoketa	maquoketa	4	73
3261	Marcus	marcus	4	72
3262	Marengo	marengo	4	71
3263	Marion	marion	4	71
3264	Marshalltown	marshalltown	4	69
3265	Martelle	martelle	4	71
3266	Martensdale	martensdale	4	69
3267	Mason City	mason-city	4	75
3268	Massena	massena	4	74
3269	Maxwell	maxwell	4	69
3270	Maynard	maynard	4	71
3271	McCallsburg	mccallsburg	4	69
3272	McClelland	mcclelland	4	74
3273	McGregor	mcgregor	4	71
3274	Mechanicsville	mechanicsville	4	71
3275	Mediapolis	mediapolis	4	73
3276	Melbourne	melbourne	4	69
3277	Meriden	meriden	4	72
3278	Miles	miles	4	73
3279	Milford	milford	4	72
3280	Millersburg	millersburg	4	71
3281	Minburn	minburn	4	69
3282	Missouri Valley	missouri-valley	4	74
3283	Mitchellville	mitchellville	4	69
3284	Mondamin	mondamin	4	74
3285	Monona	monona	4	71
3286	Montezuma	montezuma	4	69
3287	Monticello	monticello	4	71
3288	Moorhead	moorhead	4	72
3289	Morning Sun	morning-sun	4	73
3290	Moscow	moscow	4	73
3291	Moulton	moulton	4	69
3292	Mount Ayr	mount-ayr	4	69
3293	Mount Pleasant	mount-pleasant	4	73
3294	Mount Vernon	mount-vernon	4	71
3295	Moville	moville	4	72
3296	Murray	murray	4	69
3297	Muscatine	muscatine	4	73
3298	Nashua	nashua	4	71
3299	Neola	neola	4	74
3300	Nevada	nevada	4	69
3301	New Hampton	new-hampton	4	71
3302	New London	new-london	4	73
3303	New Market	new-market	4	69
3304	New Sharon	new-sharon	4	69
3305	Newell	newell	4	72
3306	Newhall	newhall	4	71
3307	Newton	newton	4	69
3308	Nora Springs	nora-springs	4	75
3309	North English	north-english	4	71
3310	North Liberty	north-liberty	4	71
3311	Northwood	northwood	4	75
3312	Norwalk	norwalk	4	69
3313	Norway	norway	4	71
3314	Oakland	oakland	4	74
3315	Oakville	oakville	4	73
3316	Ocheyedan	ocheyedan	4	77
3317	Odebolt	odebolt	4	72
3318	Oelwein	oelwein	4	71
3319	Ogden	ogden	4	69
3320	Okoboji	okoboji	4	72
3321	Olin	olin	4	71
3322	Onawa	onawa	4	72
3323	Oran	oran	4	71
3324	Orange City	orange-city	4	72
3325	Orient	orient	4	69
3326	Osage	osage	4	75
3327	Osceola	osceola	4	69
3328	Oskaloosa	oskaloosa	4	69
3329	Ottumwa	ottumwa	4	70
3330	Oxford	oxford	4	71
3331	Oxford Junction	oxford-junction	4	71
3332	Packwood	packwood	4	70
3333	Palmer	palmer	4	69
3334	Palo	palo	4	71
3335	Panama	panama	4	74
3336	Panora	panora	4	69
3337	Parkersburg	parkersburg	4	71
3338	Patterson	patterson	4	69
3339	Paullina	paullina	4	72
3340	Pella	pella	4	69
3341	Peosta	peosta	4	71
3342	Perry	perry	4	69
3343	Plainfield	plainfield	4	71
3344	Pleasantville	pleasantville	4	69
3345	Pocahontas	pocahontas	4	69
3346	Pomeroy	pomeroy	4	69
3347	Postville	postville	4	71
3348	Prairie City	prairie-city	4	69
3349	Preston	preston	4	73
3350	Primghar	primghar	4	72
3351	Ralston	ralston	4	69
3352	Readlyn	readlyn	4	71
3353	Red Oak	red-oak	4	74
3354	Reinbeck	reinbeck	4	71
3355	Remsen	remsen	4	72
3356	Riceville	riceville	4	75
3357	Richland	richland	4	71
3358	Ringsted	ringsted	4	72
3359	Riverside	riverside	4	71
3360	Robins	robins	4	71
3361	Rock Rapids	rock-rapids	4	77
3362	Rock Valley	rock-valley	4	72
3363	Rockford	rockford	4	75
3364	Rockwell	rockwell	4	75
3365	Rockwell City	rockwell-city	4	69
3366	Rudd	rudd	4	75
3367	Runnells	runnells	4	69
3368	Ruthven	ruthven	4	72
3369	Sabula	sabula	4	73
3370	Sac City	sac-city	4	72
3371	Salix	salix	4	72
3372	Schaller	schaller	4	72
3373	Schleswig	schleswig	4	74
3374	Scranton	scranton	4	69
3375	Sergeant Bluff	sergeant-bluff	4	72
3376	Seymour	seymour	4	69
3377	Sheffield	sheffield	4	69
3378	Shelby	shelby	4	74
3379	Sheldon	sheldon	4	72
3380	Shell Rock	shell-rock	4	71
3381	Shellsburg	shellsburg	4	71
3382	Shenandoah	shenandoah	4	74
3383	Sibley	sibley	4	77
3384	Sidney	sidney	4	74
3385	Sigourney	sigourney	4	71
3386	Sioux Center	sioux-center	4	72
3387	Sioux City	sioux-city	4	72
3388	Sioux Rapids	sioux-rapids	4	72
3389	Slater	slater	4	69
3390	Sloan	sloan	4	72
3391	Solon	solon	4	71
3392	South English	south-english	4	71
3393	Spencer	spencer	4	72
3394	Sperry	sperry	4	73
3395	Spillville	spillville	4	71
3396	Spirit Lake	spirit-lake	4	72
3397	Springville	springville	4	71
3398	Saint Ansgar	saint-ansgar	4	75
3399	Saint Anthony	saint-anthony	4	69
3400	Saint Charles	saint-charles	4	69
3401	Stanhope	stanhope	4	69
3402	Stanton	stanton	4	74
3403	Stanwood	stanwood	4	71
3404	State Center	state-center	4	69
3405	Storm Lake	storm-lake	4	72
3406	Story City	story-city	4	69
3407	Stratford	stratford	4	69
3408	Strawberry Point	strawberry-point	4	71
3409	Stuart	stuart	4	69
3410	Sully	sully	4	69
3411	Sumner	sumner	4	71
3412	Superior	superior	4	72
3413	Swea City	swea-city	4	69
3414	Swisher	swisher	4	71
3415	Tabor	tabor	4	74
3416	Tama	tama	4	71
3417	Terril	terril	4	72
3418	Thompson	thompson	4	75
3419	Thornburg	thornburg	4	71
3420	Thornton	thornton	4	75
3421	Tiffin	tiffin	4	71
3422	Tipton	tipton	4	71
3423	Titonka	titonka	4	69
3424	Toledo	toledo	4	71
3425	Traer	traer	4	71
3426	Treynor	treynor	4	74
3427	Tripoli	tripoli	4	71
3428	Troy Mills	troy-mills	4	71
3429	Truro	truro	4	69
3430	Underwood	underwood	4	74
3431	Union	union	4	69
3432	Unionville	unionville	4	69
3433	Urbana	urbana	4	71
3434	Urbandale	urbandale	4	69
3435	Vail	vail	4	74
3436	Van Horne	van-horne	4	71
3437	Van Meter	van-meter	4	69
3438	Ventura	ventura	4	75
3439	Victor	victor	4	71
3440	Villisca	villisca	4	74
3441	Vinton	vinton	4	71
3442	Walcott	walcott	4	73
3443	Wall Lake	wall-lake	4	72
3444	Walnut	walnut	4	74
3445	Wapello	wapello	4	73
3446	Washington	washington	4	71
3447	Waterloo	waterloo	4	71
3448	Waucoma	waucoma	4	71
3449	Waukee	waukee	4	69
3450	Waukon	waukon	4	71
3451	Waverly	waverly	4	71
3452	Wayland	wayland	4	73
3453	Webster City	webster-city	4	69
3454	Wellman	wellman	4	71
3455	Wellsburg	wellsburg	4	71
3456	Wesley	wesley	4	69
3457	West Bend	west-bend	4	72
3458	West Bend	west-bend	4	69
3459	West Branch	west-branch	4	71
3460	West Burlington	west-burlington	4	73
3461	West Des Moines	west-des-moines	4	69
3462	West Liberty	west-liberty	4	73
3463	West Point	west-point	4	76
3464	West Union	west-union	4	71
3465	Westside	westside	4	74
3466	What Cheer	what-cheer	4	71
3467	Wheatland	wheatland	4	73
3468	Whiting	whiting	4	72
3469	Williamsburg	williamsburg	4	71
3470	Wilton	wilton	4	73
3471	Winterset	winterset	4	69
3472	Winthrop	winthrop	4	71
3473	Woden	woden	4	75
3474	Woodbine	woodbine	4	74
3475	Woodward	woodward	4	69
3476	Woolstock	woolstock	4	69
3477	Wyoming	wyoming	4	71
3478	Zearing	zearing	4	69
3479	Ely	ely	4	71
3480	Le Claire	le-claire	4	73
3481	Pleasant Hill	pleasant-hill	4	69
3482	Aberdeen	aberdeen	21	78
3483	American Falls	american-falls	21	78
3484	Arco	arco	21	78
3485	Arimo	arimo	21	78
3486	Athol	athol	21	79
3487	Atlanta	atlanta	21	80
3488	Avery	avery	21	79
3489	Bancroft	bancroft	21	78
3490	Blackfoot	blackfoot	21	78
3491	Bliss	bliss	21	81
3492	Boise	boise	21	80
3493	Bonners Ferry	bonners-ferry	21	79
3494	Bruneau	bruneau	21	80
3495	Buhl	buhl	21	81
3496	Burley	burley	21	81
3497	Caldwell	caldwell	21	80
3498	Cambridge	cambridge	21	80
3499	Cascade	cascade	21	80
3500	Challis	challis	21	78
3501	Coeur d Alene	coeur-d-alene	21	79
3502	Cottonwood	cottonwood	21	79
3503	Council	council	21	80
3504	Craigmont	craigmont	21	79
3505	Culdesac	culdesac	21	79
3506	Dayton	dayton	21	82
3507	De Smet	de-smet	21	79
3508	Dietrich	dietrich	21	81
3509	Driggs	driggs	21	78
3510	Eagle	eagle	21	80
3511	Emmett	emmett	21	80
3512	Fairfield	fairfield	21	80
3513	Filer	filer	21	81
3514	Firth	firth	21	78
3515	Fruitland	fruitland	21	80
3516	Fort Hall	fort-hall	21	78
3517	Garden City	garden-city	21	80
3518	Garden Valley	garden-valley	21	80
3519	Gibbonsville	gibbonsville	21	78
3520	Glenns Ferry	glenns-ferry	21	80
3521	Gooding	gooding	21	81
3522	Grace	grace	21	78
3523	Grand View	grand-view	21	80
3524	Grangeville	grangeville	21	79
3525	Hagerman	hagerman	21	81
3526	Hailey	hailey	21	81
3527	Hansen	hansen	21	81
3528	Harrison	harrison	21	79
3529	Hayden	hayden	21	79
3530	Hazelton	hazelton	21	81
3531	Homedale	homedale	21	80
3532	Horseshoe Bend	horseshoe-bend	21	80
3533	Idaho City	idaho-city	21	80
3534	Idaho Falls	idaho-falls	21	78
3535	Irwin	irwin	21	78
3536	Jerome	jerome	21	81
3537	Kamiah	kamiah	21	79
3538	Kellogg	kellogg	21	79
3539	Kendrick	kendrick	21	79
3540	Ketchum	ketchum	21	81
3541	Kootenai	kootenai	21	79
3542	Kuna	kuna	21	80
3543	Laclede	laclede	21	79
3544	Lapwai	lapwai	21	79
3545	Lewiston	lewiston	21	79
3546	Mackay	mackay	21	78
3547	Malad City	malad-city	21	82
3548	Marsing	marsing	21	80
3549	McCall	mccall	21	80
3550	McCammon	mccammon	21	78
3551	Melba	melba	21	80
3552	Meridian	meridian	21	80
3553	Middleton	middleton	21	80
3554	Midvale	midvale	21	80
3555	Minidoka	minidoka	21	81
3556	Montpelier	montpelier	21	82
3557	Moscow	moscow	21	79
3558	Mountain Home	mountain-home	21	80
3559	Mountain Home Air Force Base	mountain-home-air-force-base	21	80
3560	Mullan	mullan	21	79
3561	Murphy	murphy	21	80
3562	Murtaugh	murtaugh	21	81
3563	Nampa	nampa	21	80
3564	Naples	naples	21	79
3565	New Meadows	new-meadows	21	80
3566	New Plymouth	new-plymouth	21	80
3567	Nezperce	nezperce	21	79
3568	Notus	notus	21	80
3569	Orofino	orofino	21	79
3570	Osburn	osburn	21	79
3571	Paris	paris	21	82
3572	Parma	parma	21	80
3573	Paul	paul	21	81
3574	Payette	payette	21	80
3575	Pierce	pierce	21	79
3576	Plummer	plummer	21	79
3577	Pocatello	pocatello	21	78
3578	Porthill	porthill	21	79
3579	Post Falls	post-falls	21	79
3580	Potlatch	potlatch	21	79
3581	Preston	preston	21	82
3582	Priest River	priest-river	21	79
3583	Princeton	princeton	21	79
3584	Rathdrum	rathdrum	21	79
3585	Rexburg	rexburg	21	78
3586	Rigby	rigby	21	78
3587	Ririe	ririe	21	78
3588	Rockland	rockland	21	78
3589	Rupert	rupert	21	81
3590	Sagle	sagle	21	79
3591	Salmon	salmon	21	78
3592	Sandpoint	sandpoint	21	79
3593	Shelley	shelley	21	78
3594	Shoshone	shoshone	21	81
3595	Smelterville	smelterville	21	79
3596	Soda Springs	soda-springs	21	78
3597	Spirit Lake	spirit-lake	21	79
3598	Saint Anthony	saint-anthony	21	78
3599	Saint Maries	saint-maries	21	79
3600	Sugar City	sugar-city	21	78
3601	Sun Valley	sun-valley	21	81
3602	Troy	troy	21	79
3603	Twin Falls	twin-falls	21	81
3604	Wallace	wallace	21	79
3605	Weippe	weippe	21	79
3606	Weiser	weiser	21	80
3607	Wendell	wendell	21	81
3608	Wilder	wilder	21	80
3609	Worley	worley	21	79
3610	Victor	victor	21	78
3611	Addieville	addieville	5	83
3612	Addison	addison	5	84
3613	Albion	albion	5	85
3614	Aledo	aledo	5	86
3615	Alexis	alexis	5	86
3616	Algonquin	algonquin	5	84
3617	Alhambra	alhambra	5	83
3618	Alsip	alsip	5	84
3619	Altamont	altamont	5	87
3620	Alton	alton	5	83
3621	Amboy	amboy	5	88
3622	Anna	anna	5	89
3623	Annapolis	annapolis	5	90
3624	Annawan	annawan	5	86
3625	Antioch	antioch	5	84
3626	Apple River	apple-river	5	86
3627	Arcola	arcola	5	87
3628	Arenzville	arenzville	5	87
3629	Arlington Heights	arlington-heights	5	84
3630	Arthur	arthur	5	87
3631	Ashland	ashland	5	87
3632	Ashley	ashley	5	83
3633	Ashton	ashton	5	88
3634	Assumption	assumption	5	87
3635	Astoria	astoria	5	91
3636	Athens	athens	5	87
3637	Atlanta	atlanta	5	87
3638	Auburn	auburn	5	87
3639	Augusta	augusta	5	92
3640	Aurora	aurora	5	84
3641	Baileyville	baileyville	5	88
3642	Barnhill	barnhill	5	85
3643	Barrington	barrington	5	84
3644	Barry	barry	5	92
3645	Bartelso	bartelso	5	83
3646	Bartlett	bartlett	5	84
3647	Batavia	batavia	5	84
3648	Beardstown	beardstown	5	87
3649	Bedford Park	bedford-park	5	84
3650	Beecher	beecher	5	84
3651	Belleville	belleville	5	83
3652	Bellflower	bellflower	5	91
3653	Bellwood	bellwood	5	84
3654	Belvidere	belvidere	5	88
3655	Bement	bement	5	87
3656	Bensenville	bensenville	5	84
3657	Benton	benton	5	89
3658	Berkeley	berkeley	5	84
3659	Berwyn	berwyn	5	84
3660	Bethalto	bethalto	5	83
3661	Bethany	bethany	5	87
3662	Big Rock	big-rock	5	84
3663	Biggsville	biggsville	5	86
3664	Bismarck	bismarck	5	87
3665	Bloomingdale	bloomingdale	5	84
3666	Bloomington	bloomington	5	91
3667	Blue Island	blue-island	5	84
3668	Blue Mound	blue-mound	5	87
3669	Bluffs	bluffs	5	92
3670	Bolingbrook	bolingbrook	5	84
3671	Bourbonnais	bourbonnais	5	84
3672	Braceville	braceville	5	84
3673	Bradford	bradford	5	91
3674	Bradley	bradley	5	84
3675	Breese	breese	5	83
3676	Bridgeport	bridgeport	5	90
3677	Bridgeview	bridgeview	5	84
3678	Brighton	brighton	5	83
3679	Brimfield	brimfield	5	91
3680	Broadlands	broadlands	5	87
3681	Broadview	broadview	5	84
3682	Brookfield	brookfield	5	84
3683	Brookport	brookport	5	89
3684	Brownstown	brownstown	5	83
3685	Buda	buda	5	86
3686	Buffalo	buffalo	5	87
3687	Buffalo Grove	buffalo-grove	5	84
3688	Buncombe	buncombe	5	89
3689	Bunker Hill	bunker-hill	5	83
3690	Burbank	burbank	5	84
3691	Bureau	bureau	5	86
3692	Burlington	burlington	5	84
3693	Burnt Prairie	burnt-prairie	5	85
3694	Bushnell	bushnell	5	92
3695	Byron	byron	5	88
3696	Caledonia	caledonia	5	88
3697	Calhoun	calhoun	5	90
3698	Calumet City	calumet-city	5	84
3699	Cambridge	cambridge	5	86
3700	Camden	camden	5	92
3701	Camp Point	camp-point	5	92
3702	Canton	canton	5	91
3703	Capron	capron	5	88
3704	Carbondale	carbondale	5	89
3705	Carlinville	carlinville	5	83
3706	Carlyle	carlyle	5	83
3707	Carmi	carmi	5	85
3708	Carol Stream	carol-stream	5	84
3709	Carpentersville	carpentersville	5	84
3710	Carrier Mills	carrier-mills	5	89
3711	Carrollton	carrollton	5	83
3712	Carterville	carterville	5	89
3713	Carthage	carthage	5	92
3714	Cary	cary	5	84
3715	Casey	casey	5	90
3716	Catlin	catlin	5	87
3717	Centralia	centralia	5	83
3718	Cerro Gordo	cerro-gordo	5	87
3719	Champaign	champaign	5	87
3720	Channahon	channahon	5	84
3721	Charleston	charleston	5	87
3722	Chatham	chatham	5	87
3723	Chatsworth	chatsworth	5	91
3724	Chenoa	chenoa	5	91
3725	Cherry Valley	cherry-valley	5	88
3726	Chester	chester	5	83
3727	Chicago	chicago	5	84
3728	Chicago Heights	chicago-heights	5	84
3729	Chicago Ridge	chicago-ridge	5	84
3730	Chillicothe	chillicothe	5	91
3731	Chrisman	chrisman	5	87
3732	Christopher	christopher	5	89
3733	Cicero	cicero	5	84
3734	Cissna Park	cissna-park	5	87
3735	Clarendon Hills	clarendon-hills	5	84
3736	Clay City	clay-city	5	83
3737	Clifton	clifton	5	87
3738	Clinton	clinton	5	87
3739	Coal City	coal-city	5	84
3740	Coal Valley	coal-valley	5	86
3741	Cobden	cobden	5	89
3742	Colchester	colchester	5	92
3743	Colfax	colfax	5	91
3744	Collinsville	collinsville	5	83
3745	Columbia	columbia	5	83
3746	Cordova	cordova	5	86
3747	Cortland	cortland	5	84
3748	Coulterville	coulterville	5	83
3749	Country Club Hills	country-club-hills	5	84
3750	Cowden	cowden	5	87
3751	Creal Springs	creal-springs	5	89
3752	Crescent City	crescent-city	5	87
3753	Crete	crete	5	84
3754	Creve Coeur	creve-coeur	5	91
3755	Crossville	crossville	5	85
3756	Crystal Lake	crystal-lake	5	84
3757	Cuba	cuba	5	91
3758	Cullom	cullom	5	91
3759	Dahlgren	dahlgren	5	89
3760	Dakota	dakota	5	88
3761	Dallas City	dallas-city	5	92
3762	Danvers	danvers	5	91
3763	Danville	danville	5	87
3764	Darien	darien	5	84
3765	Davis	davis	5	88
3766	Decatur	decatur	5	87
3767	Deer Creek	deer-creek	5	91
3768	Deerfield	deerfield	5	84
3769	DeKalb	dekalb	5	84
3770	Delavan	delavan	5	91
3771	DePue	depue	5	86
3772	Des Plaines	des-plaines	5	84
3773	Dieterich	dieterich	5	87
3774	Dixon	dixon	5	88
3775	Dolton	dolton	5	84
3776	Dongola	dongola	5	89
3777	Donovan	donovan	5	87
3778	Downers Grove	downers-grove	5	84
3779	Downs	downs	5	91
3780	Du Quoin	du-quoin	5	89
3781	Dunlap	dunlap	5	91
3782	Dupo	dupo	5	83
3783	Durand	durand	5	88
3784	Dwight	dwight	5	91
3785	Earlville	earlville	5	84
3786	East Alton	east-alton	5	83
3787	East Dubuque	east-dubuque	5	86
3788	East Moline	east-moline	5	86
3789	East Peoria	east-peoria	5	91
3790	East Saint Louis	east-saint-louis	5	83
3791	Edelstein	edelstein	5	91
3792	Edwards	edwards	5	91
3793	Edwardsville	edwardsville	5	83
3794	Effingham	effingham	5	87
3795	El Paso	el-paso	5	91
3796	Elburn	elburn	5	84
3797	Eldorado	eldorado	5	89
3798	Elgin	elgin	5	84
3799	Elizabeth	elizabeth	5	86
3800	Elk Grove Village	elk-grove-village	5	84
3801	Elkhart	elkhart	5	87
3802	Ellis Grove	ellis-grove	5	83
3803	Elmhurst	elmhurst	5	84
3804	Elmwood	elmwood	5	91
3805	Elmwood Park	elmwood-park	5	84
3806	Elsah	elsah	5	83
3807	Elwood	elwood	5	84
3808	Energy	energy	5	89
3809	Equality	equality	5	89
3810	Erie	erie	5	86
3811	Eureka	eureka	5	91
3812	Evanston	evanston	5	84
3813	Evansville	evansville	5	83
3814	Evergreen Park	evergreen-park	5	84
3815	Fairbury	fairbury	5	91
3816	Fairfield	fairfield	5	85
3817	Fairview Heights	fairview-heights	5	83
3818	Farina	farina	5	83
3819	Farmer City	farmer-city	5	87
3820	Farmington	farmington	5	91
3821	Fenton	fenton	5	86
3822	Fillmore	fillmore	5	83
3823	Findlay	findlay	5	87
3824	Fisher	fisher	5	87
3825	Fithian	fithian	5	87
3826	Flanagan	flanagan	5	91
3827	Flat Rock	flat-rock	5	90
3828	Flora	flora	5	83
3829	Flossmoor	flossmoor	5	84
3830	Forest Park	forest-park	5	84
3831	Forrest	forrest	5	91
3832	Forreston	forreston	5	88
3833	Forsyth	forsyth	5	87
3834	Fox Lake	fox-lake	5	84
3835	Fox River Grove	fox-river-grove	5	84
3836	Frankfort	frankfort	5	84
3837	Franklin	franklin	5	87
3838	Franklin Park	franklin-park	5	84
3839	Freeburg	freeburg	5	83
3840	Freeport	freeport	5	88
3841	Fort Sheridan	fort-sheridan	5	84
3842	Fulton	fulton	5	86
3843	Galatia	galatia	5	89
3844	Galena	galena	5	86
3845	Galesburg	galesburg	5	86
3846	Garden Prairie	garden-prairie	5	88
3847	Gardner	gardner	5	84
3848	Geneseo	geneseo	5	86
3849	Geneva	geneva	5	84
3850	Genoa	genoa	5	84
3851	Georgetown	georgetown	5	87
3852	Germantown	germantown	5	83
3853	Gibson City	gibson-city	5	87
3854	Gillespie	gillespie	5	83
3855	Gilman	gilman	5	87
3856	Girard	girard	5	83
3857	Glasford	glasford	5	91
3858	Glen Carbon	glen-carbon	5	83
3859	Glen Ellyn	glen-ellyn	5	84
3860	Glencoe	glencoe	5	84
3861	Glendale Heights	glendale-heights	5	84
3862	Glenview	glenview	5	84
3863	Glenwood	glenwood	5	84
3864	Godfrey	godfrey	5	83
3865	Golconda	golconda	5	89
3866	Golden	golden	5	92
3867	Golf	golf	5	84
3868	Goodfield	goodfield	5	91
3869	Goreville	goreville	5	89
3870	Grafton	grafton	5	83
3871	Grand Ridge	grand-ridge	5	84
3872	Granite City	granite-city	5	83
3873	Grant Park	grant-park	5	84
3874	Granville	granville	5	91
3875	Graymont	graymont	5	91
3876	Grayslake	grayslake	5	84
3877	Great Lakes	great-lakes	5	84
3878	Green Valley	green-valley	5	91
3879	Greenfield	greenfield	5	83
3880	Greenup	greenup	5	87
3881	Greenview	greenview	5	87
3882	Greenville	greenville	5	83
3883	Gridley	gridley	5	91
3884	Griggsville	griggsville	5	92
3885	Gurnee	gurnee	5	84
3886	Hamel	hamel	5	83
3887	Hamilton	hamilton	5	92
3888	Hammond	hammond	5	87
3889	Hampshire	hampshire	5	84
3890	Hampton	hampton	5	86
3891	Hanna City	hanna-city	5	91
3892	Hardin	hardin	5	83
3893	Harmon	harmon	5	88
3894	Harrisburg	harrisburg	5	89
3895	Harvard	harvard	5	84
3896	Harvey	harvey	5	84
3897	Harwood Heights	harwood-heights	5	84
3898	Havana	havana	5	91
3899	Hazel Crest	hazel-crest	5	84
3900	Hebron	hebron	5	84
3901	Henderson	henderson	5	86
3902	Henry	henry	5	91
3903	Herrick	herrick	5	87
3904	Herrin	herrin	5	89
3905	Herscher	herscher	5	84
3906	Heyworth	heyworth	5	91
3907	Hickory Hills	hickory-hills	5	84
3908	Highland	highland	5	83
3909	Highland Park	highland-park	5	84
3910	Highwood	highwood	5	84
3911	Hillsboro	hillsboro	5	83
3912	Hillside	hillside	5	84
3913	Hinckley	hinckley	5	84
3914	Hines	hines	5	84
3915	Hinsdale	hinsdale	5	84
3916	Hoffman	hoffman	5	83
3917	Hoffman Estates	hoffman-estates	5	84
3918	Hometown	hometown	5	84
3919	Homewood	homewood	5	84
3920	Hoopeston	hoopeston	5	87
3921	Hopedale	hopedale	5	91
3922	Hopkins Park	hopkins-park	5	84
3923	Hoyleton	hoyleton	5	83
3924	Hudson	hudson	5	91
3925	Hume	hume	5	87
3926	Huntley	huntley	5	84
3927	Hurst	hurst	5	89
3928	Hutsonville	hutsonville	5	90
3929	Illiopolis	illiopolis	5	87
3930	Ina	ina	5	89
3931	Industry	industry	5	92
3932	Ingleside	ingleside	5	84
3933	Iroquois	iroquois	5	87
3934	Irving	irving	5	83
3935	Irvington	irvington	5	83
3936	Island Lake	island-lake	5	84
3937	Itasca	itasca	5	84
3938	Iuka	iuka	5	83
3939	Jacksonville	jacksonville	5	87
3940	Jerseyville	jerseyville	5	83
3941	Johnston City	johnston-city	5	89
3942	Joliet	joliet	5	84
3943	Joppa	joppa	5	89
3944	Joy	joy	5	86
3945	Junction	junction	5	89
3946	Justice	justice	5	84
3947	Kane	kane	5	83
3948	Kaneville	kaneville	5	84
3949	Kankakee	kankakee	5	84
3950	Kansas	kansas	5	87
3951	Kenilworth	kenilworth	5	84
3952	Kewanee	kewanee	5	86
3953	Kinderhook	kinderhook	5	92
3954	Kingston	kingston	5	84
3955	Kingston Mines	kingston-mines	5	91
3956	Kirkland	kirkland	5	84
3957	La Grange	la-grange	5	84
3958	La Grange Park	la-grange-park	5	84
3959	La Harpe	la-harpe	5	92
3960	LaSalle	lasalle	5	84
3961	Lacon	lacon	5	91
3962	La Fox	la-fox	5	84
3963	Lake Bluff	lake-bluff	5	84
3964	Lake Forest	lake-forest	5	84
3965	Lake in the Hills	lake-in-the-hills	5	84
3966	Lake Villa	lake-villa	5	84
3967	Lake Zurich	lake-zurich	5	84
3968	Lansing	lansing	5	84
3969	Lawrenceville	lawrenceville	5	90
3970	Le Roy	le-roy	5	91
3971	Leaf River	leaf-river	5	88
3972	Lebanon	lebanon	5	83
3973	Lee	lee	5	88
3974	Leland	leland	5	84
3975	Lemont	lemont	5	84
3976	Lena	lena	5	88
3977	Lewistown	lewistown	5	91
3978	Lexington	lexington	5	91
3979	Liberty	liberty	5	92
3980	Libertyville	libertyville	5	84
3981	Lincoln	lincoln	5	87
3982	Lincolnshire	lincolnshire	5	84
3983	Lincolnwood	lincolnwood	5	84
3984	Lisle	lisle	5	84
3985	Litchfield	litchfield	5	83
3986	Livingston	livingston	5	83
3987	Lockport	lockport	5	84
3988	Logan	logan	5	89
3989	Lombard	lombard	5	84
3990	London Mills	london-mills	5	91
3991	Long Grove	long-grove	5	84
3992	Louisville	louisville	5	83
3993	Loves Park	loves-park	5	88
3994	Lovington	lovington	5	87
3995	Lyndon	lyndon	5	86
3996	Lyons	lyons	5	84
3997	Machesney Park	machesney-park	5	88
3998	Mackinaw	mackinaw	5	91
3999	Macomb	macomb	5	92
4000	Macon	macon	5	87
4001	Madison	madison	5	83
4002	Magnolia	magnolia	5	91
4003	Mahomet	mahomet	5	87
4004	Malta	malta	5	84
4005	Manhattan	manhattan	5	84
4006	Manito	manito	5	91
4007	Manteno	manteno	5	84
4008	Maple Park	maple-park	5	84
4009	Mapleton	mapleton	5	91
4010	Marengo	marengo	5	84
4011	Marine	marine	5	83
4012	Marion	marion	5	89
4013	Maroa	maroa	5	87
4014	Marseilles	marseilles	5	84
4015	Marshall	marshall	5	90
4016	Martinsville	martinsville	5	90
4017	Maryville	maryville	5	83
4018	Mascoutah	mascoutah	5	83
4019	Mason	mason	5	87
4020	Mason City	mason-city	5	91
4021	Matteson	matteson	5	84
4022	Mattoon	mattoon	5	87
4023	Maywood	maywood	5	84
4024	McLean	mclean	5	91
4025	McLeansboro	mcleansboro	5	89
4026	McNabb	mcnabb	5	91
4027	McHenry	mchenry	5	84
4028	Medinah	medinah	5	84
4029	Melrose Park	melrose-park	5	84
4030	Mendon	mendon	5	92
4031	Mendota	mendota	5	84
4032	Meredosia	meredosia	5	87
4033	Metamora	metamora	5	91
4034	Metropolis	metropolis	5	89
4035	Midlothian	midlothian	5	84
4036	Milan	milan	5	86
4037	Milford	milford	5	87
4038	Milledgeville	milledgeville	5	86
4039	Mineral	mineral	5	86
4040	Minonk	minonk	5	91
4041	Minooka	minooka	5	84
4042	Mokena	mokena	5	84
4043	Moline	moline	5	86
4044	Momence	momence	5	84
4045	Monee	monee	5	84
4046	Monmouth	monmouth	5	86
4047	Montgomery	montgomery	5	84
4048	Monticello	monticello	5	87
4049	Mooseheart	mooseheart	5	84
4050	Morris	morris	5	84
4051	Morrison	morrison	5	86
4052	Morton	morton	5	91
4053	Morton Grove	morton-grove	5	84
4054	Mossville	mossville	5	91
4055	Mounds	mounds	5	89
4056	Mount Carmel	mount-carmel	5	85
4057	Mount Carroll	mount-carroll	5	86
4058	Mount Morris	mount-morris	5	88
4059	Mount Prospect	mount-prospect	5	84
4060	Mount Pulaski	mount-pulaski	5	87
4061	Mount Sterling	mount-sterling	5	92
4062	Mount Vernon	mount-vernon	5	89
4063	Mount Zion	mount-zion	5	87
4064	Moweaqua	moweaqua	5	87
4065	Mundelein	mundelein	5	84
4066	Murphysboro	murphysboro	5	89
4067	Naperville	naperville	5	84
4068	Nashville	nashville	5	83
4069	Nauvoo	nauvoo	5	92
4070	Neponset	neponset	5	86
4071	New Baden	new-baden	5	83
4072	New Berlin	new-berlin	5	87
4073	New Haven	new-haven	5	89
4074	New Lenox	new-lenox	5	84
4075	New Salem	new-salem	5	92
4076	Newark	newark	5	84
4077	Newman	newman	5	87
4078	Newton	newton	5	90
4079	Niantic	niantic	5	87
4080	Niles	niles	5	84
4081	Nokomis	nokomis	5	83
4082	Normal	normal	5	91
4083	Norris City	norris-city	5	85
4084	North Aurora	north-aurora	5	84
4085	North Chicago	north-chicago	5	84
4086	Northbrook	northbrook	5	84
4087	O Fallon	o-fallon	5	83
4088	Oak Brook	oak-brook	5	84
4089	Oak Forest	oak-forest	5	84
4090	Oak Lawn	oak-lawn	5	84
4091	Oak Park	oak-park	5	84
4092	Oakwood	oakwood	5	87
4093	Oblong	oblong	5	90
4094	Oconee	oconee	5	87
4095	Odell	odell	5	91
4096	Odin	odin	5	83
4097	Oglesby	oglesby	5	84
4098	Okawville	okawville	5	83
4099	Olney	olney	5	90
4100	Olympia Fields	olympia-fields	5	84
4101	Oneida	oneida	5	86
4102	Oquawka	oquawka	5	86
4103	Orangeville	orangeville	5	88
4104	Oregon	oregon	5	88
4105	Orland Park	orland-park	5	84
4106	Oswego	oswego	5	84
4107	Ottawa	ottawa	5	84
4108	Palatine	palatine	5	84
4109	Palmyra	palmyra	5	83
4110	Palos Heights	palos-heights	5	84
4111	Palos Hills	palos-hills	5	84
4112	Palos Park	palos-park	5	84
4113	Paris	paris	5	87
4114	Park Forest	park-forest	5	84
4115	Park Ridge	park-ridge	5	84
4116	Patoka	patoka	5	83
4117	Paw Paw	paw-paw	5	88
4118	Pawnee	pawnee	5	87
4119	Paxton	paxton	5	87
4120	Pearl City	pearl-city	5	88
4121	Pecatonica	pecatonica	5	88
4122	Pekin	pekin	5	91
4123	Peoria	peoria	5	91
4124	Peotone	peotone	5	84
4125	Perry	perry	5	92
4126	Peru	peru	5	84
4127	Petersburg	petersburg	5	87
4128	Pinckneyville	pinckneyville	5	89
4129	Piper City	piper-city	5	87
4130	Pittsfield	pittsfield	5	92
4131	Plainfield	plainfield	5	84
4132	Plano	plano	5	84
4133	Plato Center	plato-center	5	84
4134	Pleasant Plains	pleasant-plains	5	87
4135	Plymouth	plymouth	5	92
4136	Pocahontas	pocahontas	5	83
4137	Pontiac	pontiac	5	91
4138	Poplar Grove	poplar-grove	5	88
4139	Port Byron	port-byron	5	86
4140	Posen	posen	5	84
4141	Potomac	potomac	5	87
4142	Prairie du Rocher	prairie-du-rocher	5	83
4143	Princeton	princeton	5	86
4144	Princeville	princeville	5	91
4145	Prophetstown	prophetstown	5	86
4146	Prospect Heights	prospect-heights	5	84
4147	Pulaski	pulaski	5	89
4148	Putnam	putnam	5	91
4149	Quincy	quincy	5	92
4150	Raleigh	raleigh	5	89
4151	Ransom	ransom	5	84
4152	Rantoul	rantoul	5	87
4153	Raymond	raymond	5	83
4154	Red Bud	red-bud	5	83
4155	Richmond	richmond	5	84
4156	Richton Park	richton-park	5	84
4157	Ridge Farm	ridge-farm	5	87
4158	Ridgway	ridgway	5	89
4159	Ringwood	ringwood	5	84
4160	River Forest	river-forest	5	84
4161	River Grove	river-grove	5	84
4162	Riverdale	riverdale	5	84
4163	Riverside	riverside	5	84
4164	Riverton	riverton	5	87
4165	Roanoke	roanoke	5	91
4166	Robinson	robinson	5	90
4167	Rochelle	rochelle	5	88
4168	Rock Falls	rock-falls	5	86
4169	Rock Island	rock-island	5	86
4170	Rockford	rockford	5	88
4171	Rockton	rockton	5	88
4172	Rockwood	rockwood	5	83
4173	Rolling Meadows	rolling-meadows	5	84
4174	Rome	rome	5	91
4175	Romeoville	romeoville	5	84
4176	Roodhouse	roodhouse	5	83
4177	Roscoe	roscoe	5	88
4178	Roselle	roselle	5	84
4179	Roseville	roseville	5	86
4180	Rosiclare	rosiclare	5	89
4181	Rossville	rossville	5	87
4182	Round Lake	round-lake	5	84
4183	Rushville	rushville	5	92
4184	Salem	salem	5	83
4185	Sandoval	sandoval	5	83
4186	Sandwich	sandwich	5	84
4187	Savanna	savanna	5	86
4188	Savoy	savoy	5	87
4189	Scales Mound	scales-mound	5	86
4190	Schaumburg	schaumburg	5	84
4191	Schiller Park	schiller-park	5	84
4192	Sciota	sciota	5	92
4193	Scott Air Force Base	scott-air-force-base	5	83
4194	Seneca	seneca	5	84
4195	Sesser	sesser	5	89
4196	Shabbona	shabbona	5	84
4197	Shawneetown	shawneetown	5	89
4198	Sheffield	sheffield	5	86
4199	Shelbyville	shelbyville	5	87
4200	Sheldon	sheldon	5	87
4201	Sheridan	sheridan	5	84
4202	Sherrard	sherrard	5	86
4203	Shipman	shipman	5	83
4204	Sidell	sidell	5	87
4205	Sidney	sidney	5	87
4206	Simpson	simpson	5	89
4207	Skokie	skokie	5	84
4208	Smithfield	smithfield	5	91
4209	Smithton	smithton	5	83
4210	Somonauk	somonauk	5	84
4211	South Beloit	south-beloit	5	88
4212	South Elgin	south-elgin	5	84
4213	South Holland	south-holland	5	84
4214	South Pekin	south-pekin	5	91
4215	South Wilmington	south-wilmington	5	84
4216	Sparland	sparland	5	91
4217	Sparta	sparta	5	83
4218	Spring Grove	spring-grove	5	84
4219	Spring Valley	spring-valley	5	86
4220	Springfield	springfield	5	87
4221	Saint Anne	saint-anne	5	84
4222	St. Charles	st-charles	5	84
4223	Saint Jacob	saint-jacob	5	83
4224	Saint Joseph	saint-joseph	5	87
4225	Saint Libory	saint-libory	5	83
4226	Stanford	stanford	5	91
4227	Staunton	staunton	5	83
4228	Steeleville	steeleville	5	83
4229	Steger	steger	5	84
4230	Sterling	sterling	5	86
4231	Steward	steward	5	88
4232	Stillman Valley	stillman-valley	5	88
4233	Stockton	stockton	5	86
4234	Stone Park	stone-park	5	84
4235	Stonefort	stonefort	5	89
4236	Strasburg	strasburg	5	87
4237	Streamwood	streamwood	5	84
4238	Streator	streator	5	84
4239	Stronghurst	stronghurst	5	86
4240	Sublette	sublette	5	88
4241	Sugar Grove	sugar-grove	5	84
4242	Sullivan	sullivan	5	87
4243	Summit	summit	5	84
4244	Sumner	sumner	5	90
4245	Sycamore	sycamore	5	84
4246	Table Grove	table-grove	5	91
4247	Tamaroa	tamaroa	5	89
4248	Tamms	tamms	5	89
4249	Taylorville	taylorville	5	87
4250	Teutopolis	teutopolis	5	87
4251	Thayer	thayer	5	87
4252	Thomasboro	thomasboro	5	87
4253	Thomson	thomson	5	86
4254	Thornton	thornton	5	84
4255	Tilden	tilden	5	83
4256	Tinley Park	tinley-park	5	84
4257	Toledo	toledo	5	87
4258	Tolono	tolono	5	87
4259	Toluca	toluca	5	91
4260	Tonica	tonica	5	84
4261	Toulon	toulon	5	91
4262	Towanda	towanda	5	91
4263	Tremont	tremont	5	91
4264	Trenton	trenton	5	83
4265	Trivoli	trivoli	5	91
4266	Troy	troy	5	83
4267	Tuscola	tuscola	5	87
4268	Ullin	ullin	5	89
4269	Union	union	5	84
4270	Urbana	urbana	5	87
4271	Valmeyer	valmeyer	5	83
4272	Vandalia	vandalia	5	83
4273	Venice	venice	5	83
4274	Vermilion	vermilion	5	87
4275	Vermont	vermont	5	91
4276	Vernon Hills	vernon-hills	5	84
4277	Versailles	versailles	5	92
4278	Victoria	victoria	5	86
4279	Vienna	vienna	5	89
4280	Villa Grove	villa-grove	5	87
4281	Villa Park	villa-park	5	84
4282	Virden	virden	5	83
4283	Virgil	virgil	5	84
4284	Virginia	virginia	5	87
4285	Warren	warren	5	86
4286	Warrensburg	warrensburg	5	87
4287	Warrenville	warrenville	5	84
4288	Warsaw	warsaw	5	92
4289	Washburn	washburn	5	91
4290	Washington	washington	5	91
4291	Waterloo	waterloo	5	83
4292	Waterman	waterman	5	84
4293	Watseka	watseka	5	87
4294	Wauconda	wauconda	5	84
4295	Waukegan	waukegan	5	84
4296	Waverly	waverly	5	87
4297	Wayne	wayne	5	84
4298	Wayne City	wayne-city	5	85
4299	Waynesville	waynesville	5	87
4300	Wedron	wedron	5	84
4301	Wenona	wenona	5	91
4302	West Chicago	west-chicago	5	84
4303	West Frankfort	west-frankfort	5	89
4304	West Salem	west-salem	5	85
4305	Westchester	westchester	5	84
4306	Western Springs	western-springs	5	84
4307	Westmont	westmont	5	84
4308	Westville	westville	5	87
4309	Wheaton	wheaton	5	84
4310	Wheeling	wheeling	5	84
4311	Williamsfield	williamsfield	5	86
4312	Williamsville	williamsville	5	87
4313	Willow Springs	willow-springs	5	84
4314	Wilmette	wilmette	5	84
4315	Winchester	winchester	5	92
4316	Windsor	windsor	5	87
4317	Winfield	winfield	5	84
4318	Winnebago	winnebago	5	88
4319	Winnetka	winnetka	5	84
4320	Wonder Lake	wonder-lake	5	84
4321	Wood Dale	wood-dale	5	84
4322	Woodhull	woodhull	5	86
4323	Woodlawn	woodlawn	5	89
4324	Woodridge	woodridge	5	84
4325	Woodstock	woodstock	5	84
4326	Worth	worth	5	84
4327	Yates City	yates-city	5	86
4328	Yorkville	yorkville	5	84
4329	Zion	zion	5	84
4330	Abingdon	abingdon	5	86
4331	Bannockburn	bannockburn	5	84
4332	Bartonville	bartonville	5	91
4333	Bellevue	bellevue	5	91
4334	Braidwood	braidwood	5	84
4335	Burr Ridge	burr-ridge	5	84
4336	Cahokia	cahokia	5	83
4337	Campton Hills	campton-hills	5	84
4338	Countryside	countryside	5	84
4339	Crest Hill	crest-hill	5	84
4340	Crestwood	crestwood	5	84
4341	Davis Junction	davis-junction	5	88
4342	Deer Park	deer-park	5	84
4343	Germantown Hills	germantown-hills	5	91
4344	Gilberts	gilberts	5	84
4345	Green Oaks	green-oaks	5	84
4346	Hanover Park	hanover-park	5	84
4347	Hawthorn Woods	hawthorn-woods	5	84
4348	Homer Glen	homer-glen	5	84
4349	Johnsburg	johnsburg	5	84
4350	Kildeer	kildeer	5	84
4351	Lakemoor	lakemoor	5	84
4352	Lindenhurst	lindenhurst	5	84
4353	Markham	markham	5	84
4354	Mettawa	mettawa	5	84
4355	Millstadt	millstadt	5	83
4356	Norridge	norridge	5	84
4357	Northfield	northfield	5	84
4358	Northlake	northlake	5	84
4359	Oakbrook Terrace	oakbrook-terrace	5	84
4360	Pana	pana	5	87
4361	Riverwoods	riverwoods	5	84
4362	Rosemont	rosemont	5	84
4363	Round Lake Beach	round-lake-beach	5	84
4364	Sherman	sherman	5	87
4365	Shiloh	shiloh	5	83
4366	Shorewood	shorewood	5	84
4367	Sleepy Hollow	sleepy-hollow	5	84
4368	South Barrington	south-barrington	5	84
4369	Swansea	swansea	5	83
4370	University Park	university-park	5	84
4371	West Dundee	west-dundee	5	84
4372	Willowbrook	willowbrook	5	84
4373	Wilmington	wilmington	5	84
4374	Winthrop Harbor	winthrop-harbor	5	84
4375	Wood River	wood-river	5	83
4376	Akron	akron	8	93
4377	Albany	albany	8	94
4378	Albion	albion	8	95
4379	Alexandria	alexandria	8	94
4380	Anderson	anderson	8	94
4381	Angola	angola	8	95
4382	Arcadia	arcadia	8	94
4383	Argos	argos	8	93
4384	Atlanta	atlanta	8	94
4385	Attica	attica	8	94
4386	Auburn	auburn	8	95
4387	Aurora	aurora	8	96
4388	Austin	austin	8	97
4389	Avilla	avilla	8	95
4390	Avon	avon	8	94
4391	Bainbridge	bainbridge	8	94
4392	Batesville	batesville	8	96
4393	Battle Ground	battle-ground	8	98
4394	Bedford	bedford	8	94
4395	Beech Grove	beech-grove	8	94
4396	Berne	berne	8	95
4397	Bicknell	bicknell	8	99
4398	Bippus	bippus	8	95
4399	Birdseye	birdseye	8	100
4400	Bloomfield	bloomfield	8	99
4401	Bloomingdale	bloomingdale	8	99
4402	Bloomington	bloomington	8	94
4403	Bluffton	bluffton	8	95
4404	Boone Grove	boone-grove	8	101
4405	Boonville	boonville	8	100
4406	Borden	borden	8	97
4407	Boswell	boswell	8	98
4408	Bourbon	bourbon	8	93
4409	Brazil	brazil	8	99
4410	Bremen	bremen	8	93
4411	Bristol	bristol	8	93
4412	Brook	brook	8	101
4413	Brookston	brookston	8	94
4414	Brookville	brookville	8	96
4415	Brownsburg	brownsburg	8	94
4416	Brownstown	brownstown	8	97
4417	Bunker Hill	bunker-hill	8	94
4418	Butler	butler	8	95
4419	Butlerville	butlerville	8	97
4420	Cambridge City	cambridge-city	8	94
4421	Camden	camden	8	94
4422	Campbellsburg	campbellsburg	8	97
4423	Canaan	canaan	8	97
4424	Cannelton	cannelton	8	100
4425	Carlisle	carlisle	8	99
4426	Carmel	carmel	8	94
4427	Cayuga	cayuga	8	99
4428	Cedar Lake	cedar-lake	8	101
4429	Celestine	celestine	8	100
4430	Centerville	centerville	8	94
4431	Chalmers	chalmers	8	94
4432	Chandler	chandler	8	100
4433	Charlestown	charlestown	8	97
4434	Charlottesville	charlottesville	8	94
4435	Chesterton	chesterton	8	101
4436	Churubusco	churubusco	8	95
4437	Cicero	cicero	8	94
4438	Clarksville	clarksville	8	97
4439	Clay City	clay-city	8	99
4440	Clayton	clayton	8	94
4441	Clifford	clifford	8	94
4442	Clinton	clinton	8	99
4443	Cloverdale	cloverdale	8	94
4444	Colfax	colfax	8	94
4445	Columbia City	columbia-city	8	95
4446	Columbus	columbus	8	94
4447	Connersville	connersville	8	94
4448	Converse	converse	8	94
4449	Corydon	corydon	8	97
4450	Covington	covington	8	94
4451	Craigville	craigville	8	95
4452	Crane	crane	8	99
4453	Crawfordsville	crawfordsville	8	94
4454	Crothersville	crothersville	8	97
4455	Crown Point	crown-point	8	101
4456	Culver	culver	8	93
4457	Dale	dale	8	100
4458	Daleville	daleville	8	94
4459	Danville	danville	8	94
4460	Dayton	dayton	8	98
4461	Decatur	decatur	8	95
4462	Delphi	delphi	8	94
4463	De Motte	de-motte	8	101
4464	Denver	denver	8	94
4465	Deputy	deputy	8	97
4466	Dillsboro	dillsboro	8	96
4467	Donaldson	donaldson	8	93
4468	Dublin	dublin	8	94
4469	Dubois	dubois	8	100
4470	Dunkirk	dunkirk	8	95
4471	Dyer	dyer	8	101
4472	Earl Park	earl-park	8	98
4473	East Chicago	east-chicago	8	101
4474	East Enterprise	east-enterprise	8	96
4475	Eckerty	eckerty	8	97
4476	Edinburgh	edinburgh	8	94
4477	Elberfeld	elberfeld	8	100
4478	Elizabeth	elizabeth	8	97
4479	Elkhart	elkhart	8	93
4480	Ellettsville	ellettsville	8	94
4481	Elnora	elnora	8	99
4482	Elwood	elwood	8	94
4483	Eminence	eminence	8	94
4484	English	english	8	97
4485	Evansville	evansville	8	100
4486	Fairland	fairland	8	94
4487	Fairmount	fairmount	8	94
4488	Farmersburg	farmersburg	8	99
4489	Farmland	farmland	8	94
4490	Ferdinand	ferdinand	8	100
4491	Fishers	fishers	8	94
4492	Flora	flora	8	94
4493	Floyds Knobs	floyds-knobs	8	97
4494	Fortville	fortville	8	94
4495	Fountain City	fountain-city	8	94
4496	Fountaintown	fountaintown	8	94
4497	Fowler	fowler	8	98
4498	Francesville	francesville	8	93
4499	Frankfort	frankfort	8	94
4500	Franklin	franklin	8	94
4501	Frankton	frankton	8	94
4502	Freelandville	freelandville	8	99
4503	Fremont	fremont	8	95
4504	French Lick	french-lick	8	97
4505	Fort Branch	fort-branch	8	100
4506	Fort Wayne	fort-wayne	8	95
4507	Fulton	fulton	8	93
4508	Galveston	galveston	8	94
4509	Garrett	garrett	8	95
4510	Gary	gary	8	101
4511	Gas City	gas-city	8	94
4512	Gaston	gaston	8	94
4513	Geneva	geneva	8	95
4514	Goodland	goodland	8	101
4515	Goshen	goshen	8	93
4516	Grandview	grandview	8	100
4517	Granger	granger	8	93
4518	Greencastle	greencastle	8	94
4519	Greenfield	greenfield	8	94
4520	Greensburg	greensburg	8	94
4521	Greentown	greentown	8	94
4522	Greenwood	greenwood	8	94
4523	Griffith	griffith	8	101
4524	Grissom Air Force Base	grissom-air-force-base	8	94
4525	Guilford	guilford	8	96
4526	Hagerstown	hagerstown	8	94
4527	Hamilton	hamilton	8	95
4528	Hamlet	hamlet	8	93
4529	Hammond	hammond	8	101
4530	Hanover	hanover	8	97
4531	Hardinsburg	hardinsburg	8	97
4532	Hartford City	hartford-city	8	94
4533	Hazleton	hazleton	8	100
4534	Hebron	hebron	8	101
4535	Henryville	henryville	8	97
4536	Highland	highland	8	101
4537	Hillsboro	hillsboro	8	94
4538	Hobart	hobart	8	101
4539	Hope	hope	8	94
4540	Howe	howe	8	93
4541	Huntingburg	huntingburg	8	100
4542	Huntington	huntington	8	95
4543	Hymera	hymera	8	99
4544	Indianapolis	indianapolis	8	94
4545	Jasonville	jasonville	8	99
4546	Jasper	jasper	8	100
4547	Jeffersonville	jeffersonville	8	97
4548	Kendallville	kendallville	8	95
4549	Kentland	kentland	8	101
4550	Kewanna	kewanna	8	93
4551	Knightstown	knightstown	8	94
4552	Knightsville	knightsville	8	99
4553	Knox	knox	8	93
4554	Kokomo	kokomo	8	94
4555	Kouts	kouts	8	101
4556	La Crosse	la-crosse	8	101
4557	La Porte	la-porte	8	101
4558	Ladoga	ladoga	8	94
4559	Lafayette	lafayette	8	98
4560	LaGrange	lagrange	8	93
4561	Lake Station	lake-station	8	101
4562	Lake Village	lake-village	8	101
4563	Lakeville	lakeville	8	93
4564	Lanesville	lanesville	8	97
4565	Laotto	laotto	8	95
4566	Lapel	lapel	8	94
4567	Laurel	laurel	8	96
4568	Lawrenceburg	lawrenceburg	8	96
4569	Lebanon	lebanon	8	94
4570	Leiters Ford	leiters-ford	8	93
4571	Leo-Cedarville	leo-cedarville	8	95
4572	Leopold	leopold	8	100
4573	Leroy	leroy	8	101
4574	Liberty	liberty	8	96
4575	Ligonier	ligonier	8	95
4576	Lincoln City	lincoln-city	8	100
4577	Linden	linden	8	94
4578	Linton	linton	8	99
4579	Lizton	lizton	8	94
4580	Logansport	logansport	8	94
4581	Loogootee	loogootee	8	99
4582	Losantville	losantville	8	94
4583	Lowell	lowell	8	101
4584	Lucerne	lucerne	8	94
4585	Lynn	lynn	8	94
4586	Madison	madison	8	97
4587	Marengo	marengo	8	97
4588	Marion	marion	8	94
4589	Markle	markle	8	95
4590	Marshall	marshall	8	99
4591	Martinsville	martinsville	8	94
4592	Mauckport	mauckport	8	97
4593	Maxwell	maxwell	8	94
4594	McCordsville	mccordsville	8	94
4595	Medora	medora	8	97
4596	Mentone	mentone	8	93
4597	Merrillville	merrillville	8	101
4598	Mexico	mexico	8	94
4599	Miami	miami	8	94
4600	Michigan City	michigan-city	8	101
4601	Michigantown	michigantown	8	94
4602	Middlebury	middlebury	8	93
4603	Middletown	middletown	8	94
4604	Milan	milan	8	96
4605	Milford	milford	8	93
4606	Millersburg	millersburg	8	93
4607	Milroy	milroy	8	94
4608	Mishawaka	mishawaka	8	93
4609	Mitchell	mitchell	8	94
4610	Monon	monon	8	94
4611	Monroe	monroe	8	95
4612	Monterey	monterey	8	93
4613	Montezuma	montezuma	8	99
4614	Montgomery	montgomery	8	99
4615	Monticello	monticello	8	94
4616	Montpelier	montpelier	8	94
4617	Mooresville	mooresville	8	94
4618	Morgantown	morgantown	8	94
4619	Morocco	morocco	8	101
4620	Morristown	morristown	8	94
4621	Mount Summit	mount-summit	8	94
4622	Mount Vernon	mount-vernon	8	100
4623	Mulberry	mulberry	8	94
4624	Muncie	muncie	8	94
4625	Munster	munster	8	101
4626	Nappanee	nappanee	8	93
4627	Nashville	nashville	8	94
4628	New Albany	new-albany	8	97
4629	New Carlisle	new-carlisle	8	93
4630	New Castle	new-castle	8	94
4631	New Goshen	new-goshen	8	99
4632	New Harmony	new-harmony	8	100
4633	New Haven	new-haven	8	95
4634	New Lisbon	new-lisbon	8	94
4635	New Market	new-market	8	94
4636	New Palestine	new-palestine	8	94
4637	New Paris	new-paris	8	93
4638	New Richmond	new-richmond	8	94
4639	New Washington	new-washington	8	97
4640	Newburgh	newburgh	8	100
4641	Newport	newport	8	99
4642	Noblesville	noblesville	8	94
4643	North Judson	north-judson	8	93
4644	North Manchester	north-manchester	8	95
4645	North Vernon	north-vernon	8	97
4646	Notre Dame	notre-dame	8	93
4647	Oakland City	oakland-city	8	100
4648	Oaktown	oaktown	8	99
4649	Orestes	orestes	8	94
4650	Orleans	orleans	8	97
4651	Osceola	osceola	8	93
4652	Osgood	osgood	8	96
4653	Ossian	ossian	8	95
4654	Otterbein	otterbein	8	98
4655	Oxford	oxford	8	98
4656	Palmyra	palmyra	8	97
4657	Paoli	paoli	8	97
4658	Parker City	parker-city	8	94
4659	Patriot	patriot	8	96
4660	New Pekin	new-pekin	8	97
4661	Pendleton	pendleton	8	94
4662	Pershing	pershing	8	93
4663	Peru	peru	8	94
4664	Petersburg	petersburg	8	100
4665	Pierceton	pierceton	8	93
4666	Pine Village	pine-village	8	102
4667	Pittsboro	pittsboro	8	94
4668	Plainfield	plainfield	8	94
4669	Plymouth	plymouth	8	93
4670	Poneto	poneto	8	95
4671	Portage	portage	8	101
4672	Portland	portland	8	95
4673	Poseyville	poseyville	8	100
4674	Princeton	princeton	8	100
4675	Ramsey	ramsey	8	97
4676	Remington	remington	8	101
4677	Rensselaer	rensselaer	8	101
4678	Reynolds	reynolds	8	94
4679	Richmond	richmond	8	94
4680	Ridgeville	ridgeville	8	94
4681	Rising Sun	rising-sun	8	96
4682	Roachdale	roachdale	8	94
4683	Roanoke	roanoke	8	95
4684	Rochester	rochester	8	93
4685	Rockport	rockport	8	100
4686	Rockville	rockville	8	99
4687	Rossville	rossville	8	94
4688	Royal Center	royal-center	8	94
4689	Rushville	rushville	8	94
4690	Russiaville	russiaville	8	94
4691	Salem	salem	8	97
4692	San Pierre	san-pierre	8	93
4693	Sandborn	sandborn	8	99
4694	Santa Claus	santa-claus	8	100
4695	Schererville	schererville	8	101
4696	Scottsburg	scottsburg	8	97
4697	Sellersburg	sellersburg	8	97
4698	Selma	selma	8	94
4699	Seymour	seymour	8	97
4700	Sharpsville	sharpsville	8	94
4701	Shelby	shelby	8	101
4702	Shelbyville	shelbyville	8	94
4703	Sheridan	sheridan	8	94
4704	Shipshewana	shipshewana	8	93
4705	Shirley	shirley	8	94
4706	Shoals	shoals	8	99
4707	Smithville	smithville	8	94
4708	South Bend	south-bend	8	93
4709	South Milford	south-milford	8	93
4710	South Whitley	south-whitley	8	95
4711	Spencer	spencer	8	94
4712	Spiceland	spiceland	8	94
4713	Springport	springport	8	94
4714	Spurgeon	spurgeon	8	100
4715	Saint Joe	saint-joe	8	95
4716	Saint John	saint-john	8	101
4717	Saint Mary-of-the-Woods	saint-mary-of-the-woods	8	99
4718	Saint Meinrad	saint-meinrad	8	100
4719	Stanford	stanford	8	94
4720	Star City	star-city	8	93
4721	Stockwell	stockwell	8	98
4722	Straughn	straughn	8	94
4723	Sullivan	sullivan	8	99
4724	Sunman	sunman	8	96
4725	Sweetser	sweetser	8	94
4726	Switz City	switz-city	8	99
4727	Syracuse	syracuse	8	93
4728	Taylorsville	taylorsville	8	94
4729	Tell City	tell-city	8	100
4730	Terre Haute	terre-haute	8	99
4731	Thorntown	thorntown	8	94
4732	Tippecanoe	tippecanoe	8	93
4733	Tipton	tipton	8	94
4734	Topeka	topeka	8	93
4735	Trafalgar	trafalgar	8	94
4736	Troy	troy	8	100
4737	Union City	union-city	8	94
4738	Union Mills	union-mills	8	101
4739	Unionville	unionville	8	94
4740	Upland	upland	8	94
4741	Vallonia	vallonia	8	97
4742	Valparaiso	valparaiso	8	101
4743	Van Buren	van-buren	8	94
4744	Veedersburg	veedersburg	8	94
4745	Vernon	vernon	8	97
4746	Versailles	versailles	8	96
4747	Vevay	vevay	8	96
4748	Vincennes	vincennes	8	99
4749	Wabash	wabash	8	95
4750	Wakarusa	wakarusa	8	93
4751	Waldron	waldron	8	94
4752	Walkerton	walkerton	8	93
4753	Walton	walton	8	94
4754	Wanatah	wanatah	8	101
4755	Warren	warren	8	95
4756	Warsaw	warsaw	8	93
4757	Washington	washington	8	99
4758	Waterloo	waterloo	8	95
4759	Waveland	waveland	8	94
4760	Wawaka	wawaka	8	95
4761	West Baden Springs	west-baden-springs	8	97
4762	West Harrison	west-harrison	8	96
4763	West Lafayette	west-lafayette	8	98
4764	West Lebanon	west-lebanon	8	102
4765	Westfield	westfield	8	94
4766	West Point	west-point	8	98
4767	Westville	westville	8	101
4768	Wheatfield	wheatfield	8	101
4769	Wheatland	wheatland	8	99
4770	Whiteland	whiteland	8	94
4771	Whitestown	whitestown	8	94
4772	Whiting	whiting	8	101
4773	Williamsport	williamsport	8	102
4774	Winamac	winamac	8	93
4775	Winchester	winchester	8	94
4776	Winona Lake	winona-lake	8	93
4777	Wolcott	wolcott	8	94
4778	Woodburn	woodburn	8	95
4779	Worthington	worthington	8	99
4780	Wyatt	wyatt	8	93
4781	Yeoman	yeoman	8	94
4782	Yorktown	yorktown	8	94
4783	Zionsville	zionsville	8	94
4784	Burns Harbor	burns-harbor	8	101
4785	Coatesville	coatesville	8	94
4786	Georgetown	georgetown	8	97
4787	Huntertown	huntertown	8	95
4788	Lawrence	lawrence	8	94
4789	Monrovia	monrovia	8	94
4790	Roselawn	roselawn	8	101
4791	Speedway	speedway	8	94
4792	Abilene	abilene	49	103
4793	Allen	allen	49	104
4794	Alma	alma	49	104
4795	Almena	almena	49	103
4796	Altamont	altamont	49	105
4797	Americus	americus	49	104
4798	Andover	andover	49	103
4799	Anthony	anthony	49	103
4800	Argonia	argonia	49	103
4801	Arkansas City	arkansas-city	49	103
4802	Ashland	ashland	49	103
4803	Assaria	assaria	49	103
4804	Atchison	atchison	49	106
4805	Atwood	atwood	49	103
4806	Augusta	augusta	49	103
4807	Axtell	axtell	49	104
4808	Baileyville	baileyville	49	104
4809	Baldwin City	baldwin-city	49	106
4810	Barnes	barnes	49	104
4811	Basehor	basehor	49	106
4812	Baxter Springs	baxter-springs	49	105
4813	Belle Plaine	belle-plaine	49	103
4814	Belleville	belleville	49	107
4815	Beloit	beloit	49	103
4816	Bennington	bennington	49	103
4817	Bern	bern	49	104
4818	Bird City	bird-city	49	103
4819	Blue Rapids	blue-rapids	49	104
4820	Bonner Springs	bonner-springs	49	106
4821	Brewster	brewster	49	103
4822	Bucklin	bucklin	49	103
4823	Bucyrus	bucyrus	49	106
4824	Buhler	buhler	49	103
4825	Burden	burden	49	103
4826	Burlington	burlington	49	104
4827	Burrton	burrton	49	103
4828	Caldwell	caldwell	49	103
4829	Canton	canton	49	103
4830	Carbondale	carbondale	49	104
4831	Cawker City	cawker-city	49	103
4832	Cedar Vale	cedar-vale	49	108
4833	Centralia	centralia	49	104
4834	Chanute	chanute	49	105
4835	Chase	chase	49	103
4836	Cheney	cheney	49	103
4837	Cherryvale	cherryvale	49	108
4838	Chetopa	chetopa	49	105
4839	Cimarron	cimarron	49	103
4840	Claflin	claflin	49	103
4841	Clay Center	clay-center	49	104
4842	Clearwater	clearwater	49	103
4843	Clifton	clifton	49	104
4844	Coffeyville	coffeyville	49	108
4845	Colby	colby	49	103
4846	Coldwater	coldwater	49	103
4847	Colony	colony	49	106
4848	Columbus	columbus	49	105
4849	Colwich	colwich	49	103
4850	Concordia	concordia	49	104
4851	Corning	corning	49	104
4852	Cottonwood Falls	cottonwood-falls	49	103
4853	Council Grove	council-grove	49	104
4854	Cummings	cummings	49	106
4855	Cunningham	cunningham	49	103
4856	De Soto	de-soto	49	106
4857	Deerfield	deerfield	49	103
4858	Denton	denton	49	109
4859	Derby	derby	49	103
4860	Dighton	dighton	49	103
4861	Dodge City	dodge-city	49	103
4862	Downs	downs	49	103
4863	Edwardsville	edwardsville	49	106
4864	Effingham	effingham	49	106
4865	El Dorado	el-dorado	49	103
4866	Elbing	elbing	49	103
4867	Elk City	elk-city	49	108
4868	Elkhart	elkhart	49	103
4869	Ellis	ellis	49	103
4870	Ellsworth	ellsworth	49	103
4871	Elwood	elwood	49	109
4872	Emporia	emporia	49	104
4873	Enterprise	enterprise	49	103
4874	Eskridge	eskridge	49	104
4875	Eudora	eudora	49	106
4876	Eureka	eureka	49	103
4877	Everest	everest	49	104
4878	Frankfort	frankfort	49	104
4879	Franklin	franklin	49	105
4880	Fredonia	fredonia	49	105
4881	Frontenac	frontenac	49	105
4882	Fort Leavenworth	fort-leavenworth	49	106
4883	Fort Riley	fort-riley	49	104
4884	Fort Scott	fort-scott	49	105
4885	Galena	galena	49	105
4886	Galva	galva	49	103
4887	Garden City	garden-city	49	103
4888	Gardner	gardner	49	106
4889	Garnett	garnett	49	106
4890	Gas	gas	49	105
4891	Girard	girard	49	105
4892	Goddard	goddard	49	103
4893	Goodland	goodland	49	103
4894	Gorham	gorham	49	103
4895	Gove City	gove-city	49	103
4896	Great Bend	great-bend	49	103
4897	Greensburg	greensburg	49	103
4898	Grinnell	grinnell	49	103
4899	Gypsum	gypsum	49	103
4900	Hamilton	hamilton	49	103
4901	Hanover	hanover	49	104
4902	Harper	harper	49	103
4903	Haven	haven	49	103
4904	Haviland	haviland	49	103
4905	Hays	hays	49	103
4906	Haysville	haysville	49	103
4907	Herington	herington	49	103
4908	Herndon	herndon	49	103
4909	Hesston	hesston	49	103
4910	Hiawatha	hiawatha	49	104
4911	Highland	highland	49	109
4912	Hill City	hill-city	49	103
4913	Hillsboro	hillsboro	49	103
4914	Holton	holton	49	104
4915	Holyrood	holyrood	49	103
4916	Home	home	49	104
4917	Hope	hope	49	103
4918	Horton	horton	49	104
4919	Howard	howard	49	103
4920	Hoxie	hoxie	49	103
4921	Hugoton	hugoton	49	103
4922	Humboldt	humboldt	49	105
4923	Hutchinson	hutchinson	49	103
4924	Independence	independence	49	108
4925	Inman	inman	49	103
4926	Iola	iola	49	105
4927	Jennings	jennings	49	103
4928	Jetmore	jetmore	49	103
4929	Johnson City	johnson-city	49	103
4930	Junction City	junction-city	49	104
4931	Kanopolis	kanopolis	49	103
4932	Kansas City	kansas-city	49	106
4933	Kensington	kensington	49	107
4934	Kingman	kingman	49	103
4935	Kinsley	kinsley	49	103
4936	Kiowa	kiowa	49	103
4937	La Crosse	la-crosse	49	103
4938	LaCygne	lacygne	49	106
4939	Lakin	lakin	49	103
4940	Lansing	lansing	49	106
4941	Larned	larned	49	103
4942	Lawrence	lawrence	49	106
4943	Leavenworth	leavenworth	49	106
4944	Leawood	leawood	49	106
4945	Lebanon	lebanon	49	107
4946	Lecompton	lecompton	49	106
4947	Lenexa	lenexa	49	106
4948	Lenora	lenora	49	103
4949	Leoti	leoti	49	103
4950	Liberal	liberal	49	103
4951	Lincoln	lincoln	49	103
4952	Lindsborg	lindsborg	49	103
4953	Linn	linn	49	104
4954	Linwood	linwood	49	106
4955	Little River	little-river	49	103
4956	Logan	logan	49	107
4957	Louisburg	louisburg	49	106
4958	Lyndon	lyndon	49	104
4959	Lyons	lyons	49	103
4960	Madison	madison	49	103
4961	Maize	maize	49	103
4962	Manhattan	manhattan	49	104
4963	Mankato	mankato	49	103
4964	Maple Hill	maple-hill	49	104
4965	Marion	marion	49	103
4966	Marysville	marysville	49	104
4967	Mayetta	mayetta	49	104
4968	McLouth	mclouth	49	104
4969	McConnell Air Force Base	mcconnell-air-force-base	49	103
4970	McPherson	mcpherson	49	103
4971	Meade	meade	49	103
4972	Medicine Lodge	medicine-lodge	49	103
4973	Meriden	meriden	49	104
4974	Minneapolis	minneapolis	49	103
4975	Minneola	minneola	49	103
4976	Mission	mission	49	106
4977	Montezuma	montezuma	49	103
4978	Moscow	moscow	49	103
4979	Mound City	mound-city	49	106
4980	Mound Valley	mound-valley	49	105
4981	Moundridge	moundridge	49	103
4982	Mulvane	mulvane	49	103
4983	Natoma	natoma	49	103
4984	Neodesha	neodesha	49	105
4985	Ness City	ness-city	49	103
4986	New Century	new-century	49	106
4987	Newton	newton	49	103
4988	North Newton	north-newton	49	103
4989	Norton	norton	49	103
4990	Oakley	oakley	49	103
4991	Oberlin	oberlin	49	103
4992	Ogden	ogden	49	104
4993	Olathe	olathe	49	106
4994	Osage City	osage-city	49	104
4995	Osawatomie	osawatomie	49	106
4996	Osborne	osborne	49	103
4997	Oskaloosa	oskaloosa	49	104
4998	Oswego	oswego	49	105
4999	Ottawa	ottawa	49	106
5000	Overbrook	overbrook	49	104
5001	Overland Park	overland-park	49	106
5002	Oxford	oxford	49	103
5003	Palco	palco	49	103
5004	Paola	paola	49	106
5005	Parsons	parsons	49	105
5006	Partridge	partridge	49	103
5007	Peabody	peabody	49	103
5008	Perry	perry	49	104
5009	Phillipsburg	phillipsburg	49	107
5010	Piqua	piqua	49	105
5011	Pittsburg	pittsburg	49	105
5012	Plainville	plainville	49	103
5013	Pomona	pomona	49	106
5014	Pratt	pratt	49	103
5015	Pretty Prairie	pretty-prairie	49	103
5016	Protection	protection	49	103
5017	Quinter	quinter	49	103
5018	Randolph	randolph	49	104
5019	Ransom	ransom	49	103
5020	Rantoul	rantoul	49	106
5021	Rexford	rexford	49	103
5022	Richmond	richmond	49	106
5023	Riley	riley	49	104
5024	Riverton	riverton	49	105
5025	Rossville	rossville	49	104
5026	Russell	russell	49	103
5027	Sabetha	sabetha	49	104
5028	Salina	salina	49	103
5029	Scammon	scammon	49	105
5030	Scott City	scott-city	49	103
5031	Sedan	sedan	49	108
5032	Sedgwick	sedgwick	49	103
5033	Selden	selden	49	103
5034	Seneca	seneca	49	104
5035	Sharon Springs	sharon-springs	49	103
5036	Shawnee	shawnee	49	106
5037	Silver Lake	silver-lake	49	104
5038	Smith Center	smith-center	49	107
5039	Solomon	solomon	49	103
5040	South Hutchinson	south-hutchinson	49	103
5041	Spearville	spearville	49	103
5042	Spring Hill	spring-hill	49	106
5043	Saint Francis	saint-francis	49	103
5044	Saint John	saint-john	49	103
5045	Saint Marys	saint-marys	49	104
5046	Saint Paul	saint-paul	49	105
5047	Stafford	stafford	49	103
5048	Sterling	sterling	49	103
5049	Stilwell	stilwell	49	106
5050	Stockton	stockton	49	103
5051	Strong City	strong-city	49	103
5052	Sublette	sublette	49	103
5053	Summerfield	summerfield	49	104
5054	Sylvan Grove	sylvan-grove	49	103
5055	Syracuse	syracuse	49	103
5056	Tonganoxie	tonganoxie	49	106
5057	Topeka	topeka	49	104
5058	Towanda	towanda	49	103
5059	Tribune	tribune	49	103
5060	Troy	troy	49	109
5061	Turon	turon	49	103
5062	Udall	udall	49	103
5063	Ulysses	ulysses	49	103
5064	Valley Center	valley-center	49	103
5065	Valley Falls	valley-falls	49	104
5066	Victoria	victoria	49	103
5067	WaKeeney	wakeeney	49	103
5068	Wamego	wamego	49	104
5069	Washington	washington	49	104
5070	Waterville	waterville	49	104
5071	Wathena	wathena	49	109
5072	Wellington	wellington	49	103
5073	Wellsville	wellsville	49	106
5074	Weskan	weskan	49	103
5075	Westmoreland	westmoreland	49	104
5076	Whitewater	whitewater	49	103
5077	Wichita	wichita	49	103
5078	Wilson	wilson	49	103
5079	Winchester	winchester	49	104
5080	Winfield	winfield	49	103
5081	Winona	winona	49	103
5082	Yates Center	yates-center	49	105
5083	Erie	erie	49	105
5084	Andale	andale	49	103
5085	Bel Aire	bel-aire	49	103
5086	Merriam	merriam	49	106
5087	Park City	park-city	49	103
5088	Pleasanton	pleasanton	49	106
5089	Prairie Village	prairie-village	49	106
5090	Roeland Park	roeland-park	49	106
5091	Rose Hill	rose-hill	49	103
5092	Ages Brookside	ages-brookside	20	110
5093	Albany	albany	20	111
5094	Alexandria	alexandria	20	112
5095	Almo	almo	20	113
5096	Annville	annville	20	114
5097	Ashland	ashland	20	115
5098	Auburn	auburn	20	111
5099	Augusta	augusta	20	112
5100	Barbourville	barbourville	20	114
5101	Bardstown	bardstown	20	116
5102	Bardwell	bardwell	20	113
5103	Barlow	barlow	20	113
5104	Beattyville	beattyville	20	114
5105	Beauty	beauty	20	115
5106	Beaver	beaver	20	115
5107	Beaver Dam	beaver-dam	20	117
5108	Bedford	bedford	20	116
5109	Bellevue	bellevue	20	112
5110	Benton	benton	20	113
5111	Berea	berea	20	114
5112	Beverly	beverly	20	110
5113	Booneville	booneville	20	114
5114	Boons Camp	boons-camp	20	115
5115	Bowling Green	bowling-green	20	118
5116	Brandenburg	brandenburg	20	116
5117	Brooksville	brooksville	20	112
5118	Brownsville	brownsville	20	118
5119	Bryantsville	bryantsville	20	114
5120	Buckner	buckner	20	116
5121	Burgin	burgin	20	114
5122	Burkesville	burkesville	20	111
5123	Burlington	burlington	20	112
5124	Bush	bush	20	114
5125	Butler	butler	20	112
5126	Cadiz	cadiz	20	111
5127	Calhoun	calhoun	20	117
5128	Calvert City	calvert-city	20	113
5129	Campbellsburg	campbellsburg	20	116
5130	Campbellsville	campbellsville	20	116
5131	Campton	campton	20	114
5132	Canada	canada	20	115
5133	Canmer	canmer	20	118
5134	Carlisle	carlisle	20	114
5135	Carrollton	carrollton	20	116
5136	Cave City	cave-city	20	118
5137	Central City	central-city	20	117
5138	Clay City	clay-city	20	114
5139	Clinton	clinton	20	113
5140	Cloverport	cloverport	20	116
5141	Columbia	columbia	20	116
5142	Combs	combs	20	114
5143	Confluence	confluence	20	119
5144	Corbin	corbin	20	114
5145	Cornettsville	cornettsville	20	114
5146	Covington	covington	20	112
5147	Coxs Creek	coxs-creek	20	116
5148	Cranks	cranks	20	110
5149	Crestwood	crestwood	20	116
5150	Cumberland	cumberland	20	110
5151	Cynthiana	cynthiana	20	114
5152	Danville	danville	20	114
5153	Dawson Springs	dawson-springs	20	117
5154	Dayton	dayton	20	112
5155	Dixon	dixon	20	117
5156	Dunnville	dunnville	20	114
5157	Dwarf	dwarf	20	114
5158	East Bernstadt	east-bernstadt	20	114
5159	Eddyville	eddyville	20	113
5160	Edmonton	edmonton	20	118
5161	Elizabethtown	elizabethtown	20	116
5162	Elkton	elkton	20	111
5163	Eminence	eminence	20	116
5164	Erlanger	erlanger	20	112
5165	Evarts	evarts	20	110
5166	Fall Rock	fall-rock	20	114
5167	Falmouth	falmouth	20	112
5168	Fancy Farm	fancy-farm	20	113
5169	Ferguson	ferguson	20	114
5170	Flat Lick	flat-lick	20	114
5171	Flemingsburg	flemingsburg	20	114
5172	Florence	florence	20	112
5173	Ford	ford	20	114
5174	Fountain Run	fountain-run	20	111
5175	Frankfort	frankfort	20	114
5176	Franklin	franklin	20	111
5177	Frenchburg	frenchburg	20	114
5178	Fort Campbell	fort-campbell	20	111
5179	Fort Knox	fort-knox	20	116
5180	Fort Mitchell	fort-mitchell	20	112
5181	Fort Thomas	fort-thomas	20	112
5182	Fulton	fulton	20	113
5183	Garfield	garfield	20	116
5184	Georgetown	georgetown	20	114
5185	Ghent	ghent	20	116
5186	Glasgow	glasgow	20	118
5187	Glencoe	glencoe	20	112
5188	Goshen	goshen	20	116
5189	Gracey	gracey	20	111
5190	Grayson	grayson	20	115
5191	Greensburg	greensburg	20	116
5192	Greenup	greenup	20	115
5193	Greenville	greenville	20	117
5194	Guthrie	guthrie	20	111
5195	Hardinsburg	hardinsburg	20	116
5196	Harlan	harlan	20	110
5197	Harold	harold	20	115
5198	Harrodsburg	harrodsburg	20	114
5199	Hartford	hartford	20	117
5200	Hawesville	hawesville	20	117
5201	Hazard	hazard	20	114
5202	Hebron	hebron	20	112
5203	Henderson	henderson	20	117
5204	Hickman	hickman	20	113
5205	Hindman	hindman	20	114
5206	Hodgenville	hodgenville	20	116
5207	Hopkinsville	hopkinsville	20	111
5208	Horse Branch	horse-branch	20	117
5209	Hoskinston	hoskinston	20	119
5210	Hyden	hyden	20	119
5211	Independence	independence	20	112
5212	Inez	inez	20	115
5213	Irvine	irvine	20	114
5214	Ivel	ivel	20	115
5215	Jackhorn	jackhorn	20	119
5216	Jackson	jackson	20	114
5217	Jamestown	jamestown	20	114
5218	Jenkins	jenkins	20	119
5219	Keavy	keavy	20	114
5220	La Center	la-center	20	113
5221	La Fayette	la-fayette	20	111
5222	La Grange	la-grange	20	116
5223	Lancaster	lancaster	20	114
5224	Lawrenceburg	lawrenceburg	20	114
5225	Lebanon	lebanon	20	116
5226	Leitchfield	leitchfield	20	116
5227	Lewisport	lewisport	20	117
5228	Lexington	lexington	20	114
5229	Liberty	liberty	20	114
5230	Lloyd	lloyd	20	115
5231	London	london	20	114
5232	Lookout	lookout	20	115
5233	Lost Creek	lost-creek	20	114
5234	Louisa	louisa	20	115
5235	Louisville	louisville	20	116
5236	Lovelaceville	lovelaceville	20	113
5237	Lovely	lovely	20	115
5238	Madisonville	madisonville	20	117
5239	Manchester	manchester	20	114
5240	Marion	marion	20	113
5241	Mayfield	mayfield	20	113
5242	Maysville	maysville	20	112
5243	McKee	mckee	20	114
5244	Melvin	melvin	20	115
5245	Middlesboro	middlesboro	20	110
5246	Midway	midway	20	114
5247	Millersburg	millersburg	20	114
5248	Monticello	monticello	20	114
5249	Morehead	morehead	20	114
5250	Morganfield	morganfield	20	117
5251	Morgantown	morgantown	20	118
5252	Mount Olivet	mount-olivet	20	114
5253	Mount Sterling	mount-sterling	20	114
5254	Mount Vernon	mount-vernon	20	114
5255	Mount Washington	mount-washington	20	116
5256	Mousie	mousie	20	114
5257	Munfordville	munfordville	20	118
5258	Murray	murray	20	113
5259	Nerinx	nerinx	20	116
5260	New Castle	new-castle	20	116
5261	Newport	newport	20	112
5262	Nicholasville	nicholasville	20	114
5263	Oak Grove	oak-grove	20	111
5264	Oakland	oakland	20	118
5265	Olive Hill	olive-hill	20	115
5266	Owensboro	owensboro	20	117
5267	Owenton	owenton	20	112
5268	Owingsville	owingsville	20	114
5269	Paducah	paducah	20	113
5270	Paintsville	paintsville	20	115
5271	Paris	paris	20	114
5272	Pembroke	pembroke	20	111
5273	Pewee Valley	pewee-valley	20	116
5274	Pikeville	pikeville	20	115
5275	Pineville	pineville	20	110
5276	Pinsonfork	pinsonfork	20	115
5277	Pleasureville	pleasureville	20	116
5278	Prestonsburg	prestonsburg	20	115
5279	Princeton	princeton	20	113
5280	Prospect	prospect	20	116
5281	Providence	providence	20	117
5282	Raccoon	raccoon	20	115
5283	Radcliff	radcliff	20	116
5284	Richmond	richmond	20	114
5285	Russell	russell	20	115
5286	Russell Springs	russell-springs	20	114
5287	Russellville	russellville	20	111
5288	Salem	salem	20	113
5289	Salt Lick	salt-lick	20	114
5290	Salvisa	salvisa	20	114
5291	Salyersville	salyersville	20	114
5292	Sandy Hook	sandy-hook	20	115
5293	Science Hill	science-hill	20	114
5294	Scottsville	scottsville	20	111
5295	Sedalia	sedalia	20	113
5296	Shelbyville	shelbyville	20	116
5297	Shepherdsville	shepherdsville	20	116
5298	Silver Grove	silver-grove	20	112
5299	Smithland	smithland	20	113
5300	Somerset	somerset	20	114
5301	Springfield	springfield	20	116
5302	Stamping Ground	stamping-ground	20	114
5303	Stanford	stanford	20	114
5304	Stanton	stanton	20	114
5305	Stearns	stearns	20	110
5306	Sturgis	sturgis	20	117
5307	Summer Shade	summer-shade	20	118
5308	Summit	summit	20	116
5309	Taylorsville	taylorsville	20	116
5310	Tompkinsville	tompkinsville	20	111
5311	Topmost	topmost	20	114
5312	Ulysses	ulysses	20	115
5313	Upton	upton	20	116
5314	Vanceburg	vanceburg	20	115
5315	Versailles	versailles	20	114
5316	Vicco	vicco	20	114
5317	Viper	viper	20	114
5318	Walton	walton	20	112
5319	Warsaw	warsaw	20	112
5320	Wellington	wellington	20	114
5321	West Liberty	west-liberty	20	114
5322	West Point	west-point	20	116
5323	Westport	westport	20	116
5324	Whitesburg	whitesburg	20	119
5325	Wickliffe	wickliffe	20	113
5326	Williamsburg	williamsburg	20	114
5327	Williamstown	williamstown	20	112
5328	Wilmore	wilmore	20	114
5329	Winchester	winchester	20	114
5330	Cold Spring	cold-spring	20	112
5331	Dry Ridge	dry-ridge	20	112
5332	Edgewood	edgewood	20	112
5333	Fort Wright	fort-wright	20	112
5334	Highland Heights	highland-heights	20	112
5335	Jeffersontown	jeffersontown	20	116
5336	Lyndon	lyndon	20	116
5337	Middletown	middletown	20	116
5338	Saint Matthews	saint-matthews	20	116
5339	Taylor Mill	taylor-mill	20	112
5340	Union	union	20	112
5341	Villa Hills	villa-hills	20	112
5342	Whitley City	whitley-city	20	110
5343	Abbeville	abbeville	43	120
5344	Addis	addis	43	121
5345	Alexandria	alexandria	43	122
5346	Ama	ama	43	123
5347	Amelia	amelia	43	121
5348	Amite City	amite-city	43	123
5349	Arabi	arabi	43	123
5350	Arcadia	arcadia	43	124
5351	Arnaudville	arnaudville	43	120
5352	Baker	baker	43	121
5353	Ball	ball	43	122
5354	Barksdale Air Force Base	barksdale-air-force-base	43	124
5355	Bastrop	bastrop	43	125
5356	Baton Rouge	baton-rouge	43	121
5357	Belle Chasse	belle-chasse	43	123
5358	Benton	benton	43	124
5359	Blanchard	blanchard	43	124
5360	Bogalusa	bogalusa	43	123
5361	Bossier City	bossier-city	43	124
5362	Boutte	boutte	43	123
5363	Breaux Bridge	breaux-bridge	43	120
5364	Broussard	broussard	43	120
5365	Bunkie	bunkie	43	122
5366	Buras-Triumph	buras-triumph	43	123
5367	Cade	cade	43	120
5368	Calhoun	calhoun	43	125
5369	Cameron	cameron	43	126
5370	Carencro	carencro	43	120
5371	Centerville	centerville	43	121
5372	Chalmette	chalmette	43	123
5373	Chataignier	chataignier	43	120
5374	Chauvin	chauvin	43	123
5375	Clinton	clinton	43	121
5376	Colfax	colfax	43	122
5377	Collinston	collinston	43	125
5378	Columbia	columbia	43	125
5379	Convent	convent	43	123
5380	Coushatta	coushatta	43	124
5381	Covington	covington	43	123
5382	Crowley	crowley	43	120
5383	Cut Off	cut-off	43	123
5384	Delcambre	delcambre	43	120
5385	Denham Springs	denham-springs	43	121
5386	DeRidder	deridder	43	126
5387	Destrehan	destrehan	43	123
5388	Donaldsonville	donaldsonville	43	121
5389	Downsville	downsville	43	125
5390	Duson	duson	43	120
5391	Elm Grove	elm-grove	43	124
5392	Empire	empire	43	123
5393	Enterprise	enterprise	43	125
5394	Eunice	eunice	43	120
5395	Evangeline	evangeline	43	120
5396	Farmerville	farmerville	43	125
5397	Ferriday	ferriday	43	125
5398	Folsom	folsom	43	123
5399	Franklin	franklin	43	121
5400	Franklinton	franklinton	43	123
5401	Galliano	galliano	43	123
5402	Geismar	geismar	43	121
5403	Golden Meadow	golden-meadow	43	123
5404	Gonzales	gonzales	43	121
5405	Grambling	grambling	43	125
5406	Grand Coteau	grand-coteau	43	120
5407	Grayson	grayson	43	125
5408	Greensburg	greensburg	43	121
5409	Greenwood	greenwood	43	124
5410	Gretna	gretna	43	123
5411	Hahnville	hahnville	43	123
5412	Hammond	hammond	43	123
5413	Harrisonburg	harrisonburg	43	125
5414	Harvey	harvey	43	123
5415	Haughton	haughton	43	124
5416	Holden	holden	43	121
5417	Homer	homer	43	124
5418	Houma	houma	43	123
5419	Independence	independence	43	123
5420	Iota	iota	43	120
5421	Jackson	jackson	43	121
5422	Jena	jena	43	125
5423	Jennings	jennings	43	120
5424	Jonesboro	jonesboro	43	125
5425	Jonesville	jonesville	43	125
5426	Kaplan	kaplan	43	120
5427	Keithville	keithville	43	124
5428	Kenner	kenner	43	123
5429	Killona	killona	43	123
5430	Kinder	kinder	43	126
5431	LaPlace	laplace	43	123
5432	Lafayette	lafayette	43	120
5433	Lake Charles	lake-charles	43	126
5434	Lake Providence	lake-providence	43	125
5435	Larose	larose	43	123
5436	Leesville	leesville	43	122
5437	Lillie	lillie	43	125
5438	Livingston	livingston	43	121
5439	Lockport	lockport	43	123
5440	Logansport	logansport	43	124
5441	Luling	luling	43	123
5442	Lutcher	lutcher	43	123
5443	Mandeville	mandeville	43	123
5444	Mansfield	mansfield	43	124
5445	Many	many	43	124
5446	Maringouin	maringouin	43	121
5447	Marksville	marksville	43	122
5448	Marrero	marrero	43	123
5449	Mathews	mathews	43	123
5450	Metairie	metairie	43	123
5451	Minden	minden	43	124
5452	Monroe	monroe	43	125
5453	Morgan City	morgan-city	43	121
5454	Napoleonville	napoleonville	43	121
5455	Natchitoches	natchitoches	43	124
5456	Negreet	negreet	43	124
5457	New Iberia	new-iberia	43	120
5458	New Orleans	new-orleans	43	123
5459	New Roads	new-roads	43	121
5460	Norco	norco	43	123
5461	Oak Grove	oak-grove	43	125
5462	Oakdale	oakdale	43	126
5463	Oberlin	oberlin	43	126
5464	Opelousas	opelousas	43	120
5465	Pearl River	pearl-river	43	123
5466	Pineville	pineville	43	122
5467	Plain Dealing	plain-dealing	43	124
5468	Plaquemine	plaquemine	43	121
5469	Plattenville	plattenville	43	121
5470	Port Allen	port-allen	43	121
5471	Prairieville	prairieville	43	121
5472	Raceland	raceland	43	123
5473	Rayne	rayne	43	120
5474	Rayville	rayville	43	125
5475	Reserve	reserve	43	123
5476	Robert	robert	43	123
5477	Ruston	ruston	43	125
5478	Scott	scott	43	120
5479	Shreveport	shreveport	43	124
5480	Sicily Island	sicily-island	43	125
5481	Slaughter	slaughter	43	121
5482	Slidell	slidell	43	123
5483	Sorrento	sorrento	43	121
5484	Springhill	springhill	43	124
5485	Saint Bernard	saint-bernard	43	123
5486	Saint Joseph	saint-joseph	43	125
5487	Saint Martinville	saint-martinville	43	120
5488	Saint Rose	saint-rose	43	123
5489	Sulphur	sulphur	43	126
5490	Summerfield	summerfield	43	124
5491	Sunset	sunset	43	120
5492	Sunshine	sunshine	43	121
5493	Tallulah	tallulah	43	125
5494	Thibodaux	thibodaux	43	123
5495	Trout	trout	43	125
5496	Vacherie	vacherie	43	123
5497	Vidalia	vidalia	43	125
5498	Ville Platte	ville-platte	43	120
5499	Vivian	vivian	43	124
5500	Walker	walker	43	121
5501	Waterproof	waterproof	43	125
5502	Welsh	welsh	43	120
5503	West Monroe	west-monroe	43	125
5504	Westlake	westlake	43	126
5505	Westwego	westwego	43	123
5506	Winnfield	winnfield	43	125
5507	Winnsboro	winnsboro	43	125
5508	Zachary	zachary	43	121
5509	Bayou Cane	bayou-cane	43	123
5510	Carlyss	carlyss	43	126
5511	Central	central	43	121
5512	Elmwood	elmwood	43	123
5513	Estelle	estelle	43	123
5514	Fort Polk South	fort-polk-south	43	122
5515	Harahan	harahan	43	123
5516	Inniswold	inniswold	43	121
5517	Jefferson	jefferson	43	123
5518	Lacombe	lacombe	43	123
5519	Livonia	livonia	43	121
5520	Madisonville	madisonville	43	123
5521	Moss Bluff	moss-bluff	43	126
5522	Old Jefferson	old-jefferson	43	121
5523	Patterson	patterson	43	121
5524	Pierre Part	pierre-part	43	121
5525	Ponchatoula	ponchatoula	43	123
5526	River Ridge	river-ridge	43	123
5527	Shenandoah	shenandoah	43	121
5528	Saint Francisville	saint-francisville	43	121
5529	Terrytown	terrytown	43	123
5530	Waggaman	waggaman	43	123
5531	Youngsville	youngsville	43	120
5532	Abington	abington	29	127
5533	Acton	acton	29	127
5534	Acushnet	acushnet	29	128
5535	Agawam	agawam	29	129
5536	Amesbury	amesbury	29	127
5537	Amherst	amherst	29	129
5538	Arlington	arlington	29	127
5539	Ashburnham	ashburnham	29	127
5540	Ashby	ashby	29	127
5541	Ashfield	ashfield	29	129
5542	Ashland	ashland	29	127
5543	Athol	athol	29	127
5544	Attleboro	attleboro	29	128
5545	Auburn	auburn	29	127
5546	Avon	avon	29	127
5547	Barnstable	barnstable	29	127
5548	Becket	becket	29	130
5549	Bedford	bedford	29	127
5550	Belmont	belmont	29	127
5551	Berlin	berlin	29	127
5552	Bernardston	bernardston	29	129
5553	Beverly	beverly	29	127
5554	Billerica	billerica	29	127
5555	Blackstone	blackstone	29	127
5556	Blandford	blandford	29	129
5557	Bolton	bolton	29	127
5558	Boston	boston	29	127
5559	Boxborough	boxborough	29	127
5560	Boylston	boylston	29	127
5561	Braintree	braintree	29	127
5562	Brimfield	brimfield	29	129
5563	Brockton	brockton	29	127
5564	Brookfield	brookfield	29	127
5565	Brookline	brookline	29	127
5566	Buckland	buckland	29	129
5567	Burlington	burlington	29	127
5568	Cambridge	cambridge	29	127
5569	Canton	canton	29	127
5570	Carlisle	carlisle	29	127
5571	Carver	carver	29	127
5572	Charlemont	charlemont	29	129
5573	Charlton	charlton	29	127
5574	Chelmsford	chelmsford	29	127
5575	Chelsea	chelsea	29	127
5576	Cheshire	cheshire	29	130
5577	Chester	chester	29	129
5578	Chesterfield	chesterfield	29	129
5579	Chicopee	chicopee	29	129
5580	Chilmark	chilmark	29	127
5581	Cohasset	cohasset	29	127
5582	Colrain	colrain	29	129
5583	Concord	concord	29	127
5584	Conway	conway	29	129
5585	Cummington	cummington	29	129
5586	Dalton	dalton	29	130
5587	Danvers	danvers	29	127
5588	Dartmouth	dartmouth	29	128
5589	Dedham	dedham	29	127
5590	Deerfield	deerfield	29	129
5591	Dighton	dighton	29	128
5592	Douglas	douglas	29	127
5593	Dracut	dracut	29	127
5594	Dudley	dudley	29	127
5595	Dunstable	dunstable	29	127
5596	East Bridgewater	east-bridgewater	29	127
5597	East Longmeadow	east-longmeadow	29	129
5598	Eastham	eastham	29	127
5599	Easthampton	easthampton	29	129
5600	Easton	easton	29	128
5601	Edgartown	edgartown	29	127
5602	Erving	erving	29	129
5603	Everett	everett	29	127
5604	Fairhaven	fairhaven	29	128
5605	Fall River	fall-river	29	128
5606	Falmouth	falmouth	29	127
5607	Fitchburg	fitchburg	29	127
5608	Framingham	framingham	29	127
5609	Franklin	franklin	29	127
5610	Gardner	gardner	29	127
5611	Georgetown	georgetown	29	127
5612	Gloucester	gloucester	29	127
5613	Goshen	goshen	29	129
5614	Grafton	grafton	29	127
5615	Granby	granby	29	129
5616	Granville	granville	29	129
5617	Great Barrington	great-barrington	29	130
5618	Greenfield	greenfield	29	129
5619	Groveland	groveland	29	127
5620	Hadley	hadley	29	129
5621	Halifax	halifax	29	127
5622	Hamilton	hamilton	29	127
5623	Hampden	hampden	29	129
5624	Hanover	hanover	29	127
5625	Hanscom Air Force Base	hanscom-air-force-base	29	127
5626	Hanson	hanson	29	127
5627	Hardwick	hardwick	29	127
5628	Harvard	harvard	29	127
5629	Harwich	harwich	29	127
5630	Haverhill	haverhill	29	127
5631	Heath	heath	29	129
5632	Hinsdale	hinsdale	29	130
5633	Holbrook	holbrook	29	127
5634	Holden	holden	29	127
5635	Holliston	holliston	29	127
5636	Holyoke	holyoke	29	129
5637	Hubbardston	hubbardston	29	127
5638	Hull	hull	29	127
5639	Huntington	huntington	29	129
5640	Ipswich	ipswich	29	127
5641	Lakeville	lakeville	29	127
5642	Lancaster	lancaster	29	127
5643	Lanesborough	lanesborough	29	130
5644	Lawrence	lawrence	29	127
5645	Leicester	leicester	29	127
5646	Leominster	leominster	29	127
5647	Leverett	leverett	29	129
5648	Lexington	lexington	29	127
5649	Lincoln	lincoln	29	127
5650	Littleton	littleton	29	127
5651	Longmeadow	longmeadow	29	129
5652	Lowell	lowell	29	127
5653	Ludlow	ludlow	29	129
5654	Lynn	lynn	29	127
5655	Lynnfield	lynnfield	29	127
5656	Malden	malden	29	127
5657	Manchester-by-the-Sea	manchester-by-the-sea	29	127
5658	Mansfield	mansfield	29	128
5659	Marblehead	marblehead	29	127
5660	Marion	marion	29	127
5661	Marlborough	marlborough	29	127
5662	Mashpee	mashpee	29	127
5663	Mattapoisett	mattapoisett	29	127
5664	Maynard	maynard	29	127
5665	Medford	medford	29	127
5666	Medway	medway	29	127
5667	Melrose	melrose	29	127
5668	Mendon	mendon	29	127
5669	Merrimac	merrimac	29	127
5670	Methuen	methuen	29	127
5671	Middleborough	middleborough	29	127
5672	Middlefield	middlefield	29	129
5673	Middleton	middleton	29	127
5674	Milford	milford	29	127
5675	Millbury	millbury	29	127
5676	Millis	millis	29	127
5677	Millville	millville	29	127
5678	Milton	milton	29	127
5679	Monson	monson	29	129
5680	Montague	montague	29	129
5681	Monterey	monterey	29	130
5682	Nahant	nahant	29	127
5683	Nantucket	nantucket	29	127
5684	Natick	natick	29	127
5685	Needham	needham	29	127
5686	New Bedford	new-bedford	29	128
5687	Newbury	newbury	29	127
5688	Newburyport	newburyport	29	127
5689	Newton	newton	29	127
5690	Norfolk	norfolk	29	127
5691	North Adams	north-adams	29	130
5692	North Andover	north-andover	29	127
5693	North Attleborough	north-attleborough	29	128
5694	North Reading	north-reading	29	127
5695	North Truro	north-truro	29	127
5696	Northampton	northampton	29	129
5697	Northbridge	northbridge	29	127
5698	Norton	norton	29	128
5699	Norwell	norwell	29	127
5700	Norwood	norwood	29	127
5701	Oak Bluffs	oak-bluffs	29	127
5702	Oakham	oakham	29	127
5703	Otis	otis	29	130
5704	Paxton	paxton	29	127
5705	Peabody	peabody	29	127
5706	Pembroke	pembroke	29	127
5707	Petersham	petersham	29	127
5708	Pittsfield	pittsfield	29	130
5709	Plainfield	plainfield	29	129
5710	Plainville	plainville	29	127
5711	Plymouth	plymouth	29	127
5712	Princeton	princeton	29	127
5713	Provincetown	provincetown	29	127
5714	Quincy	quincy	29	127
5715	Randolph	randolph	29	127
5716	Raynham	raynham	29	128
5717	Reading	reading	29	127
5718	Rehoboth	rehoboth	29	128
5719	Revere	revere	29	127
5720	Richmond	richmond	29	130
5721	Rochester	rochester	29	127
5722	Rockland	rockland	29	127
5723	Rowe	rowe	29	129
5724	Russell	russell	29	129
5725	Sagamore Beach	sagamore-beach	29	127
5726	Salem	salem	29	127
5727	Salisbury	salisbury	29	127
5728	Sandisfield	sandisfield	29	130
5729	Saugus	saugus	29	127
5730	Savoy	savoy	29	130
5731	Scituate	scituate	29	127
5732	Seekonk	seekonk	29	128
5733	Sheffield	sheffield	29	130
5734	Shelburne Falls	shelburne-falls	29	129
5735	Sherborn	sherborn	29	127
5736	Shrewsbury	shrewsbury	29	127
5737	Somerset	somerset	29	128
5738	Somerville	somerville	29	127
5739	South Hadley	south-hadley	29	129
5740	Southampton	southampton	29	129
5741	Southborough	southborough	29	127
5742	Southbridge	southbridge	29	127
5743	Southwick	southwick	29	129
5744	Springfield	springfield	29	129
5745	Sterling	sterling	29	127
5746	Stockbridge	stockbridge	29	130
5747	Stoneham	stoneham	29	127
5748	Stoughton	stoughton	29	127
5749	Stow	stow	29	127
5750	Sudbury	sudbury	29	127
5751	Sunderland	sunderland	29	129
5752	Sutton	sutton	29	127
5753	Swampscott	swampscott	29	127
5754	Swansea	swansea	29	128
5755	Taunton	taunton	29	128
5756	Templeton	templeton	29	127
5757	Tewksbury	tewksbury	29	127
5758	Truro	truro	29	127
5759	Tyngsboro	tyngsboro	29	127
5760	Tyringham	tyringham	29	130
5761	Upton	upton	29	127
5762	Uxbridge	uxbridge	29	127
5763	Village of Nagog Woods	village-of-nagog-woods	29	127
5764	Wakefield	wakefield	29	127
5765	Wales	wales	29	129
5766	Waltham	waltham	29	127
5767	Wareham	wareham	29	127
5768	Watertown	watertown	29	127
5769	Wayland	wayland	29	127
5770	Webster	webster	29	127
5771	Wellesley	wellesley	29	127
5772	Wellfleet	wellfleet	29	127
5773	Wenham	wenham	29	127
5774	West Boylston	west-boylston	29	127
5775	West Bridgewater	west-bridgewater	29	127
5776	West Newbury	west-newbury	29	127
5777	West Springfield	west-springfield	29	129
5778	West Stockbridge	west-stockbridge	29	130
5779	West Tisbury	west-tisbury	29	127
5780	Westfield	westfield	29	129
5781	Westford	westford	29	127
5782	Westminster	westminster	29	127
5783	Weston	weston	29	127
5784	Westport	westport	29	128
5785	Westwood	westwood	29	127
5786	Weymouth	weymouth	29	127
5787	Whately	whately	29	129
5788	Whitman	whitman	29	127
5789	Williamsburg	williamsburg	29	129
5790	Wilmington	wilmington	29	127
5791	Winchester	winchester	29	127
5792	Windsor	windsor	29	130
5793	Winthrop	winthrop	29	127
5794	Woburn	woburn	29	127
5795	Worcester	worcester	29	127
5796	Worthington	worthington	29	129
5797	Wrentham	wrentham	29	127
5798	Adams	adams	29	130
5799	Andover	andover	29	127
5800	Ayer	ayer	29	127
5801	Barre	barre	29	127
5802	Belchertown	belchertown	29	129
5803	Bellingham	bellingham	29	127
5804	Berkley	berkley	29	128
5805	Bourne	bourne	29	127
5806	Boxford	boxford	29	127
5807	Brewster	brewster	29	127
5808	Bridgewater	bridgewater	29	127
5809	Chatham	chatham	29	127
5810	Clinton	clinton	29	127
5811	Dennis	dennis	29	127
5812	Devens	devens	29	127
5813	Dover	dover	29	127
5814	Duxbury	duxbury	29	127
5815	Foxborough	foxborough	29	127
5816	Freetown	freetown	29	128
5817	Groton	groton	29	127
5818	Hancock	hancock	29	130
5819	Hanson	hanson	29	127
5820	Hingham	hingham	29	127
5821	Hopedale	hopedale	29	127
5822	Hopkinton	hopkinton	29	127
5823	Hudson	hudson	29	127
5824	Ipswich	ipswich	29	127
5825	Kingston	kingston	29	127
5826	Lee	lee	29	130
5827	Lenox	lenox	29	130
5828	Lunenburg	lunenburg	29	127
5829	Marshfield	marshfield	29	127
5830	Medfield	medfield	29	127
5831	North Brookfield	north-brookfield	29	127
5832	Northborough	northborough	29	127
5833	Orange	orange	29	129
5834	Orleans	orleans	29	127
5835	Oxford	oxford	29	127
5836	Palmer	palmer	29	129
5837	Pepperell	pepperell	29	127
5838	Rowley	rowley	29	127
5839	Rutland	rutland	29	127
5840	Sandwich	sandwich	29	127
5841	Sharon	sharon	29	127
5842	Shirley	shirley	29	127
5843	Southbridge	southbridge	29	127
5844	Spencer	spencer	29	127
5845	Sturbridge	sturbridge	29	127
5846	Tisbury	tisbury	29	127
5847	Topsfield	topsfield	29	127
5848	Townsend	townsend	29	127
5849	Tyngsborough	tyngsborough	29	127
5850	Walpole	walpole	29	127
5851	Ware	ware	29	129
5852	Westborough	westborough	29	127
5853	Wilbraham	wilbraham	29	129
5854	Williamstown	williamstown	29	130
5855	Winchendon	winchendon	29	127
5856	Yarmouth	yarmouth	29	127
5857	Aberdeen	aberdeen	35	131
5858	Aberdeen Proving Ground	aberdeen-proving-ground	35	131
5859	Abingdon	abingdon	35	131
5860	Accokeek	accokeek	35	132
5861	Adamstown	adamstown	35	132
5862	Joint Base Andrews	joint-base-andrews	35	132
5863	Annapolis	annapolis	35	131
5864	Annapolis Junction	annapolis-junction	35	131
5865	Arnold	arnold	35	131
5866	Baltimore	baltimore	35	131
5867	Bel Air	bel-air	35	131
5868	Belcamp	belcamp	35	131
5869	Beltsville	beltsville	35	132
5870	Berlin	berlin	35	133
5871	Bethesda	bethesda	35	132
5872	Bethlehem	bethlehem	35	131
5873	Bladensburg	bladensburg	35	132
5874	Bowie	bowie	35	132
5875	Boyds	boyds	35	132
5876	Brandywine	brandywine	35	132
5877	Brentwood	brentwood	35	132
5878	Brookeville	brookeville	35	132
5879	Brooklandville	brooklandville	35	131
5880	Brownsville	brownsville	35	132
5881	Brunswick	brunswick	35	132
5882	Burtonsville	burtonsville	35	132
5883	Butler	butler	35	131
5884	Cabin John	cabin-john	35	132
5885	California	california	35	132
5886	Cambridge	cambridge	35	133
5887	Capitol Heights	capitol-heights	35	132
5888	Highfield-Cascade	highfield-cascade	35	132
5889	Catonsville	catonsville	35	131
5890	Cecilton	cecilton	35	131
5891	Centreville	centreville	35	131
5892	Charlotte Hall	charlotte-hall	35	132
5893	Chase	chase	35	131
5894	Cheltenham	cheltenham	35	132
5895	Chesapeake Beach	chesapeake-beach	35	132
5896	Chester	chester	35	131
5897	Chestertown	chestertown	35	131
5898	Chevy Chase	chevy-chase	35	132
5899	Churchville	churchville	35	131
5900	Clarksburg	clarksburg	35	132
5901	Clarksville	clarksville	35	131
5902	Clinton	clinton	35	132
5903	Cockeysville	cockeysville	35	131
5904	College Park	college-park	35	132
5905	Colora	colora	35	131
5906	Columbia	columbia	35	131
5907	Compton	compton	35	132
5908	Conowingo	conowingo	35	131
5909	Cooksville	cooksville	35	131
5910	Crisfield	crisfield	35	133
5911	Crofton	crofton	35	131
5912	Crownsville	crownsville	35	131
5913	Cumberland	cumberland	35	132
5914	Damascus	damascus	35	132
5915	Darlington	darlington	35	131
5916	Davidsonville	davidsonville	35	131
5917	Deal Island	deal-island	35	133
5918	Deale	deale	35	131
5919	Delmar	delmar	35	133
5920	Denton	denton	35	131
5921	Derwood	derwood	35	132
5922	District Heights	district-heights	35	132
5923	Dundalk	dundalk	35	131
5924	Dunkirk	dunkirk	35	132
5925	East New Market	east-new-market	35	133
5926	Easton	easton	35	131
5927	Edgewater	edgewater	35	131
5928	Edgewood	edgewood	35	131
5929	Elkridge	elkridge	35	131
5930	Elkton	elkton	35	131
5931	Ellicott City	ellicott-city	35	131
5932	Emmitsburg	emmitsburg	35	132
5933	Essex	essex	35	131
5934	Fallston	fallston	35	131
5935	Faulkner	faulkner	35	132
5936	Federalsburg	federalsburg	35	131
5937	Finksburg	finksburg	35	131
5938	Forest Hill	forest-hill	35	131
5939	Fork	fork	35	131
5940	Frederick	frederick	35	132
5941	Frostburg	frostburg	35	132
5942	Fruitland	fruitland	35	133
5943	Fort Meade	fort-meade	35	131
5944	Fort Washington	fort-washington	35	132
5945	Fulton	fulton	35	131
5946	Funkstown	funkstown	35	132
5947	Gaithersburg	gaithersburg	35	132
5948	Gambrills	gambrills	35	131
5949	Garrett Park	garrett-park	35	132
5950	Germantown	germantown	35	132
5951	Glen Arm	glen-arm	35	131
5952	Glen Burnie	glen-burnie	35	131
5953	Glen Echo	glen-echo	35	132
5954	Glenelg	glenelg	35	131
5955	Glenn Dale	glenn-dale	35	132
5956	Glenwood	glenwood	35	131
5957	Glyndon	glyndon	35	131
5958	Grasonville	grasonville	35	131
5959	Great Mills	great-mills	35	132
5960	Greenbelt	greenbelt	35	132
5961	Gunpowder	gunpowder	35	131
5962	Hagerstown	hagerstown	35	132
5963	Halethorpe	halethorpe	35	131
5964	Hampstead	hampstead	35	131
5965	Hanover	hanover	35	131
5966	Harwood	harwood	35	131
5967	Havre de Grace	havre-de-grace	35	131
5968	Henderson	henderson	35	131
5969	Hollywood	hollywood	35	132
5970	Hughesville	hughesville	35	132
5971	Huntingtown	huntingtown	35	132
5972	Hurlock	hurlock	35	133
5973	Hyattsville	hyattsville	35	132
5974	Ijamsville	ijamsville	35	132
5975	Indian Head	indian-head	35	132
5976	Jarrettsville	jarrettsville	35	131
5977	Jefferson	jefferson	35	132
5978	Jessup	jessup	35	131
5979	Joppa	joppa	35	131
5980	Kensington	kensington	35	132
5981	Keymar	keymar	35	131
5982	Knoxville	knoxville	35	132
5983	La Plata	la-plata	35	132
5984	Lanham	lanham	35	132
5985	Laurel	laurel	35	132
5986	Leonardtown	leonardtown	35	132
5987	Lexington Park	lexington-park	35	132
5988	Linthicum Heights	linthicum-heights	35	131
5989	Lisbon	lisbon	35	131
5990	Luke	luke	35	132
5991	Lusby	lusby	35	132
5992	Lutherville-Timonium	lutherville-timonium	35	131
5993	Manchester	manchester	35	131
5994	Marriottsville	marriottsville	35	131
5995	Mayo	mayo	35	131
5996	McHenry	mchenry	35	134
5997	McDaniel	mcdaniel	35	131
5998	Mechanicsville	mechanicsville	35	132
5999	Middle River	middle-river	35	131
6000	Middletown	middletown	35	132
6001	Millersville	millersville	35	131
6002	Monkton	monkton	35	131
6003	Monrovia	monrovia	35	132
6004	Montgomery Village	montgomery-village	35	132
6005	Mount Airy	mount-airy	35	131
6006	Mount Rainier	mount-rainier	35	132
6007	Myersville	myersville	35	132
6008	Nanticoke	nanticoke	35	133
6009	New Market	new-market	35	132
6010	New Windsor	new-windsor	35	131
6011	Newark	newark	35	133
6012	North Beach	north-beach	35	132
6013	North East	north-east	35	131
6014	Nottingham	nottingham	35	131
6015	Oakland	oakland	35	134
6016	Ocean City	ocean-city	35	133
6017	Odenton	odenton	35	131
6018	Oldtown	oldtown	35	132
6019	Olney	olney	35	132
6020	Owings	owings	35	132
6021	Owings Mills	owings-mills	35	131
6022	Oxon Hill	oxon-hill	35	132
6023	Parkton	parkton	35	131
6024	Parkville	parkville	35	131
6025	Pasadena	pasadena	35	131
6026	Patuxent River	patuxent-river	35	132
6027	Perry Hall	perry-hall	35	131
6028	Perryman	perryman	35	131
6029	Perryville	perryville	35	131
6030	Phoenix	phoenix	35	131
6031	Pikesville	pikesville	35	131
6032	Pocomoke City	pocomoke-city	35	133
6033	Point of Rocks	point-of-rocks	35	132
6034	Poolesville	poolesville	35	132
6035	Port Deposit	port-deposit	35	131
6036	Potomac	potomac	35	132
6037	Preston	preston	35	131
6038	Prince Frederick	prince-frederick	35	132
6039	Princess Anne	princess-anne	35	133
6040	Randallstown	randallstown	35	131
6041	Reisterstown	reisterstown	35	131
6042	Ridge	ridge	35	132
6043	Ridgely	ridgely	35	131
6044	Rising Sun	rising-sun	35	131
6045	Riverdale Park	riverdale-park	35	132
6046	Rock Point	rock-point	35	132
6047	Rockville	rockville	35	132
6048	Rosedale	rosedale	35	131
6049	Salisbury	salisbury	35	133
6050	Severn	severn	35	131
6051	Severna Park	severna-park	35	131
6052	Shady Side	shady-side	35	131
6053	Silver Spring	silver-spring	35	132
6054	Smithsburg	smithsburg	35	132
6055	Snow Hill	snow-hill	35	133
6056	Solomons	solomons	35	132
6057	Sparks Glencoe	sparks-glencoe	35	131
6058	Sparrows Point	sparrows-point	35	131
6059	Spencerville	spencerville	35	132
6060	Saint Inigoes	saint-inigoes	35	132
6061	Saint Leonard	saint-leonard	35	132
6062	Saint Marys City	saint-marys-city	35	132
6063	Saint Michaels	saint-michaels	35	131
6064	Stevensville	stevensville	35	131
6065	Sudlersville	sudlersville	35	131
6066	Suitland-Silver Hill	suitland-silver-hill	35	132
6067	Sykesville	sykesville	35	131
6068	Takoma Park	takoma-park	35	132
6069	Taneytown	taneytown	35	131
6070	Temple Hills	temple-hills	35	132
6071	Towson	towson	35	131
6072	Union Bridge	union-bridge	35	131
6073	Upper Marlboro	upper-marlboro	35	132
6074	Valley Lee	valley-lee	35	132
6075	Vienna	vienna	35	133
6076	Waldorf	waldorf	35	132
6077	Walkersville	walkersville	35	132
6078	Washington Grove	washington-grove	35	132
6079	West Friendship	west-friendship	35	131
6080	West River	west-river	35	131
6081	Westernport	westernport	35	132
6082	Westminster	westminster	35	131
6083	Westover	westover	35	133
6084	White Hall	white-hall	35	131
6085	White Marsh	white-marsh	35	131
6086	White Plains	white-plains	35	132
6087	Whiteford	whiteford	35	131
6088	Willards	willards	35	133
6089	Williamsport	williamsport	35	132
6090	Woodbine	woodbine	35	131
6091	Woodsboro	woodsboro	35	132
6092	Woodstock	woodstock	35	131
6093	Wye Mills	wye-mills	35	131
6094	Adelphi	adelphi	35	132
6095	Arbutus	arbutus	35	131
6096	Aspen Hill	aspen-hill	35	132
6097	Ballenger Creek	ballenger-creek	35	132
6098	Bel Air North	bel-air-north	35	131
6099	Bel Air South	bel-air-south	35	131
6100	Bennsville	bennsville	35	132
6101	Brooklyn Park	brooklyn-park	35	131
6102	Calverton	calverton	35	132
6103	Camp Springs	camp-springs	35	132
6104	Cape Saint Claire	cape-saint-claire	35	131
6105	Carney	carney	35	131
6106	Cheverly	cheverly	35	132
6107	Chillum	chillum	35	132
6108	Cloverly	cloverly	35	132
6109	Colesville	colesville	35	132
6110	Darnestown	darnestown	35	132
6111	East Riverdale	east-riverdale	35	132
6112	Edgemere	edgemere	35	131
6113	Eldersburg	eldersburg	35	131
6114	Fairland	fairland	35	132
6115	Ferndale	ferndale	35	131
6116	Forestville	forestville	35	132
6117	Friendly	friendly	35	132
6118	Garrison	garrison	35	131
6119	Goddard	goddard	35	132
6120	Greater Landover	greater-landover	35	132
6121	Green Valley	green-valley	35	132
6122	Hancock	hancock	35	132
6123	Hillcrest Heights	hillcrest-heights	35	132
6124	Hillsmere Shores	hillsmere-shores	35	131
6125	Joppatowne	joppatowne	35	131
6126	Kettering	kettering	35	132
6127	Kingsville	kingsville	35	131
6128	Lake Arbor	lake-arbor	35	132
6129	Lake Shore	lake-shore	35	131
6130	Lanham-Seabrook	lanham-seabrook	35	132
6131	Lansdowne	lansdowne	35	131
6132	Largo	largo	35	132
6133	Linganore-Bartonsville	linganore-bartonsville	35	132
6134	Lochearn	lochearn	35	131
6135	Maryland City	maryland-city	35	131
6136	Milford Mill	milford-mill	35	131
6137	Mitchellville	mitchellville	35	132
6138	New Carrollton	new-carrollton	35	132
6139	North Bethesda	north-bethesda	35	132
6140	North Kensington	north-kensington	35	132
6141	North Laurel	north-laurel	35	131
6142	North Potomac	north-potomac	35	132
6143	Ocean Pines	ocean-pines	35	133
6144	Oxon Hill-Glassmanor	oxon-hill-glassmanor	35	132
6145	Parole	parole	35	131
6146	Pylesville	pylesville	35	131
6147	Redland	redland	35	132
6148	Riva	riva	35	131
6149	Rosaryville	rosaryville	35	132
6150	Rossville	rossville	35	131
6151	Savage	savage	35	131
6152	South Kensington	south-kensington	35	132
6153	South Laurel	south-laurel	35	132
6154	Saint Charles	saint-charles	35	132
6155	Thurmont	thurmont	35	132
6156	Travilah	travilah	35	132
6157	West Laurel	west-laurel	35	132
6158	Wheaton-Glenmont	wheaton-glenmont	35	132
6159	White Oak	white-oak	35	132
6160	Woodlawn	woodlawn	35	131
6161	Woodmore	woodmore	35	132
6162	Acton	acton	40	135
6163	Addison	addison	40	136
6164	Albion	albion	40	135
6165	Alfred	alfred	40	135
6166	Andover	andover	40	135
6167	Ashland	ashland	40	137
6168	Athens	athens	40	136
6169	Auburn	auburn	40	135
6170	Augusta	augusta	40	135
6171	Aurora	aurora	40	136
6172	Baileyville	baileyville	40	136
6173	Bangor	bangor	40	136
6174	Bath	bath	40	135
6175	Beals	beals	40	136
6176	Belfast	belfast	40	136
6177	Belgrade	belgrade	40	135
6178	Benedicta	benedicta	40	137
6179	Berwick	berwick	40	135
6180	Bethel	bethel	40	135
6181	Biddeford	biddeford	40	135
6182	Blue Hill	blue-hill	40	136
6183	Boothbay	boothbay	40	135
6184	Bowdoinham	bowdoinham	40	135
6185	Bradford	bradford	40	136
6186	Bradley	bradley	40	136
6187	Bremen	bremen	40	135
6188	Brewer	brewer	40	136
6189	Bridgewater	bridgewater	40	137
6190	Bridgton	bridgton	40	135
6191	Bristol	bristol	40	135
6192	Brooklin	brooklin	40	136
6193	Brooks	brooks	40	136
6194	Brooksville	brooksville	40	136
6195	Brownfield	brownfield	40	135
6196	Brownville	brownville	40	136
6197	Buckfield	buckfield	40	135
6198	Bucksport	bucksport	40	136
6199	Burnham	burnham	40	136
6200	Buxton	buxton	40	135
6201	Calais	calais	40	136
6202	Cambridge	cambridge	40	136
6203	Canaan	canaan	40	136
6204	Canton	canton	40	135
6205	Cape Elizabeth	cape-elizabeth	40	135
6206	Caratunk	caratunk	40	136
6207	Caribou	caribou	40	137
6208	Carmel	carmel	40	136
6209	Casco	casco	40	135
6210	Castine	castine	40	136
6211	Charleston	charleston	40	136
6212	Chebeague Island	chebeague-island	40	135
6213	Cherryfield	cherryfield	40	136
6214	Columbia Falls	columbia-falls	40	136
6215	Corinna	corinna	40	136
6216	Corinth	corinth	40	136
6217	Cornish	cornish	40	135
6218	Cranberry Isles	cranberry-isles	40	136
6219	Cushing	cushing	40	135
6220	Cutler	cutler	40	136
6221	Damariscotta	damariscotta	40	135
6222	Danforth	danforth	40	136
6223	Deer Isle	deer-isle	40	136
6224	Denmark	denmark	40	135
6225	Dennysville	dennysville	40	136
6226	Detroit	detroit	40	136
6227	Dresden	dresden	40	135
6228	Durham	durham	40	135
6229	Eagle Lake	eagle-lake	40	137
6230	East Machias	east-machias	40	136
6231	East Millinocket	east-millinocket	40	136
6232	Easton	easton	40	137
6233	Eastport	eastport	40	136
6234	Eddington	eddington	40	136
6235	Edgecomb	edgecomb	40	135
6236	Eliot	eliot	40	135
6237	Ellsworth	ellsworth	40	136
6238	Etna	etna	40	136
6239	Exeter	exeter	40	136
6240	Falmouth	falmouth	40	135
6241	Frankfort	frankfort	40	136
6242	Franklin	franklin	40	136
6243	Frenchboro	frenchboro	40	136
6244	Frenchville	frenchville	40	137
6245	Friendship	friendship	40	135
6246	Fryeburg	fryeburg	40	135
6247	Gardiner	gardiner	40	135
6248	Garland	garland	40	136
6249	Georgetown	georgetown	40	135
6250	Gouldsboro	gouldsboro	40	136
6251	Grand Isle	grand-isle	40	137
6252	Grand Lake Stream	grand-lake-stream	40	136
6253	Gray	gray	40	135
6254	Greenbush	greenbush	40	136
6255	Greene	greene	40	135
6256	Greenville	greenville	40	136
6257	Hallowell	hallowell	40	135
6258	Hancock	hancock	40	136
6259	Harmony	harmony	40	136
6260	Harpswell	harpswell	40	135
6261	Harrington	harrington	40	136
6262	Harrison	harrison	40	135
6263	Hartland	hartland	40	136
6264	Hebron	hebron	40	135
6265	Hiram	hiram	40	135
6266	Holden	holden	40	136
6267	Hollis	hollis	40	135
6268	Hope	hope	40	135
6269	Hudson	hudson	40	136
6270	Island Falls	island-falls	40	137
6271	Isle au Haut	isle-au-haut	40	135
6272	Islesboro	islesboro	40	136
6273	Jackman	jackman	40	136
6274	Jay	jay	40	135
6275	Jefferson	jefferson	40	135
6276	Jonesboro	jonesboro	40	136
6277	Jonesport	jonesport	40	136
6278	Kenduskeag	kenduskeag	40	136
6279	Kingfield	kingfield	40	135
6280	Lagrange	lagrange	40	136
6281	Lebanon	lebanon	40	135
6282	Lee	lee	40	136
6283	Leeds	leeds	40	135
6284	Levant	levant	40	136
6285	Lewiston	lewiston	40	135
6286	Liberty	liberty	40	136
6287	Limerick	limerick	40	135
6288	Limington	limington	40	135
6289	Lincolnville	lincolnville	40	136
6290	Lisbon	lisbon	40	135
6291	Livermore	livermore	40	135
6292	Livermore Falls	livermore-falls	40	135
6293	Long Island	long-island	40	135
6294	Lovell	lovell	40	135
6295	Lubec	lubec	40	136
6296	Machias	machias	40	136
6297	Machiasport	machiasport	40	136
6298	Manchester	manchester	40	135
6299	Mapleton	mapleton	40	137
6300	Mars Hill	mars-hill	40	137
6301	Mattawamkeag	mattawamkeag	40	136
6302	Medway	medway	40	136
6303	Milbridge	milbridge	40	136
6304	Millinocket	millinocket	40	136
6305	Minot	minot	40	135
6306	Monhegan	monhegan	40	135
6307	Monmouth	monmouth	40	135
6308	Monroe	monroe	40	136
6309	Monson	monson	40	136
6310	Monticello	monticello	40	137
6311	Morrill	morrill	40	136
6312	Mount Desert	mount-desert	40	136
6313	Mount Vernon	mount-vernon	40	135
6314	Naples	naples	40	135
6315	New Gloucester	new-gloucester	40	135
6316	New Portland	new-portland	40	136
6317	New Sharon	new-sharon	40	135
6318	New Sweden	new-sweden	40	137
6319	New Vineyard	new-vineyard	40	135
6320	Newcastle	newcastle	40	135
6321	Newfield	newfield	40	135
6322	Nobleboro	nobleboro	40	135
6323	North Haven	north-haven	40	135
6324	North Yarmouth	north-yarmouth	40	135
6325	Oakfield	oakfield	40	137
6326	Ogunquit	ogunquit	40	135
6327	Old Orchard Beach	old-orchard-beach	40	135
6328	Old Town	old-town	40	136
6329	Orland	orland	40	136
6330	Orrington	orrington	40	136
6331	Owls Head	owls-head	40	135
6332	Palermo	palermo	40	136
6333	Palmyra	palmyra	40	136
6334	Paris	paris	40	135
6335	Parsonsfield	parsonsfield	40	135
6336	Patten	patten	40	136
6337	Pembroke	pembroke	40	136
6338	Penobscot	penobscot	40	136
6339	Perry	perry	40	136
6340	Peru	peru	40	135
6341	Phillips	phillips	40	135
6342	Phippsburg	phippsburg	40	135
6343	Poland	poland	40	135
6344	Porter	porter	40	135
6345	Portland	portland	40	135
6346	Pownal	pownal	40	135
6347	Presque Isle	presque-isle	40	137
6348	Princeton	princeton	40	136
6349	Randolph	randolph	40	135
6350	Rangeley	rangeley	40	135
6351	Raymond	raymond	40	135
6352	Readfield	readfield	40	135
6353	Robbinston	robbinston	40	136
6354	Rockland	rockland	40	135
6355	Rockport	rockport	40	135
6356	Rockwood	rockwood	40	136
6357	Sabattus	sabattus	40	135
6358	Saco	saco	40	135
6359	Sangerville	sangerville	40	136
6360	Searsmont	searsmont	40	136
6361	Sebago	sebago	40	135
6362	Sebec	sebec	40	136
6363	Sedgwick	sedgwick	40	136
6364	Shapleigh	shapleigh	40	135
6365	Sinclair	sinclair	40	137
6366	Smithfield	smithfield	40	136
6367	Solon	solon	40	136
6368	South Berwick	south-berwick	40	135
6369	South Bristol	south-bristol	40	135
6370	South Gardiner	south-gardiner	40	135
6371	South Portland	south-portland	40	135
6372	South Thomaston	south-thomaston	40	135
6373	Southport	southport	40	135
6374	Southwest Harbor	southwest-harbor	40	136
6375	Springfield	springfield	40	136
6376	Saint Agatha	saint-agatha	40	137
6377	Saint Albans	saint-albans	40	136
6378	Saint Francis	saint-francis	40	137
6379	Standish	standish	40	135
6380	Stetson	stetson	40	136
6381	Steuben	steuben	40	136
6382	Stockholm	stockholm	40	137
6383	Stockton Springs	stockton-springs	40	136
6384	Stonington	stonington	40	136
6385	Strong	strong	40	135
6386	Sullivan	sullivan	40	136
6387	Sumner	sumner	40	135
6388	Surry	surry	40	136
6389	Swans Island	swans-island	40	136
6390	Thomaston	thomaston	40	135
6391	Thorndike	thorndike	40	136
6392	Topsfield	topsfield	40	136
6393	Troy	troy	40	136
6394	Turner	turner	40	135
6395	Union	union	40	135
6396	Vanceboro	vanceboro	40	136
6397	Vassalboro	vassalboro	40	135
6398	Vinalhaven	vinalhaven	40	135
6399	Warren	warren	40	135
6400	Washburn	washburn	40	137
6401	Washington	washington	40	135
6402	Waterboro	waterboro	40	135
6403	Waterford	waterford	40	135
6404	Waterville	waterville	40	135
6405	Wayne	wayne	40	135
6406	Weld	weld	40	135
6407	Wells	wells	40	135
6408	Wesley	wesley	40	136
6409	West Paris	west-paris	40	135
6410	Westbrook	westbrook	40	135
6411	Whitefield	whitefield	40	135
6412	Whiting	whiting	40	136
6413	Windham	windham	40	135
6414	Windsor	windsor	40	135
6415	Winter Harbor	winter-harbor	40	136
6416	Wiscasset	wiscasset	40	135
6417	Woolwich	woolwich	40	135
6418	Wytopitlock	wytopitlock	40	137
6419	York	york	40	135
6420	Bar Harbor	bar-harbor	40	136
6421	Boothbay Harbor	boothbay-harbor	40	135
6422	Brunswick	brunswick	40	135
6423	Camden	camden	40	135
6424	China	china	40	135
6425	Cumberland	cumberland	40	135
6426	Dexter	dexter	40	136
6427	Dover-Foxcroft	dover-foxcroft	40	136
6428	Farmington	farmington	40	135
6429	Fort Kent	fort-kent	40	137
6430	Freeport	freeport	40	135
6431	Gorham	gorham	40	135
6432	Hampden	hampden	40	136
6433	Hermon	hermon	40	136
6434	Houlton	houlton	40	137
6435	Kennebunk	kennebunk	40	135
6436	Kennebunkport	kennebunkport	40	135
6437	Kittery	kittery	40	135
6438	Lincoln	lincoln	40	136
6439	Madawaska	madawaska	40	137
6440	Norridgewock	norridgewock	40	136
6441	North Berwick	north-berwick	40	135
6442	Norway	norway	40	135
6443	Oakland	oakland	40	135
6444	Orono	orono	40	136
6445	Oxford	oxford	40	135
6446	Pittsfield	pittsfield	40	136
6447	Rumford	rumford	40	135
6448	Sanford	sanford	40	135
6449	Scarborough	scarborough	40	135
6450	Skowhegan	skowhegan	40	136
6451	Topsham	topsham	40	135
6452	Unity	unity	40	136
6453	Waldoboro	waldoboro	40	135
6454	Winslow	winslow	40	135
6455	Winterport	winterport	40	136
6456	Winthrop	winthrop	40	135
6457	Yarmouth	yarmouth	40	135
6458	Addison	addison	34	138
6459	Adrian	adrian	34	138
6460	Alanson	alanson	34	139
6461	Alba	alba	34	139
6462	Albion	albion	34	140
6463	Alger	alger	34	141
6464	Algonac	algonac	34	142
6465	Allegan	allegan	34	140
6466	Allen Park	allen-park	34	142
6467	Alma	alma	34	141
6468	Almont	almont	34	142
6469	Alpena	alpena	34	143
6470	Alto	alto	34	140
6471	Ann Arbor	ann-arbor	34	142
6472	Applegate	applegate	34	142
6473	Armada	armada	34	142
6474	Ashley	ashley	34	141
6475	Atlanta	atlanta	34	139
6476	Au Gres	au-gres	34	141
6477	Auburn	auburn	34	141
6478	Auburn Hills	auburn-hills	34	142
6479	Augusta	augusta	34	140
6480	Avoca	avoca	34	142
6481	Azalia	azalia	34	142
6482	Bad Axe	bad-axe	34	141
6483	Baldwin	baldwin	34	139
6484	Bangor	bangor	34	140
6485	Baraga	baraga	34	144
6486	Baroda	baroda	34	145
6487	Barton City	barton-city	34	143
6488	Bath Township	bath-township	34	146
6489	Battle Creek	battle-creek	34	140
6490	Bay City	bay-city	34	141
6491	Bay Shore	bay-shore	34	139
6492	Bear Lake	bear-lake	34	139
6493	Beaver Island	beaver-island	34	139
6494	Beaverton	beaverton	34	141
6495	Belding	belding	34	140
6496	Bellaire	bellaire	34	139
6497	Belleville	belleville	34	142
6498	Bentley	bentley	34	141
6499	Benton Harbor	benton-harbor	34	145
6500	Benzonia	benzonia	34	139
6501	Berkley	berkley	34	142
6502	Beulah	beulah	34	139
6503	Big Rapids	big-rapids	34	139
6504	Birch Run	birch-run	34	141
6505	Birmingham	birmingham	34	142
6506	Blanchard	blanchard	34	141
6507	Blissfield	blissfield	34	138
6508	Bloomfield Hills	bloomfield-hills	34	142
6509	Bloomingdale	bloomingdale	34	140
6510	Boyne City	boyne-city	34	139
6511	Boyne Falls	boyne-falls	34	139
6512	Breckenridge	breckenridge	34	141
6513	Brethren	brethren	34	139
6514	Bridgewater	bridgewater	34	142
6515	Bridgman	bridgman	34	145
6516	Brighton	brighton	34	142
6517	Brimley	brimley	34	139
6518	Britton	britton	34	138
6519	Bronson	bronson	34	140
6520	Brooklyn	brooklyn	34	146
6521	Brown City	brown-city	34	142
6522	Buchanan	buchanan	34	145
6523	Burlington	burlington	34	140
6524	Burnips	burnips	34	140
6525	Burr Oak	burr-oak	34	140
6526	Burton	burton	34	141
6527	Byron	byron	34	141
6528	Byron Center	byron-center	34	140
6529	Cadillac	cadillac	34	139
6530	Caledonia	caledonia	34	140
6531	Camden	camden	34	146
6532	Canton	canton	34	142
6533	Capac	capac	34	142
6534	Carleton	carleton	34	142
6535	Carney	carney	34	147
6536	Caro	caro	34	141
6537	Carson City	carson-city	34	140
6538	Carsonville	carsonville	34	142
6539	Caseville	caseville	34	141
6540	Cass City	cass-city	34	141
6541	Cassopolis	cassopolis	34	145
6542	Cedar Springs	cedar-springs	34	140
6543	Cedarville	cedarville	34	139
6544	Center Line	center-line	34	142
6545	Central Lake	central-lake	34	139
6546	Centreville	centreville	34	140
6547	Charlevoix	charlevoix	34	139
6548	Charlotte	charlotte	34	146
6549	Chatham	chatham	34	144
6550	Cheboygan	cheboygan	34	139
6551	Chelsea	chelsea	34	142
6552	Chesaning	chesaning	34	141
6553	Clare	clare	34	139
6554	Clarkston	clarkston	34	142
6555	Clarksville	clarksville	34	140
6556	Clawson	clawson	34	142
6557	Clifford	clifford	34	142
6558	Climax	climax	34	140
6559	Clinton	clinton	34	138
6560	Charter Township of Clinton	charter-township-of-clinton	34	142
6561	Clio	clio	34	141
6562	Coldwater	coldwater	34	140
6563	Coleman	coleman	34	141
6564	Coloma	coloma	34	145
6565	Colon	colon	34	140
6566	Columbiaville	columbiaville	34	142
6567	Commerce charter Township	commerce-charter-township	34	142
6568	Comstock Park	comstock-park	34	140
6569	Concord	concord	34	146
6570	Conklin	conklin	34	140
6571	Constantine	constantine	34	140
6572	Coopersville	coopersville	34	140
6573	Copper Harbor	copper-harbor	34	144
6574	Corunna	corunna	34	141
6575	Covert	covert	34	140
6576	Croswell	croswell	34	142
6577	Crystal Falls	crystal-falls	34	144
6578	Custer	custer	34	139
6579	Dansville	dansville	34	146
6580	Davison	davison	34	141
6581	Dearborn	dearborn	34	142
6582	Dearborn Heights	dearborn-heights	34	142
6583	Decatur	decatur	34	140
6584	Deckerville	deckerville	34	142
6585	Deerfield	deerfield	34	138
6586	Delton	delton	34	140
6587	Detroit	detroit	34	142
6588	DeWitt	dewitt	34	146
6589	Dexter	dexter	34	142
6590	Dollar Bay	dollar-bay	34	144
6591	Dorr	dorr	34	140
6592	Douglas	douglas	34	140
6593	Dowagiac	dowagiac	34	145
6594	Dryden	dryden	34	142
6595	Dundee	dundee	34	142
6596	Durand	durand	34	141
6597	East China	east-china	34	142
6598	East Jordan	east-jordan	34	139
6599	East Lansing	east-lansing	34	146
6600	East Tawas	east-tawas	34	141
6601	Eastpointe	eastpointe	34	142
6602	Eaton Rapids	eaton-rapids	34	146
6603	Eau Claire	eau-claire	34	145
6604	Ecorse	ecorse	34	142
6605	Edmore	edmore	34	140
6606	Edwardsburg	edwardsburg	34	145
6607	Elk Rapids	elk-rapids	34	139
6608	Ellsworth	ellsworth	34	139
6609	Elsie	elsie	34	146
6610	Emmett	emmett	34	142
6611	Escanaba	escanaba	34	144
6612	Essexville	essexville	34	141
6613	Evart	evart	34	139
6614	Fairview	fairview	34	139
6615	Farmington	farmington	34	142
6616	Fennville	fennville	34	140
6617	Fenton	fenton	34	141
6618	Ferndale	ferndale	34	142
6619	Ferrysburg	ferrysburg	34	140
6620	Fife Lake	fife-lake	34	139
6621	Flat Rock	flat-rock	34	142
6622	Flint	flint	34	141
6623	Flushing	flushing	34	141
6624	Foster City	foster-city	34	144
6625	Fowler	fowler	34	146
6626	Fowlerville	fowlerville	34	142
6627	Frankenmuth	frankenmuth	34	141
6628	Frankfort	frankfort	34	139
6629	Franklin	franklin	34	142
6630	Fraser	fraser	34	142
6631	Freeland	freeland	34	141
6632	Freeport	freeport	34	140
6633	Fremont	fremont	34	140
6634	Galesburg	galesburg	34	140
6635	Garden City	garden-city	34	142
6636	Gaylord	gaylord	34	139
6637	Genesee charter Township	genesee-charter-township	34	141
6638	Gladstone	gladstone	34	144
6639	Gladwin	gladwin	34	141
6640	Glen Arbor	glen-arbor	34	139
6641	Gobles	gobles	34	140
6642	Goodells	goodells	34	142
6643	Goodrich	goodrich	34	141
6644	Grand Blanc	grand-blanc	34	141
6645	Grand Haven	grand-haven	34	140
6646	Grand Junction	grand-junction	34	140
6647	Grand Ledge	grand-ledge	34	146
6648	Grand Rapids	grand-rapids	34	140
6649	Grandville	grandville	34	140
6650	Grant	grant	34	140
6651	Grawn	grawn	34	139
6652	Grayling	grayling	34	139
6653	Greenbush	greenbush	34	143
6654	Greenville	greenville	34	140
6655	Grosse Ile Township	grosse-ile-township	34	142
6656	Grosse Pointe	grosse-pointe	34	142
6657	Gwinn	gwinn	34	144
6658	Hale	hale	34	141
6659	Hamilton	hamilton	34	140
6660	Hamtramck	hamtramck	34	142
6661	Hancock	hancock	34	144
6662	Hanover	hanover	34	146
6663	Harbor Beach	harbor-beach	34	141
6664	Harbor Springs	harbor-springs	34	139
6665	Harper Woods	harper-woods	34	142
6666	Harrison	harrison	34	139
6667	Harrison charter Township	harrison-charter-township	34	142
6668	Harrisville	harrisville	34	143
6669	Harsens Island	harsens-island	34	142
6670	Hart	hart	34	140
6671	Hartford	hartford	34	140
6672	Hastings	hastings	34	140
6673	Hazel Park	hazel-park	34	142
6674	Hemlock	hemlock	34	141
6675	Henderson	henderson	34	141
6676	Hesperia	hesperia	34	140
6677	Hickory Corners	hickory-corners	34	140
6678	Highland charter Township	highland-charter-township	34	142
6679	Highland Park	highland-park	34	142
6680	Hillsdale	hillsdale	34	146
6681	Holland	holland	34	140
6682	Holly	holly	34	142
6683	Homer	homer	34	140
6684	Hopkins	hopkins	34	140
6685	Horton	horton	34	146
6686	Houghton	houghton	34	144
6687	Houghton Lake	houghton-lake	34	139
6688	Howard City	howard-city	34	140
6689	Howell	howell	34	142
6690	Hudson	hudson	34	138
6691	Hudsonville	hudsonville	34	140
6692	Huntington Woods	huntington-woods	34	142
6693	Imlay City	imlay-city	34	142
6694	Indian River	indian-river	34	139
6695	Inkster	inkster	34	142
6696	Interlochen	interlochen	34	139
6697	Ionia	ionia	34	140
6698	Iron Mountain	iron-mountain	34	144
6699	Iron River	iron-river	34	144
6700	Ironwood	ironwood	34	148
6701	Ishpeming	ishpeming	34	144
6702	Ithaca	ithaca	34	141
6703	Jackson	jackson	34	146
6704	Jamestown	jamestown	34	140
6705	Jeddo	jeddo	34	142
6706	Johannesburg	johannesburg	34	139
6707	Jones	jones	34	145
6708	Jonesville	jonesville	34	146
6709	Kalamazoo	kalamazoo	34	140
6710	Kalkaska	kalkaska	34	139
6711	Keego Harbor	keego-harbor	34	142
6712	Kent City	kent-city	34	140
6713	Kinde	kinde	34	141
6714	Kingsford	kingsford	34	144
6715	Kingsley	kingsley	34	139
6716	Kingston	kingston	34	141
6717	Laingsburg	laingsburg	34	141
6718	Lake City	lake-city	34	139
6719	Lake Linden	lake-linden	34	144
6720	Lake Odessa	lake-odessa	34	140
6721	Lakeview	lakeview	34	140
6722	Lakeville	lakeville	34	142
6723	Lambertville	lambertville	34	142
6724	L Anse	l-anse	34	144
6725	Lansing	lansing	34	146
6726	Lapeer	lapeer	34	142
6727	Lawrence	lawrence	34	140
6728	Leonard	leonard	34	142
6729	Leonidas	leonidas	34	140
6730	Le Roy	le-roy	34	139
6731	Leslie	leslie	34	146
6732	Lewiston	lewiston	34	139
6733	Lexington	lexington	34	142
6734	Lincoln	lincoln	34	143
6735	Lincoln Park	lincoln-park	34	142
6736	Linden	linden	34	141
6737	Linwood	linwood	34	141
6738	Litchfield	litchfield	34	146
6739	Livonia	livonia	34	142
6740	Lowell	lowell	34	140
6741	Ludington	ludington	34	139
6742	Luna Pier	luna-pier	34	142
6743	Mackinac Island	mackinac-island	34	139
6744	Mackinaw City	mackinaw-city	34	139
6745	Macomb	macomb	34	142
6746	Madison Heights	madison-heights	34	142
6747	Mancelona	mancelona	34	139
6748	Manchester	manchester	34	142
6749	Manistee	manistee	34	139
6750	Manistique	manistique	34	144
6751	Manton	manton	34	139
6752	Maple City	maple-city	34	139
6753	Marcellus	marcellus	34	145
6754	Marine City	marine-city	34	142
6755	Marion	marion	34	139
6756	Marlette	marlette	34	142
6757	Marne	marne	34	140
6758	Marshall	marshall	34	140
6759	Martin	martin	34	140
6760	Marysville	marysville	34	142
6761	Mason	mason	34	146
6762	Mattawan	mattawan	34	140
6763	Maybee	maybee	34	142
6764	Mayville	mayville	34	141
6765	McBain	mcbain	34	139
6766	Melvindale	melvindale	34	142
6767	Memphis	memphis	34	142
6768	Mendon	mendon	34	140
6769	Menominee	menominee	34	147
6770	Merrill	merrill	34	141
6771	Mesick	mesick	34	139
6772	Metamora	metamora	34	142
6773	Michigan Center	michigan-center	34	146
6774	Middleton	middleton	34	141
6775	Middleville	middleville	34	140
6776	Midland	midland	34	141
6777	Milan	milan	34	142
6778	Millington	millington	34	141
6779	Minden City	minden-city	34	142
6780	Mio	mio	34	139
6781	Moline	moline	34	140
6782	Monroe	monroe	34	142
6783	Montague	montague	34	140
6784	Montrose	montrose	34	141
6785	Morenci	morenci	34	138
6786	Morley	morley	34	139
6787	Morrice	morrice	34	141
6788	Mount Clemens	mount-clemens	34	142
6789	Mount Morris	mount-morris	34	141
6790	Mount Pleasant	mount-pleasant	34	141
6791	Munising	munising	34	144
6792	Muskegon	muskegon	34	140
6793	Napoleon	napoleon	34	146
6794	Nashville	nashville	34	140
6795	Negaunee	negaunee	34	144
6796	New Baltimore	new-baltimore	34	142
6797	New Boston	new-boston	34	142
6798	New Buffalo	new-buffalo	34	145
6799	New Era	new-era	34	140
6800	New Haven	new-haven	34	142
6801	New Lothrop	new-lothrop	34	141
6802	Newaygo	newaygo	34	140
6803	Niles	niles	34	145
6804	North Adams	north-adams	34	146
6805	North Branch	north-branch	34	142
6806	Northport	northport	34	139
6807	Northville	northville	34	142
6808	Norway	norway	34	144
6809	Nottawa	nottawa	34	140
6810	Novi	novi	34	142
6811	Nunica	nunica	34	140
6812	Oak Park	oak-park	34	142
6813	Olivet	olivet	34	146
6814	Onaway	onaway	34	139
6815	Onsted	onsted	34	138
6816	Ontonagon	ontonagon	34	144
6817	Osseo	osseo	34	146
6818	Otisville	otisville	34	141
6819	Otsego	otsego	34	140
6820	Ovid	ovid	34	146
6821	Owendale	owendale	34	141
6822	Owosso	owosso	34	141
6823	Paradise	paradise	34	139
6824	Parma	parma	34	146
6825	Paw Paw	paw-paw	34	140
6826	Peck	peck	34	142
6827	Pelkie	pelkie	34	144
6828	Pellston	pellston	34	139
6829	Pentwater	pentwater	34	140
6830	Perry	perry	34	141
6831	Petersburg	petersburg	34	142
6832	Petoskey	petoskey	34	139
6833	Pewamo	pewamo	34	140
6834	Pickford	pickford	34	139
6835	Pigeon	pigeon	34	141
6836	Pinckney	pinckney	34	142
6837	Pinconning	pinconning	34	141
6838	Pittsford	pittsford	34	146
6839	Plainwell	plainwell	34	140
6840	Pleasant Ridge	pleasant-ridge	34	142
6841	Plymouth	plymouth	34	142
6842	Pointe Aux Pins	pointe-aux-pins	34	139
6843	Pontiac	pontiac	34	142
6844	Port Hope	port-hope	34	141
6845	Port Huron	port-huron	34	142
6846	Port Sanilac	port-sanilac	34	142
6847	Portage	portage	34	140
6848	Portland	portland	34	140
6849	Potterville	potterville	34	146
6850	Prescott	prescott	34	141
6851	Pullman	pullman	34	140
6852	Quincy	quincy	34	140
6853	Rapid City	rapid-city	34	139
6854	Rapid River	rapid-river	34	144
6855	Ravenna	ravenna	34	140
6856	Reading	reading	34	146
6857	Redford charter Township	redford-charter-township	34	142
6858	Reed City	reed-city	34	139
6859	Reese	reese	34	141
6860	Remus	remus	34	139
6861	Richland	richland	34	140
6862	Richmond	richmond	34	142
6863	River Rouge	river-rouge	34	142
6864	Riverside	riverside	34	145
6865	Rochester	rochester	34	142
6866	Rockford	rockford	34	140
6867	Rockwood	rockwood	34	142
6868	Rogers City	rogers-city	34	139
6869	Romeo	romeo	34	142
6870	Romulus	romulus	34	142
6871	Roscommon	roscommon	34	139
6872	Rose City	rose-city	34	141
6873	Rosebush	rosebush	34	141
6874	Roseville	roseville	34	142
6875	Royal Oak	royal-oak	34	142
6876	Rudyard	rudyard	34	139
6877	Saginaw	saginaw	34	141
6878	Saline	saline	34	142
6879	Sand Creek	sand-creek	34	138
6880	Sand Lake	sand-lake	34	140
6881	Sandusky	sandusky	34	142
6882	Sanford	sanford	34	141
6883	Saranac	saranac	34	140
6884	Saugatuck	saugatuck	34	140
6885	Sault Ste. Marie	sault-ste-marie	34	139
6886	Sawyer	sawyer	34	145
6887	Schoolcraft	schoolcraft	34	140
6888	Scottville	scottville	34	139
6889	Sears	sears	34	139
6890	Sebewaing	sebewaing	34	141
6891	Shelby	shelby	34	140
6892	Shepherd	shepherd	34	141
6893	Six Lakes	six-lakes	34	140
6894	Smiths Creek	smiths-creek	34	142
6895	South Haven	south-haven	34	140
6896	South Lyon	south-lyon	34	142
6897	Southfield	southfield	34	142
6898	Southgate	southgate	34	142
6899	Sparta	sparta	34	140
6900	Spring Arbor	spring-arbor	34	146
6901	Spring Lake	spring-lake	34	140
6902	Springport	springport	34	146
6903	Spruce	spruce	34	143
6904	Saint Charles	saint-charles	34	141
6905	Saint Clair	saint-clair	34	142
6906	Saint Clair Shores	saint-clair-shores	34	142
6907	Saint Johns	saint-johns	34	146
6908	Saint Joseph	saint-joseph	34	145
6909	Saint Louis	saint-louis	34	141
6910	Standish	standish	34	141
6911	Stanton	stanton	34	140
6912	Stephenson	stephenson	34	147
6913	Sterling	sterling	34	141
6914	Sterling Heights	sterling-heights	34	142
6915	Stevensville	stevensville	34	145
6916	Stockbridge	stockbridge	34	146
6917	Sturgis	sturgis	34	140
6918	Suttons Bay	suttons-bay	34	139
6919	Swartz Creek	swartz-creek	34	141
6920	Tawas City	tawas-city	34	141
6921	Taylor	taylor	34	142
6922	Tecumseh	tecumseh	34	138
6923	Tekonsha	tekonsha	34	140
6924	Temperance	temperance	34	142
6925	Three Oaks	three-oaks	34	145
6926	Three Rivers	three-rivers	34	140
6927	Tipton	tipton	34	138
6928	Traverse City	traverse-city	34	139
6929	Trenton	trenton	34	142
6930	Troy	troy	34	142
6931	Tustin	tustin	34	139
6932	Twin Lake	twin-lake	34	140
6933	Twining	twining	34	141
6934	Ubly	ubly	34	141
6935	Union City	union-city	34	140
6936	University Center	university-center	34	141
6937	Utica	utica	34	142
6938	Vanderbilt	vanderbilt	34	139
6939	Vassar	vassar	34	141
6940	Vermontville	vermontville	34	146
6941	Vernon	vernon	34	141
6942	Vicksburg	vicksburg	34	140
6943	Wakefield	wakefield	34	148
6944	Waldron	waldron	34	146
6945	Walkerville	walkerville	34	140
6946	Wallace	wallace	34	147
6947	Walled Lake	walled-lake	34	142
6948	Walloon Lake	walloon-lake	34	139
6949	Warren	warren	34	142
6950	Washington	washington	34	142
6951	Waterford Township	waterford-township	34	142
6952	Watersmeet	watersmeet	34	148
6953	Watervliet	watervliet	34	145
6954	Wayland	wayland	34	140
6955	Wayne	wayne	34	142
6956	Webberville	webberville	34	146
6957	Weidman	weidman	34	141
6958	West Bloomfield Township	west-bloomfield-township	34	142
6959	West Branch	west-branch	34	141
6960	Westland	westland	34	142
6961	White Cloud	white-cloud	34	140
6962	White Lake charter Township	white-lake-charter-township	34	142
6963	White Pigeon	white-pigeon	34	140
6964	Whitehall	whitehall	34	140
6965	Whitmore Lake	whitmore-lake	34	142
6966	Whittemore	whittemore	34	141
6967	Williamston	williamston	34	146
6968	Wixom	wixom	34	142
6969	Wolverine	wolverine	34	139
6970	Wyandotte	wyandotte	34	142
6971	Yale	yale	34	142
6972	Ypsilanti	ypsilanti	34	142
6973	Zeeland	zeeland	34	140
6974	Allendale charter Township	allendale-charter-township	34	140
6975	Ann Arbor charter Township	ann-arbor-charter-township	34	142
6976	Augusta charter Township	augusta-charter-township	34	142
6977	Beechwood	beechwood	34	140
6978	Beverly Hills	beverly-hills	34	142
6979	Blackman	blackman	34	146
6980	Bloomfield Township	bloomfield-township	34	142
6981	Brandon charter Township	brandon-charter-township	34	142
6982	Bridgeport charter Township	bridgeport-charter-township	34	141
6983	Briley	briley	34	139
6984	Brownstown Charter Township	brownstown-charter-township	34	142
6985	Buena Vista charter Township	buena-vista-charter-township	34	141
6986	Coloma charter Township	coloma-charter-township	34	145
6987	Comstock charter Township	comstock-charter-township	34	140
6988	Delhi charter Township	delhi-charter-township	34	146
6989	Delta charter Township	delta-charter-township	34	146
6990	Denton Township	denton-township	34	139
6991	DeWitt Township	dewitt-township	34	146
6992	East Grand Rapids	east-grand-rapids	34	140
6993	Egelston Township	egelston-township	34	140
6994	Emmett charter Township	emmett-charter-township	34	140
6995	Fair Plain	fair-plain	34	145
6996	Farmington Hills	farmington-hills	34	142
6997	Fenton charter Township	fenton-charter-township	34	141
6998	Flint charter Township	flint-charter-township	34	141
6999	Flushing charter Township	flushing-charter-township	34	141
7000	Forest Hills	forest-hills	34	140
7001	Fort Gratiot charter Township	fort-gratiot-charter-township	34	142
7002	Frenchtown Township	frenchtown-township	34	142
7003	Fruitport Charter Township	fruitport-charter-township	34	140
7004	Gaines charter Township	gaines-charter-township	34	140
7005	Garfield charter Township	garfield-charter-township	34	139
7006	Georgetown charter Township	georgetown-charter-township	34	140
7007	Grand Blanc charter Township	grand-blanc-charter-township	34	141
7008	Grand Rapids charter Township	grand-rapids-charter-township	34	140
7009	Grass Lake charter Township	grass-lake-charter-township	34	146
7010	Grosse Pointe Farms	grosse-pointe-farms	34	142
7011	Grosse Pointe Park	grosse-pointe-park	34	142
7012	Grosse Pointe Woods	grosse-pointe-woods	34	142
7013	Huron charter Township	huron-charter-township	34	142
7014	Independence charter Township	independence-charter-township	34	142
7015	Oshtemo	oshtemo	34	140
7016	Kentwood	kentwood	34	140
7017	Lawton	lawton	34	140
7018	Leoni Township	leoni-township	34	146
7019	Lowell charter Township	lowell-charter-township	34	140
7020	Lyon charter Township	lyon-charter-township	34	142
7021	Meridian charter Township	meridian-charter-township	34	146
7022	Milford charter Township	milford-charter-township	34	142
7023	Monitor charter Township	monitor-charter-township	34	141
7024	Monroe charter Township	monroe-charter-township	34	142
7025	Mount Morris Township	mount-morris-township	34	141
7026	Muskegon charter Township	muskegon-charter-township	34	140
7027	Norton Shores	norton-shores	34	140
7028	Oakland charter Township	oakland-charter-township	34	142
7029	Orion charter Township	orion-charter-township	34	142
7030	Oronoko charter Township	oronoko-charter-township	34	145
7031	Oscoda charter Township	oscoda-charter-township	34	141
7032	Oxford Charter Township	oxford-charter-township	34	142
7033	Pittsfield charter Township	pittsfield-charter-township	34	142
7034	Plainfield charter Township	plainfield-charter-township	34	140
7035	Plymouth charter Township	plymouth-charter-township	34	142
7036	Portage charter Township	portage-charter-township	34	144
7037	Riverview	riverview	34	142
7038	Rochester Hills	rochester-hills	34	142
7039	Roscommon Township	roscommon-township	34	139
7040	Saginaw charter Township	saginaw-charter-township	34	141
7041	Shelby charter Township	shelby-charter-township	34	142
7042	Spring Arbor Township	spring-arbor-township	34	146
7043	Springfield Township	springfield-township	34	142
7044	Summit Township	summit-township	34	146
7045	Texas charter Township	texas-charter-township	34	140
7046	Thomas Township	thomas-township	34	141
7047	Tittabawassee Township	tittabawassee-township	34	141
7048	Union charter Township	union-charter-township	34	141
7049	Van Buren charter Township	van-buren-charter-township	34	142
7050	Vienna Township	vienna-township	34	141
7051	Walker	walker	34	140
7052	Westphalia	westphalia	34	146
7053	Windsor charter Township	windsor-charter-township	34	146
7054	Woodhaven	woodhaven	34	142
7055	Wyoming	wyoming	34	140
7056	York charter Township	york-charter-township	34	142
7057	Ypsilanti charter Township	ypsilanti-charter-township	34	142
7058	Zeeland charter Township	zeeland-charter-township	34	140
7059	Ada	ada	48	149
7060	Adams	adams	48	150
7061	Adrian	adrian	48	151
7062	Afton	afton	48	152
7063	Aitkin	aitkin	48	152
7064	Albany	albany	48	152
7065	Albert Lea	albert-lea	48	150
7066	Alberta	alberta	48	152
7067	Albertville	albertville	48	152
7068	Alden	alden	48	150
7069	Alexandria	alexandria	48	152
7070	Altura	altura	48	153
7071	Andover	andover	48	152
7072	Annandale	annandale	48	152
7073	Anoka	anoka	48	152
7074	Appleton	appleton	48	152
7075	Argyle	argyle	48	149
7076	Arlington	arlington	48	152
7077	Ashby	ashby	48	152
7078	Askov	askov	48	152
7079	Atwater	atwater	48	152
7080	Audubon	audubon	48	149
7081	Aurora	aurora	48	154
7082	Austin	austin	48	150
7083	Avon	avon	48	152
7084	Backus	backus	48	152
7085	Badger	badger	48	149
7086	Bagley	bagley	48	149
7087	Balaton	balaton	48	152
7088	Barnesville	barnesville	48	149
7089	Barnum	barnum	48	154
7090	Barrett	barrett	48	152
7091	Battle Lake	battle-lake	48	149
7092	Baudette	baudette	48	149
7093	Baxter	baxter	48	152
7094	Bayport	bayport	48	152
7095	Beardsley	beardsley	48	152
7096	Becker	becker	48	152
7097	Belgrade	belgrade	48	152
7098	Belle Plaine	belle-plaine	48	152
7099	Bellingham	bellingham	48	152
7100	Beltrami	beltrami	48	149
7101	Belview	belview	48	152
7102	Bemidji	bemidji	48	152
7103	Benson	benson	48	152
7104	Bertha	bertha	48	152
7105	Bethel	bethel	48	152
7106	Big Lake	big-lake	48	152
7107	Bigfork	bigfork	48	154
7108	Bird Island	bird-island	48	152
7109	Blackduck	blackduck	48	152
7110	Blomkest	blomkest	48	152
7111	Blooming Prairie	blooming-prairie	48	152
7112	Blue Earth	blue-earth	48	152
7113	Borup	borup	48	149
7114	Braham	braham	48	152
7115	Brainerd	brainerd	48	152
7116	Brandon	brandon	48	152
7117	Breckenridge	breckenridge	48	149
7118	Bricelyn	bricelyn	48	152
7119	Brimson	brimson	48	154
7120	Brooten	brooten	48	152
7121	Browerville	browerville	48	152
7122	Browns Valley	browns-valley	48	152
7123	Brownsdale	brownsdale	48	150
7124	Brownsville	brownsville	48	153
7125	Brownton	brownton	48	152
7126	Bruno	bruno	48	152
7127	Buffalo	buffalo	48	152
7128	Buhl	buhl	48	154
7129	Burnsville	burnsville	48	152
7130	Butterfield	butterfield	48	155
7131	Byron	byron	48	150
7132	Caledonia	caledonia	48	153
7133	Cambridge	cambridge	48	152
7134	Campbell	campbell	48	149
7135	Canby	canby	48	152
7136	Cannon Falls	cannon-falls	48	152
7137	Carlton	carlton	48	154
7138	Carver	carver	48	152
7139	Cass Lake	cass-lake	48	152
7140	Center City	center-city	48	152
7141	Champlin	champlin	48	152
7142	Chanhassen	chanhassen	48	152
7143	Chaska	chaska	48	152
7144	Chatfield	chatfield	48	150
7145	Chisago City	chisago-city	48	152
7146	Chisholm	chisholm	48	154
7147	Chokio	chokio	48	152
7148	Circle Pines	circle-pines	48	152
7149	Clara City	clara-city	48	152
7150	Clarissa	clarissa	48	152
7151	Clarkfield	clarkfield	48	152
7152	Clear Lake	clear-lake	48	152
7153	Clearbrook	clearbrook	48	149
7154	Clearwater	clearwater	48	152
7155	Clements	clements	48	152
7156	Cleveland	cleveland	48	152
7157	Climax	climax	48	149
7158	Clinton	clinton	48	152
7159	Cloquet	cloquet	48	154
7160	Cohasset	cohasset	48	154
7161	Cokato	cokato	48	152
7162	Cold Spring	cold-spring	48	152
7163	Coleraine	coleraine	48	154
7164	Collegeville	collegeville	48	152
7165	Cologne	cologne	48	152
7166	Comfrey	comfrey	48	155
7167	Cook	cook	48	154
7168	Cosmos	cosmos	48	152
7169	Cottage Grove	cottage-grove	48	152
7170	Cottonwood	cottonwood	48	152
7171	Cromwell	cromwell	48	154
7172	Crookston	crookston	48	149
7173	Crosby	crosby	48	152
7174	Cyrus	cyrus	48	152
7175	Dakota	dakota	48	153
7176	Danube	danube	48	152
7177	Darwin	darwin	48	152
7178	Dassel	dassel	48	152
7179	Dawson	dawson	48	152
7180	Dayton	dayton	48	152
7181	Deer River	deer-river	48	154
7182	Delano	delano	48	152
7183	Detroit Lakes	detroit-lakes	48	149
7184	Dilworth	dilworth	48	149
7185	Dodge Center	dodge-center	48	150
7186	Dover	dover	48	150
7187	Duluth	duluth	48	154
7188	Eagle Bend	eagle-bend	48	152
7189	Eagle Lake	eagle-lake	48	155
7190	East Grand Forks	east-grand-forks	48	149
7191	Easton	easton	48	152
7192	Echo	echo	48	152
7193	Eden Prairie	eden-prairie	48	152
7194	Eden Valley	eden-valley	48	152
7195	Edgerton	edgerton	48	151
7196	Eitzen	eitzen	48	153
7197	Elbow Lake	elbow-lake	48	152
7198	Elgin	elgin	48	152
7199	Elk River	elk-river	48	152
7200	Ellsworth	ellsworth	48	151
7201	Ely	ely	48	154
7202	Elysian	elysian	48	152
7203	Emily	emily	48	152
7204	Erskine	erskine	48	149
7205	Esko	esko	48	154
7206	Evansville	evansville	48	152
7207	Eveleth	eveleth	48	154
7208	Excelsior	excelsior	48	152
7209	Fairfax	fairfax	48	152
7210	Fairmont	fairmont	48	155
7211	Faribault	faribault	48	152
7212	Farmington	farmington	48	152
7213	Fergus Falls	fergus-falls	48	149
7214	Fertile	fertile	48	149
7215	Finlayson	finlayson	48	152
7216	Fisher	fisher	48	149
7217	Floodwood	floodwood	48	154
7218	Foley	foley	48	152
7219	Forest Lake	forest-lake	48	152
7220	Fosston	fosston	48	149
7221	Franklin	franklin	48	152
7222	Frazee	frazee	48	149
7223	Freeborn	freeborn	48	150
7224	Fulda	fulda	48	151
7225	Garfield	garfield	48	152
7226	Gaylord	gaylord	48	152
7227	Gibbon	gibbon	48	152
7228	Gilbert	gilbert	48	154
7229	Glencoe	glencoe	48	152
7230	Glenville	glenville	48	150
7231	Glenwood	glenwood	48	152
7232	Glyndon	glyndon	48	149
7233	Good Thunder	good-thunder	48	155
7234	Goodhue	goodhue	48	152
7235	Goodridge	goodridge	48	149
7236	Graceville	graceville	48	152
7237	Granada	granada	48	155
7238	Grand Marais	grand-marais	48	154
7239	Grand Meadow	grand-meadow	48	150
7240	Grand Rapids	grand-rapids	48	154
7241	Grandy	grandy	48	152
7242	Granite Falls	granite-falls	48	152
7243	Greenbush	greenbush	48	149
7244	Grey Eagle	grey-eagle	48	152
7245	Grove City	grove-city	48	152
7246	Grygla	grygla	48	149
7247	Hackensack	hackensack	48	152
7248	Hallock	hallock	48	149
7249	Halstad	halstad	48	149
7250	Hancock	hancock	48	152
7251	Hanska	hanska	48	155
7252	Harmony	harmony	48	150
7253	Hastings	hastings	48	152
7254	Hawley	hawley	48	149
7255	Hayfield	hayfield	48	150
7256	Hector	hector	48	152
7257	Henderson	henderson	48	152
7258	Henning	henning	48	149
7259	Herman	herman	48	152
7260	Heron Lake	heron-lake	48	152
7261	Hewitt	hewitt	48	152
7262	Hibbing	hibbing	48	154
7263	Hill City	hill-city	48	152
7264	Hills	hills	48	151
7265	Hinckley	hinckley	48	152
7266	Hoffman	hoffman	48	152
7267	Holdingford	holdingford	48	152
7268	Hopkins	hopkins	48	152
7269	Houston	houston	48	153
7270	Howard Lake	howard-lake	48	152
7271	Hoyt Lakes	hoyt-lakes	48	154
7272	Hugo	hugo	48	152
7273	Hutchinson	hutchinson	48	152
7274	International Falls	international-falls	48	154
7275	Inver Grove Heights	inver-grove-heights	48	152
7276	Ironton	ironton	48	152
7277	Isanti	isanti	48	152
7278	Isle	isle	48	152
7279	Ivanhoe	ivanhoe	48	151
7280	Jackson	jackson	48	152
7281	Janesville	janesville	48	152
7282	Jeffers	jeffers	48	152
7283	Jordan	jordan	48	152
7284	Kandiyohi	kandiyohi	48	152
7285	Karlstad	karlstad	48	149
7286	Kasota	kasota	48	152
7287	Kasson	kasson	48	150
7288	Keewatin	keewatin	48	154
7289	Kelliher	kelliher	48	152
7290	Kenyon	kenyon	48	152
7291	Kerkhoven	kerkhoven	48	152
7292	Kettle River	kettle-river	48	154
7293	Kiester	kiester	48	152
7294	Kimball	kimball	48	152
7295	Knife River	knife-river	48	154
7296	La Crescent	la-crescent	48	153
7297	Lafayette	lafayette	48	152
7298	Lake Benton	lake-benton	48	151
7299	Lake City	lake-city	48	152
7300	Lake Crystal	lake-crystal	48	155
7301	Lake Elmo	lake-elmo	48	152
7302	Lake Lillian	lake-lillian	48	152
7303	Lake Park	lake-park	48	149
7304	Lakefield	lakefield	48	152
7305	Lakeville	lakeville	48	152
7306	Lamberton	lamberton	48	152
7307	Lancaster	lancaster	48	149
7308	Laporte	laporte	48	152
7309	Le Center	le-center	48	152
7310	Le Roy	le-roy	48	150
7311	Le Sueur	le-sueur	48	152
7312	Leonard	leonard	48	149
7313	Lester Prairie	lester-prairie	48	152
7314	Lewiston	lewiston	48	153
7315	Lewisville	lewisville	48	155
7316	Lindstrom	lindstrom	48	152
7317	Litchfield	litchfield	48	152
7318	Little Falls	little-falls	48	152
7319	Littlefork	littlefork	48	154
7320	Long Lake	long-lake	48	152
7321	Long Prairie	long-prairie	48	152
7322	Longville	longville	48	152
7323	Lonsdale	lonsdale	48	152
7324	Loretto	loretto	48	152
7325	Luverne	luverne	48	151
7326	Lyle	lyle	48	150
7327	Lynd	lynd	48	152
7328	Mabel	mabel	48	150
7329	Madelia	madelia	48	155
7330	Madison	madison	48	152
7331	Magnolia	magnolia	48	151
7332	Mahnomen	mahnomen	48	149
7333	Mankato	mankato	48	155
7334	Mantorville	mantorville	48	150
7335	Maple Lake	maple-lake	48	152
7336	Maple Plain	maple-plain	48	152
7337	Mapleton	mapleton	48	155
7338	Marshall	marshall	48	152
7339	Maynard	maynard	48	152
7340	Mazeppa	mazeppa	48	152
7341	McGregor	mcgregor	48	152
7342	McIntosh	mcintosh	48	149
7343	Meadowlands	meadowlands	48	154
7344	Medford	medford	48	152
7345	Melrose	melrose	48	152
7346	Menahga	menahga	48	152
7347	Mentor	mentor	48	149
7348	Middle River	middle-river	48	149
7349	Milaca	milaca	48	152
7350	Milan	milan	48	152
7351	Millville	millville	48	152
7352	Milroy	milroy	48	152
7353	Minneapolis	minneapolis	48	152
7354	Minneota	minneota	48	152
7355	Minnesota Lake	minnesota-lake	48	152
7356	Minnetonka	minnetonka	48	152
7357	Montevideo	montevideo	48	152
7358	Montgomery	montgomery	48	152
7359	Monticello	monticello	48	152
7360	Montrose	montrose	48	152
7361	Moorhead	moorhead	48	149
7362	Moose Lake	moose-lake	48	154
7363	Mora	mora	48	152
7364	Morgan	morgan	48	152
7365	Morris	morris	48	152
7366	Morristown	morristown	48	152
7367	Motley	motley	48	152
7368	Mound	mound	48	152
7369	Mountain Iron	mountain-iron	48	154
7370	Mountain Lake	mountain-lake	48	152
7371	Nashua	nashua	48	149
7372	Nashwauk	nashwauk	48	154
7373	Nevis	nevis	48	152
7374	New London	new-london	48	152
7375	New Prague	new-prague	48	152
7376	New Richland	new-richland	48	152
7377	New Ulm	new-ulm	48	155
7378	New York Mills	new-york-mills	48	149
7379	Newfolden	newfolden	48	149
7380	Newport	newport	48	152
7381	Nicollet	nicollet	48	152
7382	North Branch	north-branch	48	152
7383	Northfield	northfield	48	152
7384	Northome	northome	48	154
7385	Norwood Young America	norwood-young-america	48	152
7386	Odin	odin	48	155
7387	Ogilvie	ogilvie	48	152
7388	Okabena	okabena	48	152
7389	Oklee	oklee	48	149
7390	Olivia	olivia	48	152
7391	Onamia	onamia	48	152
7392	Ortonville	ortonville	48	152
7393	Osakis	osakis	48	152
7394	Oslo	oslo	48	149
7395	Osseo	osseo	48	152
7396	Ottertail	ottertail	48	149
7397	Owatonna	owatonna	48	152
7398	Park Rapids	park-rapids	48	152
7399	Parkers Prairie	parkers-prairie	48	149
7400	Paynesville	paynesville	48	152
7401	Pelican Rapids	pelican-rapids	48	149
7402	Pennington	pennington	48	152
7403	Pequot Lakes	pequot-lakes	48	152
7404	Perham	perham	48	149
7405	Pierz	pierz	48	152
7406	Pillager	pillager	48	152
7407	Pine City	pine-city	48	152
7408	Pine Island	pine-island	48	152
7409	Pine River	pine-river	48	152
7410	Pipestone	pipestone	48	151
7411	Plainview	plainview	48	152
7412	Plummer	plummer	48	149
7413	Preston	preston	48	150
7414	Princeton	princeton	48	152
7415	Prinsburg	prinsburg	48	152
7416	Prior Lake	prior-lake	48	152
7417	Randolph	randolph	48	152
7418	Raymond	raymond	48	152
7419	Red Lake Falls	red-lake-falls	48	149
7420	Red Wing	red-wing	48	152
7421	Red Lake	red-lake	48	152
7422	Redwood Falls	redwood-falls	48	152
7423	Remer	remer	48	152
7424	Renville	renville	48	152
7425	Rice	rice	48	152
7426	Richmond	richmond	48	152
7427	Rochester	rochester	48	150
7428	Rockford	rockford	48	152
7429	Rogers	rogers	48	152
7430	Rollingstone	rollingstone	48	153
7431	Roseau	roseau	48	149
7432	Rosemount	rosemount	48	152
7433	Rothsay	rothsay	48	149
7434	Round Lake	round-lake	48	151
7435	Royalton	royalton	48	152
7436	Rush City	rush-city	48	152
7437	Rushford	rushford	48	150
7438	Russell	russell	48	152
7439	Ruthton	ruthton	48	151
7440	Sacred Heart	sacred-heart	48	152
7441	Sanborn	sanborn	48	152
7442	Sandstone	sandstone	48	152
7443	Sartell	sartell	48	152
7444	Sauk Centre	sauk-centre	48	152
7445	Sauk Rapids	sauk-rapids	48	152
7446	Savage	savage	48	152
7447	Schroeder	schroeder	48	154
7448	Sebeka	sebeka	48	152
7449	Shakopee	shakopee	48	152
7450	Sherburn	sherburn	48	155
7451	Silver Bay	silver-bay	48	154
7452	Silver Lake	silver-lake	48	152
7453	Slayton	slayton	48	151
7454	Sleepy Eye	sleepy-eye	48	155
7455	South Haven	south-haven	48	152
7456	South Saint Paul	south-saint-paul	48	152
7457	Spicer	spicer	48	152
7458	Spring Grove	spring-grove	48	153
7459	Spring Park	spring-park	48	152
7460	Spring Valley	spring-valley	48	150
7461	Springfield	springfield	48	155
7462	Saint Bonifacius	saint-bonifacius	48	152
7463	Saint Charles	saint-charles	48	153
7464	Saint Clair	saint-clair	48	155
7465	Saint Cloud	saint-cloud	48	152
7466	Saint Francis	saint-francis	48	152
7467	Saint James	saint-james	48	155
7468	Saint Michael	saint-michael	48	152
7469	Saint Paul	saint-paul	48	152
7470	Saint Paul Park	saint-paul-park	48	152
7471	Saint Peter	saint-peter	48	152
7472	Stacy	stacy	48	152
7473	Staples	staples	48	152
7474	Starbuck	starbuck	48	152
7475	Stephen	stephen	48	149
7476	Stewart	stewart	48	152
7477	Stewartville	stewartville	48	150
7478	Stillwater	stillwater	48	152
7479	Sturgeon Lake	sturgeon-lake	48	152
7480	Swan River	swan-river	48	154
7481	Swanville	swanville	48	152
7482	Swift	swift	48	149
7483	Thief River Falls	thief-river-falls	48	149
7484	Tower	tower	48	154
7485	Tracy	tracy	48	152
7486	Trimont	trimont	48	155
7487	Truman	truman	48	155
7488	Twin Valley	twin-valley	48	149
7489	Two Harbors	two-harbors	48	154
7490	Tyler	tyler	48	151
7491	Ulen	ulen	48	149
7492	Underwood	underwood	48	149
7493	Upsala	upsala	48	152
7494	Vermillion	vermillion	48	152
7495	Verndale	verndale	48	152
7496	Vesta	vesta	48	152
7497	Victoria	victoria	48	152
7498	Virginia	virginia	48	154
7499	Wabasha	wabasha	48	152
7500	Wabasso	wabasso	48	152
7501	Waconia	waconia	48	152
7502	Wadena	wadena	48	152
7503	Waite Park	waite-park	48	152
7504	Walker	walker	48	152
7505	Walnut Grove	walnut-grove	48	152
7506	Waltham	waltham	48	150
7507	Wanamingo	wanamingo	48	152
7508	Warren	warren	48	149
7509	Warroad	warroad	48	149
7510	Waseca	waseca	48	152
7511	Watertown	watertown	48	152
7512	Waterville	waterville	48	152
7513	Waubun	waubun	48	149
7514	Waverly	waverly	48	152
7515	Wayzata	wayzata	48	152
7516	Welcome	welcome	48	155
7517	Wells	wells	48	152
7518	Westbrook	westbrook	48	152
7519	Wheaton	wheaton	48	152
7520	Willmar	willmar	48	152
7521	Willow River	willow-river	48	152
7522	Windom	windom	48	152
7523	Winnebago	winnebago	48	152
7524	Winona	winona	48	153
7525	Winsted	winsted	48	152
7526	Winthrop	winthrop	48	152
7527	Wolverton	wolverton	48	149
7528	Wood Lake	wood-lake	48	152
7529	Worthington	worthington	48	151
7530	Wrenshall	wrenshall	48	154
7531	Wright	wright	48	154
7532	Wykoff	wykoff	48	150
7533	Wyoming	wyoming	48	152
7534	Zimmerman	zimmerman	48	152
7535	Zumbrota	zumbrota	48	152
7536	Apple Valley	apple-valley	48	152
7537	Arden Hills	arden-hills	48	152
7538	Blaine	blaine	48	152
7539	Bloomington	bloomington	48	152
7540	Breezy Point	breezy-point	48	152
7541	Brooklyn Center	brooklyn-center	48	152
7542	Brooklyn Park	brooklyn-park	48	152
7543	Columbia Heights	columbia-heights	48	152
7544	Coon Rapids	coon-rapids	48	152
7545	Crosslake	crosslake	48	152
7546	Crystal	crystal	48	152
7547	Eagan	eagan	48	152
7548	Edina	edina	48	152
7549	Elko New Market	elko-new-market	48	152
7550	Falcon Heights	falcon-heights	48	152
7551	Fridley	fridley	48	152
7552	Golden Valley	golden-valley	48	152
7553	Ham Lake	ham-lake	48	152
7554	Hermantown	hermantown	48	154
7555	Lanesboro	lanesboro	48	150
7556	Lino Lakes	lino-lakes	48	152
7557	Mahtomedi	mahtomedi	48	152
7558	Maple Grove	maple-grove	48	152
7559	Maplewood	maplewood	48	152
7560	Mayer	mayer	48	152
7561	Medina	medina	48	152
7562	Mendota Heights	mendota-heights	48	152
7563	Minnetrista	minnetrista	48	152
7564	Mounds View	mounds-view	48	152
7565	New Brighton	new-brighton	48	152
7566	New Hope	new-hope	48	152
7567	North Saint Paul	north-saint-paul	48	152
7568	Oakdale	oakdale	48	152
7569	Orono	orono	48	152
7570	Oronoco	oronoco	48	150
7571	Otsego	otsego	48	152
7572	Plymouth	plymouth	48	152
7573	Ramsey	ramsey	48	152
7574	Richfield	richfield	48	152
7575	Robbinsdale	robbinsdale	48	152
7576	Roseville	roseville	48	152
7577	Shoreview	shoreview	48	152
7578	Shorewood	shorewood	48	152
7579	Spring Lake Park	spring-lake-park	48	152
7580	Saint Joseph	saint-joseph	48	152
7581	Saint Louis Park	saint-louis-park	48	152
7582	West Saint Paul	west-saint-paul	48	152
7583	White Bear Lake	white-bear-lake	48	152
7584	Woodbury	woodbury	48	152
7585	Adrian	adrian	17	156
7586	Advance	advance	17	157
7587	Agency	agency	17	158
7588	Albany	albany	17	156
7589	Alma	alma	17	156
7590	Altenburg	altenburg	17	157
7591	Alton	alton	17	159
7592	Amoret	amoret	17	156
7593	Anderson	anderson	17	160
7594	Annapolis	annapolis	17	161
7595	Appleton City	appleton-city	17	159
7596	Arbyrd	arbyrd	17	157
7597	Arcadia	arcadia	17	161
7598	Archie	archie	17	156
7599	Arnold	arnold	17	161
7600	Ash Grove	ash-grove	17	159
7601	Ashland	ashland	17	162
7602	Atlanta	atlanta	17	163
7603	Aurora	aurora	17	159
7604	Auxvasse	auxvasse	17	162
7605	Ava	ava	17	159
7606	Avilla	avilla	17	160
7607	Bakersfield	bakersfield	17	159
7608	Ballwin	ballwin	17	161
7609	Barnard	barnard	17	156
7610	Barnhart	barnhart	17	161
7611	Bates City	bates-city	17	156
7612	Beaufort	beaufort	17	161
7613	Bell City	bell-city	17	157
7614	Belle	belle	17	162
7615	Belleview	belleview	17	161
7616	Belton	belton	17	156
7617	Benton	benton	17	157
7618	Berger	berger	17	161
7619	Bernie	bernie	17	157
7620	Bethany	bethany	17	156
7621	Bevier	bevier	17	163
7622	Billings	billings	17	159
7623	Bismarck	bismarck	17	161
7624	Blackwater	blackwater	17	162
7625	Bland	bland	17	161
7626	Bloomfield	bloomfield	17	157
7627	Blue Eye	blue-eye	17	159
7628	Blue Springs	blue-springs	17	156
7629	Bolivar	bolivar	17	159
7630	Bonne Terre	bonne-terre	17	161
7631	Boonville	boonville	17	162
7632	Bosworth	bosworth	17	156
7633	Bourbon	bourbon	17	161
7634	Bowling Green	bowling-green	17	161
7635	Bradleyville	bradleyville	17	159
7636	Branson	branson	17	159
7637	Brashear	brashear	17	163
7638	Braymer	braymer	17	156
7639	Breckenridge	breckenridge	17	156
7640	Bridgeton	bridgeton	17	161
7641	Bronaugh	bronaugh	17	160
7642	Brookfield	brookfield	17	156
7643	Broseley	broseley	17	157
7644	Brunswick	brunswick	17	162
7645	Bucklin	bucklin	17	156
7646	Buffalo	buffalo	17	159
7647	Bunceton	bunceton	17	162
7648	Bunker	bunker	17	161
7649	Burlington Junction	burlington-junction	17	156
7650	Butler	butler	17	156
7651	Cabool	cabool	17	159
7652	Cadet	cadet	17	161
7653	Cainsville	cainsville	17	156
7654	Cairo	cairo	17	162
7655	Caledonia	caledonia	17	161
7656	Calhoun	calhoun	17	156
7657	California	california	17	162
7658	Callao	callao	17	163
7659	Camdenton	camdenton	17	159
7660	Cameron	cameron	17	156
7661	Campbell	campbell	17	157
7662	Canton	canton	17	164
7663	Cape Girardeau	cape-girardeau	17	157
7664	Cardwell	cardwell	17	157
7665	Carl Junction	carl-junction	17	160
7666	Carrollton	carrollton	17	156
7667	Carterville	carterville	17	160
7668	Carthage	carthage	17	160
7669	Caruthersville	caruthersville	17	157
7670	Cassville	cassville	17	159
7671	Cedar Hill	cedar-hill	17	161
7672	Centerview	centerview	17	156
7673	Centerville	centerville	17	161
7674	Centralia	centralia	17	162
7675	Chadwick	chadwick	17	159
7676	Chaffee	chaffee	17	157
7677	Chamois	chamois	17	162
7678	Charleston	charleston	17	157
7679	Chesterfield	chesterfield	17	161
7680	Chilhowee	chilhowee	17	156
7681	Chillicothe	chillicothe	17	156
7682	Chula	chula	17	156
7683	Clarksburg	clarksburg	17	162
7684	Clarksville	clarksville	17	161
7685	Clarkton	clarkton	17	157
7686	Cleveland	cleveland	17	156
7687	Clever	clever	17	159
7688	Climax Springs	climax-springs	17	159
7689	Clinton	clinton	17	156
7690	Cole Camp	cole-camp	17	159
7691	Columbia	columbia	17	162
7692	Conception	conception	17	156
7693	Conception Junction	conception-junction	17	156
7694	Concordia	concordia	17	156
7695	Conway	conway	17	159
7696	Cooter	cooter	17	157
7697	Corder	corder	17	156
7698	Cosby	cosby	17	158
7699	Craig	craig	17	156
7700	Crane	crane	17	159
7701	Creighton	creighton	17	156
7702	Crocker	crocker	17	159
7703	Crystal City	crystal-city	17	161
7704	Cuba	cuba	17	161
7705	Dadeville	dadeville	17	159
7706	De Kalb	de-kalb	17	158
7707	De Soto	de-soto	17	161
7708	Dearborn	dearborn	17	156
7709	Deepwater	deepwater	17	156
7710	Deering	deering	17	157
7711	Delta	delta	17	157
7712	Dexter	dexter	17	157
7713	Diamond	diamond	17	160
7714	Dittmer	dittmer	17	161
7715	Dixon	dixon	17	159
7716	Doniphan	doniphan	17	157
7717	Dora	dora	17	159
7718	Drexel	drexel	17	156
7719	Dudley	dudley	17	157
7720	Eagle Rock	eagle-rock	17	159
7721	Eagleville	eagleville	17	156
7722	Earth City	earth-city	17	161
7723	East Lynne	east-lynne	17	156
7724	East Prairie	east-prairie	17	157
7725	Edgar Springs	edgar-springs	17	161
7726	Edina	edina	17	164
7727	Edwards	edwards	17	159
7728	El Dorado Springs	el-dorado-springs	17	159
7729	Eldon	eldon	17	162
7730	Ellington	ellington	17	161
7731	Ellsinore	ellsinore	17	157
7732	Elsberry	elsberry	17	161
7733	Eminence	eminence	17	159
7734	Eolia	eolia	17	161
7735	Essex	essex	17	157
7736	Eugene	eugene	17	162
7737	Eureka	eureka	17	161
7738	Everton	everton	17	159
7739	Ewing	ewing	17	164
7740	Excelsior Springs	excelsior-springs	17	156
7741	Exeter	exeter	17	159
7742	Fair Grove	fair-grove	17	159
7743	Fair Play	fair-play	17	159
7744	Fairfax	fairfax	17	165
7745	Falcon	falcon	17	159
7746	Farber	farber	17	162
7747	Farmington	farmington	17	161
7748	Faucett	faucett	17	158
7749	Fayette	fayette	17	162
7750	Fenton	fenton	17	161
7751	Festus	festus	17	161
7752	Flemington	flemington	17	159
7753	Florissant	florissant	17	161
7754	Fordland	fordland	17	159
7755	Foristell	foristell	17	161
7756	Forsyth	forsyth	17	159
7757	Fredericktown	fredericktown	17	157
7758	Freeman	freeman	17	156
7759	Fort Leonard Wood	fort-leonard-wood	17	159
7760	Fulton	fulton	17	162
7761	Gainesville	gainesville	17	159
7762	Galena	galena	17	159
7763	Gallatin	gallatin	17	156
7764	Galt	galt	17	156
7765	Garden City	garden-city	17	156
7766	Gasconade	gasconade	17	161
7767	Gatewood	gatewood	17	157
7768	Gentry	gentry	17	156
7769	Gerald	gerald	17	161
7770	Gideon	gideon	17	157
7771	Gilman City	gilman-city	17	156
7772	Glasgow	glasgow	17	162
7773	Golden City	golden-city	17	160
7774	South Gorin	south-gorin	17	164
7775	Gower	gower	17	156
7776	Graham	graham	17	156
7777	Grain Valley	grain-valley	17	156
7778	Granby	granby	17	160
7779	Grandview	grandview	17	156
7780	Grant City	grant-city	17	156
7781	Green City	green-city	17	163
7782	Green Ridge	green-ridge	17	156
7783	Greenfield	greenfield	17	159
7784	Greenville	greenville	17	157
7785	Greenwood	greenwood	17	156
7786	Hale	hale	17	156
7787	Halfway	halfway	17	159
7788	Hallsville	hallsville	17	162
7789	Hamilton	hamilton	17	156
7790	Hannibal	hannibal	17	164
7791	Hardin	hardin	17	156
7792	Harrisburg	harrisburg	17	162
7793	Harrisonville	harrisonville	17	156
7794	Hartville	hartville	17	159
7795	Hawk Point	hawk-point	17	161
7796	Hayti	hayti	17	157
7797	Hazelwood	hazelwood	17	161
7798	Herculaneum	herculaneum	17	161
7799	Hermann	hermann	17	161
7800	Hermitage	hermitage	17	159
7801	Higbee	higbee	17	162
7802	Higginsville	higginsville	17	156
7803	High Ridge	high-ridge	17	161
7804	Hillsboro	hillsboro	17	161
7805	Holcomb	holcomb	17	157
7806	Holden	holden	17	156
7807	Holliday	holliday	17	164
7808	Hollister	hollister	17	159
7809	Holt	holt	17	156
7810	Holts Summit	holts-summit	17	162
7811	Hopkins	hopkins	17	156
7812	Hornersville	hornersville	17	157
7813	House Springs	house-springs	17	161
7814	Houston	houston	17	159
7815	Hughesville	hughesville	17	156
7816	Humansville	humansville	17	159
7817	Hume	hume	17	156
7818	Huntsville	huntsville	17	162
7819	Hurdland	hurdland	17	164
7820	Hurley	hurley	17	159
7821	Iberia	iberia	17	162
7822	Imperial	imperial	17	161
7823	Independence	independence	17	156
7824	Irondale	irondale	17	161
7825	Ironton	ironton	17	161
7826	Jackson	jackson	17	157
7827	Jameson	jameson	17	156
7828	Jamesport	jamesport	17	156
7829	Jamestown	jamestown	17	162
7830	Jasper	jasper	17	160
7831	Jefferson City	jefferson-city	17	162
7832	Joplin	joplin	17	160
7833	Kahoka	kahoka	17	164
7834	Kansas City	kansas-city	17	156
7835	Kearney	kearney	17	156
7836	Kennett	kennett	17	157
7837	Keytesville	keytesville	17	162
7838	Kimberling City	kimberling-city	17	159
7839	King City	king-city	17	156
7840	Kingdom City	kingdom-city	17	162
7841	Kingston	kingston	17	156
7842	Kingsville	kingsville	17	156
7843	Kirbyville	kirbyville	17	159
7844	Kirksville	kirksville	17	163
7845	Knob Noster	knob-noster	17	156
7846	Koshkonong	koshkonong	17	159
7847	La Belle	la-belle	17	164
7848	La Grange	la-grange	17	164
7849	La Monte	la-monte	17	156
7850	La Plata	la-plata	17	163
7851	Laddonia	laddonia	17	162
7852	Lake Ozark	lake-ozark	17	162
7853	Lake Saint Louis	lake-saint-louis	17	161
7854	Lamar	lamar	17	160
7855	Lancaster	lancaster	17	163
7856	Laquey	laquey	17	159
7857	Laredo	laredo	17	156
7858	Lathrop	lathrop	17	156
7859	Laurie	laurie	17	162
7860	Lawson	lawson	17	156
7861	Leadwood	leadwood	17	161
7862	Leasburg	leasburg	17	161
7863	Lebanon	lebanon	17	159
7864	Lee s Summit	lee-s-summit	17	156
7865	Leeton	leeton	17	156
7866	Leopold	leopold	17	157
7867	Lesterville	lesterville	17	161
7868	Lexington	lexington	17	156
7869	Liberal	liberal	17	160
7870	Liberty	liberty	17	156
7871	Licking	licking	17	159
7872	Lincoln	lincoln	17	159
7873	Linn	linn	17	162
7874	Linn Creek	linn-creek	17	159
7875	Linneus	linneus	17	156
7876	Lockwood	lockwood	17	159
7877	Lone Jack	lone-jack	17	156
7878	Lonedell	lonedell	17	161
7879	Louisiana	louisiana	17	161
7880	Ludlow	ludlow	17	156
7881	Macks Creek	macks-creek	17	159
7882	Macon	macon	17	163
7883	Madison	madison	17	164
7884	Maitland	maitland	17	156
7885	Malden	malden	17	157
7886	Malta Bend	malta-bend	17	156
7887	Mansfield	mansfield	17	159
7888	Marble Hill	marble-hill	17	157
7889	Marceline	marceline	17	156
7890	Marionville	marionville	17	159
7891	Marquand	marquand	17	157
7892	Marshall	marshall	17	156
7893	Marshfield	marshfield	17	159
7894	Marthasville	marthasville	17	161
7895	Martinsburg	martinsburg	17	162
7896	Maryland Heights	maryland-heights	17	161
7897	Maryville	maryville	17	156
7898	Maysville	maysville	17	158
7899	Meadville	meadville	17	156
7900	Memphis	memphis	17	164
7901	Mendon	mendon	17	162
7902	Mercer	mercer	17	156
7903	Mexico	mexico	17	162
7904	Miami	miami	17	156
7905	Milan	milan	17	163
7906	Miller	miller	17	159
7907	Missouri City	missouri-city	17	156
7908	Moberly	moberly	17	162
7909	Mokane	mokane	17	162
7910	Monett	monett	17	159
7911	Monroe City	monroe-city	17	164
7912	Montgomery City	montgomery-city	17	162
7913	Monticello	monticello	17	164
7914	Montrose	montrose	17	156
7915	Morrisville	morrisville	17	159
7916	Mound City	mound-city	17	156
7917	Mount Vernon	mount-vernon	17	159
7918	Mountain Grove	mountain-grove	17	159
7919	Mountain View	mountain-view	17	159
7920	Naylor	naylor	17	157
7921	Neelyville	neelyville	17	157
7922	Neosho	neosho	17	160
7923	Nevada	nevada	17	160
7924	New Bloomfield	new-bloomfield	17	162
7925	New Cambria	new-cambria	17	163
7926	New Franklin	new-franklin	17	162
7927	New Haven	new-haven	17	161
7928	New London	new-london	17	164
7929	New Madrid	new-madrid	17	157
7930	Newburg	newburg	17	161
7931	Newtown	newtown	17	163
7932	Niangua	niangua	17	159
7933	Nixa	nixa	17	159
7934	Noel	noel	17	160
7935	Norborne	norborne	17	156
7936	Norwood	norwood	17	159
7937	Novinger	novinger	17	163
7938	O Fallon	o-fallon	17	161
7939	Oak Grove	oak-grove	17	156
7940	Oak Ridge	oak-ridge	17	157
7941	Odessa	odessa	17	156
7942	Oran	oran	17	157
7943	Oregon	oregon	17	156
7944	Orrick	orrick	17	156
7945	Osage Beach	osage-beach	17	159
7946	Osborn	osborn	17	158
7947	Osceola	osceola	17	159
7948	Otterville	otterville	17	162
7949	Owensville	owensville	17	161
7950	Ozark	ozark	17	159
7951	Pacific	pacific	17	161
7952	Palmyra	palmyra	17	164
7953	Paris	paris	17	164
7954	Park Hills	park-hills	17	161
7955	Patton	patton	17	157
7956	Pattonsburg	pattonsburg	17	156
7957	Peace Valley	peace-valley	17	159
7958	Peculiar	peculiar	17	156
7959	Perry	perry	17	164
7960	Perryville	perryville	17	157
7961	Philadelphia	philadelphia	17	164
7962	Piedmont	piedmont	17	157
7963	Pierce City	pierce-city	17	159
7964	Pilot Grove	pilot-grove	17	162
7965	Pineville	pineville	17	160
7966	Pittsburg	pittsburg	17	159
7967	Plato	plato	17	159
7968	Platte City	platte-city	17	156
7969	Plattsburg	plattsburg	17	156
7970	Pleasant Hill	pleasant-hill	17	156
7971	Pleasant Hope	pleasant-hope	17	159
7972	Point Lookout	point-lookout	17	159
7973	Polo	polo	17	156
7974	Poplar Bluff	poplar-bluff	17	157
7975	Portageville	portageville	17	157
7976	Potosi	potosi	17	161
7977	Prairie Home	prairie-home	17	162
7978	Princeton	princeton	17	156
7979	Purdin	purdin	17	156
7980	Purdy	purdy	17	159
7981	Puxico	puxico	17	157
7982	Queen City	queen-city	17	163
7983	Ravenwood	ravenwood	17	156
7984	Raymondville	raymondville	17	159
7985	Raymore	raymore	17	156
7986	Reeds Spring	reeds-spring	17	159
7987	Renick	renick	17	162
7988	Republic	republic	17	159
7989	Revere	revere	17	164
7990	Rhineland	rhineland	17	162
7991	Rich Hill	rich-hill	17	156
7992	Richland	richland	17	159
7993	Richmond	richmond	17	156
7994	Richwoods	richwoods	17	161
7995	Ridgeway	ridgeway	17	156
7996	Risco	risco	17	157
7997	Riverside	riverside	17	156
7998	Rocheport	rocheport	17	162
7999	Rock Port	rock-port	17	165
8000	Rogersville	rogersville	17	159
8001	Rolla	rolla	17	161
8002	Roscoe	roscoe	17	159
8003	Rosendale	rosendale	17	158
8004	Russellville	russellville	17	162
8005	Ste. Genevieve	ste-genevieve	17	161
8006	Salem	salem	17	159
8007	Salisbury	salisbury	17	162
8008	Sarcoxie	sarcoxie	17	160
8009	Savannah	savannah	17	158
8010	Schell City	schell-city	17	160
8011	Scott City	scott-city	17	157
8012	Sedalia	sedalia	17	156
8013	Senath	senath	17	157
8014	Seneca	seneca	17	160
8015	Seymour	seymour	17	159
8016	Shelbina	shelbina	17	164
8017	Shelbyville	shelbyville	17	164
8018	Sheldon	sheldon	17	160
8019	Shell Knob	shell-knob	17	159
8020	Sikeston	sikeston	17	157
8021	Silex	silex	17	161
8022	Slater	slater	17	156
8023	Smithton	smithton	17	156
8024	Smithville	smithville	17	156
8025	Southwest City	southwest-city	17	160
8026	Sparta	sparta	17	159
8027	Spickard	spickard	17	156
8028	Spokane	spokane	17	159
8029	Springfield	springfield	17	159
8030	Saint Albans	saint-albans	17	161
8031	Saint Ann	saint-ann	17	161
8032	Saint Charles	saint-charles	17	161
8033	Saint Clair	saint-clair	17	161
8034	Saint Elizabeth	saint-elizabeth	17	162
8035	Saint James	saint-james	17	161
8036	Saint Joseph	saint-joseph	17	158
8037	St. Louis	st-louis	17	161
8038	St. Peters	st-peters	17	161
8039	Saint Robert	saint-robert	17	159
8040	Stanberry	stanberry	17	156
8041	Stanton	stanton	17	161
8042	Steele	steele	17	157
8043	Steelville	steelville	17	161
8044	Stet	stet	17	156
8045	Stewartsville	stewartsville	17	158
8046	Stockton	stockton	17	159
8047	Stoutland	stoutland	17	159
8048	Stover	stover	17	162
8049	Strafford	strafford	17	159
8050	Strasburg	strasburg	17	156
8051	Sturgeon	sturgeon	17	162
8052	Success	success	17	159
8053	Sullivan	sullivan	17	161
8054	Summersville	summersville	17	159
8055	Sunrise Beach	sunrise-beach	17	159
8056	Swedeborg	swedeborg	17	159
8057	Sweet Springs	sweet-springs	17	156
8058	Taneyville	taneyville	17	159
8059	Tarkio	tarkio	17	165
8060	Thayer	thayer	17	159
8061	Theodosia	theodosia	17	159
8062	Thornfield	thornfield	17	159
8063	Tiff City	tiff-city	17	160
8064	Tina	tina	17	156
8065	Tipton	tipton	17	162
8066	Trenton	trenton	17	156
8067	Trimble	trimble	17	156
8068	Troy	troy	17	161
8069	Tuscumbia	tuscumbia	17	162
8070	Union	union	17	161
8071	Union Star	union-star	17	158
8072	Unionville	unionville	17	163
8073	Urbana	urbana	17	159
8074	Valley Park	valley-park	17	161
8075	Van Buren	van-buren	17	157
8076	Vandalia	vandalia	17	162
8077	Vanzant	vanzant	17	159
8078	Verona	verona	17	159
8079	Versailles	versailles	17	162
8080	Viburnum	viburnum	17	161
8081	Vienna	vienna	17	162
8082	Walker	walker	17	160
8083	Walnut Grove	walnut-grove	17	159
8084	Wardell	wardell	17	157
8085	Warrensburg	warrensburg	17	156
8086	Warrenton	warrenton	17	161
8087	Warsaw	warsaw	17	159
8088	Washburn	washburn	17	159
8089	Washington	washington	17	161
8090	Waynesville	waynesville	17	159
8091	Weaubleau	weaubleau	17	159
8092	Webb City	webb-city	17	160
8093	Wellington	wellington	17	156
8094	Wellsville	wellsville	17	162
8095	Wentzville	wentzville	17	161
8096	West Plains	west-plains	17	159
8097	Weston	weston	17	156
8098	Westphalia	westphalia	17	162
8099	Wheatland	wheatland	17	159
8100	Wheaton	wheaton	17	159
8101	Whiteman Air Force Base	whiteman-air-force-base	17	156
8102	Willard	willard	17	159
8103	Willow Springs	willow-springs	17	159
8104	Windsor	windsor	17	156
8105	Winfield	winfield	17	161
8106	Winona	winona	17	159
8107	Winston	winston	17	156
8108	Wright City	wright-city	17	161
8109	Wyaconda	wyaconda	17	164
8110	Zalma	zalma	17	157
8111	Affton	affton	17	161
8112	Bellefontaine Neighbors	bellefontaine-neighbors	17	161
8113	Berkeley	berkeley	17	161
8114	Brentwood	brentwood	17	161
8115	Clayton	clayton	17	161
8116	Concord	concord	17	161
8117	Crestwood	crestwood	17	161
8118	Creve Coeur	creve-coeur	17	161
8119	Des Peres	des-peres	17	161
8120	Ferguson	ferguson	17	161
8121	Gladstone	gladstone	17	156
8122	Jennings	jennings	17	161
8123	Kirkwood	kirkwood	17	161
8124	Ladue	ladue	17	161
8125	Manchester	manchester	17	161
8126	Maplewood	maplewood	17	161
8127	Mehlville	mehlville	17	161
8128	Murphy	murphy	17	161
8129	Normandy	normandy	17	161
8130	North Kansas City	north-kansas-city	17	156
8131	Oakville	oakville	17	161
8132	Olivette	olivette	17	161
8133	Overland	overland	17	161
8134	Parkville	parkville	17	156
8135	Raytown	raytown	17	156
8136	Richmond Heights	richmond-heights	17	161
8137	Spanish Lake	spanish-lake	17	161
8138	Saint John	saint-john	17	161
8139	Sunset Hills	sunset-hills	17	161
8140	Town and Country	town-and-country	17	161
8141	University City	university-city	17	161
8142	Webster Groves	webster-groves	17	161
8143	Weldon Spring	weldon-spring	17	161
8144	Wildwood	wildwood	17	161
8145	Aberdeen	aberdeen	31	166
8146	Amory	amory	31	166
8147	Ashland	ashland	31	167
8148	Baldwyn	baldwyn	31	166
8149	Batesville	batesville	31	167
8150	Bay Saint Louis	bay-saint-louis	31	168
8151	Bay Springs	bay-springs	31	169
8152	Belzoni	belzoni	31	170
8153	Benoit	benoit	31	171
8154	Biloxi	biloxi	31	172
8155	Blue Mountain	blue-mountain	31	167
8156	Booneville	booneville	31	166
8157	Brandon	brandon	31	170
8158	Brookhaven	brookhaven	31	170
8159	Byhalia	byhalia	31	167
8160	Caledonia	caledonia	31	166
8161	Calhoun City	calhoun-city	31	166
8162	Canton	canton	31	170
8163	Carriere	carriere	31	168
8164	Carrollton	carrollton	31	171
8165	Carthage	carthage	31	170
8166	Centreville	centreville	31	173
8167	Charleston	charleston	31	171
8168	Clarksdale	clarksdale	31	167
8169	Cleveland	cleveland	31	171
8170	Clinton	clinton	31	170
8171	Coffeeville	coffeeville	31	166
8172	Collins	collins	31	169
8173	Columbia	columbia	31	169
8174	Columbus	columbus	31	166
8175	Conehatta	conehatta	31	174
8176	Corinth	corinth	31	167
8177	De Kalb	de-kalb	31	174
8178	Decatur	decatur	31	174
8179	Diamondhead	diamondhead	31	168
8180	Durant	durant	31	170
8181	Ecru	ecru	31	166
8182	Elliott	elliott	31	171
8183	Ellisville	ellisville	31	169
8184	Enterprise	enterprise	31	174
8185	Eupora	eupora	31	166
8186	Fayette	fayette	31	170
8187	Flowood	flowood	31	170
8188	Forest	forest	31	170
8189	Fulton	fulton	31	166
8190	Gautier	gautier	31	172
8191	Golden	golden	31	166
8192	Goodman	goodman	31	170
8193	Greenville	greenville	31	171
8194	Greenwood	greenwood	31	171
8195	Grenada	grenada	31	171
8196	Gulfport	gulfport	31	172
8197	Guntown	guntown	31	166
8198	Hamilton	hamilton	31	166
8199	Hattiesburg	hattiesburg	31	169
8200	Hazlehurst	hazlehurst	31	170
8201	Heidelberg	heidelberg	31	169
8202	Hernando	hernando	31	167
8203	Hollandale	hollandale	31	171
8204	Holly Springs	holly-springs	31	167
8205	Horn Lake	horn-lake	31	167
8206	New Houlka	new-houlka	31	166
8207	Houston	houston	31	166
8208	Hurley	hurley	31	172
8209	Indianola	indianola	31	171
8210	Inverness	inverness	31	171
8211	Itta Bena	itta-bena	31	171
8212	Iuka	iuka	31	166
8213	Jackson	jackson	31	170
8214	Kiln	kiln	31	168
8215	Kosciusko	kosciusko	31	170
8216	Lake	lake	31	170
8217	Lauderdale	lauderdale	31	174
8218	Laurel	laurel	31	169
8219	Leakesville	leakesville	31	175
8220	Leland	leland	31	171
8221	Lexington	lexington	31	170
8222	Liberty	liberty	31	173
8223	Long Beach	long-beach	31	172
8224	Louisville	louisville	31	166
8225	Lucedale	lucedale	31	175
8226	Lumberton	lumberton	31	169
8227	Maben	maben	31	166
8228	Macon	macon	31	166
8229	Madison	madison	31	170
8230	Magee	magee	31	170
8231	Magnolia	magnolia	31	170
8232	Marks	marks	31	167
8233	Mathiston	mathiston	31	166
8234	McCondy	mccondy	31	166
8235	McComb	mccomb	31	170
8236	Mendenhall	mendenhall	31	170
8237	Meridian	meridian	31	174
8238	Mississippi State University	mississippi-state-university	31	166
8239	Moorhead	moorhead	31	171
8240	Morton	morton	31	170
8241	Moss Point	moss-point	31	172
8242	Natchez	natchez	31	170
8243	New Albany	new-albany	31	166
8244	Ocean Springs	ocean-springs	31	172
8245	Okolona	okolona	31	166
8246	Olive Branch	olive-branch	31	167
8247	Osyka	osyka	31	170
8248	Oxford	oxford	31	167
8249	Pascagoula	pascagoula	31	172
8250	Pass Christian	pass-christian	31	172
8251	Pearlington	pearlington	31	168
8252	Perkinston	perkinston	31	172
8253	Philadelphia	philadelphia	31	174
8254	Picayune	picayune	31	168
8255	Pontotoc	pontotoc	31	166
8256	Poplarville	poplarville	31	168
8257	Port Gibson	port-gibson	31	170
8258	Prentiss	prentiss	31	170
8259	Purvis	purvis	31	169
8260	Quitman	quitman	31	174
8261	Raleigh	raleigh	31	170
8262	Raymond	raymond	31	170
8263	Richland	richland	31	170
8264	Richton	richton	31	169
8265	Ridgeland	ridgeland	31	170
8266	Rienzi	rienzi	31	167
8267	Ripley	ripley	31	167
8268	Rolling Fork	rolling-fork	31	170
8269	Scooba	scooba	31	174
8270	Senatobia	senatobia	31	167
8271	Shannon	shannon	31	166
8272	Soso	soso	31	169
8273	Southaven	southaven	31	167
8274	Star	star	31	170
8275	Starkville	starkville	31	166
8276	John C. Stennis Space Center	john-c-stennis-space-center	31	168
8277	Summit	summit	31	170
8278	Sunflower	sunflower	31	171
8279	Tunica	tunica	31	167
8280	Tupelo	tupelo	31	166
8281	Tylertown	tylertown	31	170
8282	Union	union	31	174
8283	Vicksburg	vicksburg	31	170
8284	Walls	walls	31	167
8285	Water Valley	water-valley	31	166
8286	Waveland	waveland	31	168
8287	Waynesboro	waynesboro	31	169
8288	Wesson	wesson	31	170
8289	West Point	west-point	31	166
8290	Wiggins	wiggins	31	172
8291	Winona	winona	31	166
8292	Yazoo City	yazoo-city	31	170
8293	Ackerman	ackerman	31	166
8294	Byram	byram	31	170
8295	Crystal Springs	crystal-springs	31	170
8296	D Iberville	d-iberville	31	172
8297	Florence	florence	31	170
8298	Meadville	meadville	31	170
8299	Pearl	pearl	31	170
8300	Petal	petal	31	169
8301	Vancleave	vancleave	31	172
8302	Absarokee	absarokee	38	176
8303	Anaconda	anaconda	38	177
8304	Arlee	arlee	38	178
8305	Ashland	ashland	38	176
8306	Augusta	augusta	38	179
8307	Bainville	bainville	38	180
8308	Baker	baker	38	180
8309	Belgrade	belgrade	38	177
8310	Belt	belt	38	181
8311	Big Sky	big-sky	38	177
8312	Big Timber	big-timber	38	176
8313	Bigfork	bigfork	38	178
8314	Billings	billings	38	176
8315	Black Eagle	black-eagle	38	181
8316	Boulder	boulder	38	177
8317	Box Elder	box-elder	38	181
8318	Bozeman	bozeman	38	177
8319	Bridger	bridger	38	176
8320	Broadus	broadus	38	176
8321	Brockton	brockton	38	180
8322	Browning	browning	38	181
8323	Busby	busby	38	176
8324	Butte	butte	38	177
8325	Cascade	cascade	38	181
8326	Chester	chester	38	181
8327	Chinook	chinook	38	181
8328	Choteau	choteau	38	181
8329	Circle	circle	38	180
8330	Clancy	clancy	38	177
8331	Colstrip	colstrip	38	176
8332	Columbia Falls	columbia-falls	38	178
8333	Columbus	columbus	38	176
8334	Conrad	conrad	38	181
8335	Corvallis	corvallis	38	178
8336	Crow Agency	crow-agency	38	176
8337	Culbertson	culbertson	38	180
8338	Cut Bank	cut-bank	38	181
8339	Darby	darby	38	178
8340	Deer Lodge	deer-lodge	38	177
8341	Dillon	dillon	38	177
8342	East Helena	east-helena	38	179
8343	Ekalaka	ekalaka	38	182
8344	Emigrant	emigrant	38	176
8345	Eureka	eureka	38	183
8346	Fairfield	fairfield	38	181
8347	Fairview	fairview	38	180
8348	Fallon	fallon	38	184
8349	Fishtail	fishtail	38	176
8350	Florence	florence	38	178
8351	Forsyth	forsyth	38	176
8352	Frenchtown	frenchtown	38	178
8353	Fromberg	fromberg	38	176
8354	Fort Benton	fort-benton	38	181
8355	Gardiner	gardiner	38	176
8356	Glasgow	glasgow	38	181
8357	Glendive	glendive	38	184
8358	Great Falls	great-falls	38	181
8359	Hamilton	hamilton	38	178
8360	Hardin	hardin	38	176
8361	Harlem	harlem	38	181
8362	Harlowton	harlowton	38	176
8363	Havre	havre	38	181
8364	Heart Butte	heart-butte	38	181
8365	Helena	helena	38	179
8366	Hungry Horse	hungry-horse	38	178
8367	Huntley	huntley	38	176
8368	Hysham	hysham	38	176
8369	Inverness	inverness	38	181
8370	Joliet	joliet	38	176
8371	Joplin	joplin	38	181
8372	Kalispell	kalispell	38	178
8373	Kila	kila	38	178
8374	Lakeside	lakeside	38	178
8375	Lame Deer	lame-deer	38	176
8376	Laurel	laurel	38	176
8377	Lewistown	lewistown	38	181
8378	Libby	libby	38	183
8379	Lincoln	lincoln	38	179
8380	Livingston	livingston	38	176
8381	Lodge Grass	lodge-grass	38	176
8382	Lolo	lolo	38	178
8383	Malmstrom Air Force Base	malmstrom-air-force-base	38	181
8384	Manhattan	manhattan	38	177
8385	Medicine Lake	medicine-lake	38	180
8386	Melstone	melstone	38	176
8387	Miles City	miles-city	38	176
8388	Missoula	missoula	38	178
8389	Moore	moore	38	181
8390	Opheim	opheim	38	181
8391	Ovando	ovando	38	177
8392	Pablo	pablo	38	178
8393	Paradise	paradise	38	178
8394	Philipsburg	philipsburg	38	178
8395	Plains	plains	38	178
8396	Plentywood	plentywood	38	180
8397	Polson	polson	38	178
8398	Poplar	poplar	38	180
8399	Pryor	pryor	38	176
8400	Rapelje	rapelje	38	176
8401	Red Lodge	red-lodge	38	176
8402	Reed Point	reed-point	38	176
8403	Rexford	rexford	38	183
8404	Ronan	ronan	38	178
8405	Roundup	roundup	38	176
8406	Roy	roy	38	181
8407	Rudyard	rudyard	38	181
8408	Saco	saco	38	181
8409	Sand Coulee	sand-coulee	38	181
8410	Scobey	scobey	38	181
8411	Shelby	shelby	38	181
8412	Shepherd	shepherd	38	176
8413	Sheridan	sheridan	38	177
8414	Sidney	sidney	38	180
8415	Saint Xavier	saint-xavier	38	176
8416	Stevensville	stevensville	38	178
8417	Superior	superior	38	178
8418	Terry	terry	38	184
8419	Thompson Falls	thompson-falls	38	178
8420	Three Forks	three-forks	38	177
8421	Townsend	townsend	38	179
8422	Trout Creek	trout-creek	38	178
8423	Turner	turner	38	181
8424	Twin Bridges	twin-bridges	38	177
8425	Victor	victor	38	178
8426	West Yellowstone	west-yellowstone	38	177
8427	Westby	westby	38	180
8428	White Sulphur Springs	white-sulphur-springs	38	176
8429	Whitefish	whitefish	38	178
8430	Whitehall	whitehall	38	177
8431	Wibaux	wibaux	38	180
8432	Willow Creek	willow-creek	38	177
8433	Wilsall	wilsall	38	176
8434	Winifred	winifred	38	181
8435	Winnett	winnett	38	176
8436	Wolf Point	wolf-point	38	180
8437	Zortman	zortman	38	181
8438	Ennis	ennis	38	177
8439	Aberdeen	aberdeen	6	185
8440	Advance	advance	6	186
8441	Ahoskie	ahoskie	6	187
8442	Albemarle	albemarle	6	188
8443	Alliance	alliance	6	189
8444	Andrews	andrews	6	190
8445	Angier	angier	6	185
8446	Apex	apex	6	185
8447	Arden	arden	6	191
8448	Asheboro	asheboro	6	186
8449	Asheville	asheville	6	191
8450	Atlantic Beach	atlantic-beach	6	189
8451	Aulander	aulander	6	189
8452	Aurora	aurora	6	189
8453	Avon	avon	6	187
8454	Aydlett	aydlett	6	187
8455	Bailey	bailey	6	185
8456	Bakersville	bakersville	6	191
8457	Banner Elk	banner-elk	6	188
8458	Barco	barco	6	187
8459	Barnardsville	barnardsville	6	191
8460	Bath	bath	6	189
8461	Bayboro	bayboro	6	189
8462	Beaufort	beaufort	6	189
8463	Belews Creek	belews-creek	6	186
8464	Belhaven	belhaven	6	189
8465	Belmont	belmont	6	188
8466	Benson	benson	6	185
8467	Bessemer City	bessemer-city	6	188
8468	Black Creek	black-creek	6	185
8469	Black Mountain	black-mountain	6	191
8470	Blanch	blanch	6	186
8471	Boiling Springs	boiling-springs	6	188
8472	Bolivia	bolivia	6	192
8473	Boone	boone	6	188
8474	Brasstown	brasstown	6	193
8475	Brevard	brevard	6	191
8476	Bridgeton	bridgeton	6	189
8477	Browns Summit	browns-summit	6	186
8478	Brunswick	brunswick	6	192
8479	Bryson City	bryson-city	6	191
8480	Buies Creek	buies-creek	6	185
8481	Bunn	bunn	6	185
8482	Burgaw	burgaw	6	192
8483	Burlington	burlington	6	186
8484	Burnsville	burnsville	6	191
8485	Butner	butner	6	185
8486	Buxton	buxton	6	187
8487	Calabash	calabash	6	192
8488	Camden	camden	6	187
8489	Cameron	cameron	6	185
8490	Candler	candler	6	191
8491	Canton	canton	6	191
8492	Carolina Beach	carolina-beach	6	192
8493	Carrboro	carrboro	6	185
8494	Carthage	carthage	6	185
8495	Cary	cary	6	185
8496	Cashiers	cashiers	6	191
8497	Castle Hayne	castle-hayne	6	192
8498	Catawba	catawba	6	188
8499	Cedar Falls	cedar-falls	6	186
8500	Cedar Island	cedar-island	6	189
8501	Chapel Hill	chapel-hill	6	185
8502	Charlotte	charlotte	6	188
8503	Cherokee	cherokee	6	191
8504	Marine Corps Air Station Cherry Point	marine-corps-air-station-cherry-point	6	189
8505	Cherryville	cherryville	6	188
8506	Chocowinity	chocowinity	6	189
8507	Claremont	claremont	6	188
8508	Clayton	clayton	6	185
8509	Clemmons	clemmons	6	186
8510	Cleveland	cleveland	6	188
8511	Climax	climax	6	186
8512	Clinton	clinton	6	185
8513	Clyde	clyde	6	191
8514	Coats	coats	6	185
8515	Colfax	colfax	6	186
8516	Columbia	columbia	6	189
8517	Columbus	columbus	6	191
8518	Concord	concord	6	188
8519	Conetoe	conetoe	6	185
8520	Conover	conover	6	188
8521	Cornelius	cornelius	6	188
8522	Corolla	corolla	6	187
8523	Cove City	cove-city	6	189
8524	Cramerton	cramerton	6	188
8525	Creedmoor	creedmoor	6	185
8526	Creston	creston	6	188
8527	Creswell	creswell	6	189
8528	Cullowhee	cullowhee	6	191
8529	Currituck	currituck	6	187
8530	Dallas	dallas	6	188
8531	Danbury	danbury	6	186
8532	Davidson	davidson	6	188
8533	Denver	denver	6	188
8534	Dobson	dobson	6	186
8535	Dublin	dublin	6	192
8536	Dudley	dudley	6	185
8537	Dunn	dunn	6	185
8538	Durham	durham	6	185
8539	Eagle Springs	eagle-springs	6	185
8540	East Spencer	east-spencer	6	188
8541	Eden	eden	6	186
8542	Edenton	edenton	6	187
8543	Efland	efland	6	185
8544	Elizabeth City	elizabeth-city	6	187
8545	Elizabethtown	elizabethtown	6	192
8546	Elkin	elkin	6	186
8547	Ellerbe	ellerbe	6	188
8548	Elm City	elm-city	6	185
8549	Elon	elon	6	186
8550	Emerald Isle	emerald-isle	6	189
8551	Enfield	enfield	6	185
8552	Engelhard	engelhard	6	189
8553	Ennice	ennice	6	186
8554	Erwin	erwin	6	185
8555	Everetts	everetts	6	189
8556	Fairfield	fairfield	6	189
8557	Fairmont	fairmont	6	194
8558	Fairview	fairview	6	191
8559	Farmville	farmville	6	189
8560	Fayetteville	fayetteville	6	185
8561	Flat Rock	flat-rock	6	191
8562	Fletcher	fletcher	6	191
8563	Forest City	forest-city	6	191
8564	Franklin	franklin	6	191
8565	Franklinton	franklinton	6	185
8566	Fort Bragg	fort-bragg	6	185
8567	Fuquay Varina	fuquay-varina	6	185
8568	Garner	garner	6	185
8569	Gastonia	gastonia	6	188
8570	Gates	gates	6	187
8571	Gatesville	gatesville	6	187
8572	Gibsonville	gibsonville	6	186
8573	Godwin	godwin	6	185
8574	Goldsboro	goldsboro	6	185
8575	Goldston	goldston	6	185
8576	Graham	graham	6	186
8577	Grandy	grandy	6	187
8578	Granite Falls	granite-falls	6	188
8579	Grantsboro	grantsboro	6	189
8580	Greensboro	greensboro	6	186
8581	Greenville	greenville	6	189
8582	Grover	grover	6	188
8583	Halifax	halifax	6	185
8584	Hamlet	hamlet	6	188
8585	Hampstead	hampstead	6	192
8586	Hamptonville	hamptonville	6	186
8587	Harbinger	harbinger	6	187
8588	Harkers Island	harkers-island	6	189
8589	Harrells	harrells	6	185
8590	Harrisburg	harrisburg	6	188
8591	Hatteras	hatteras	6	187
8592	Havelock	havelock	6	189
8593	Haw River	haw-river	6	186
8594	Hayesville	hayesville	6	193
8595	Henderson	henderson	6	185
8596	Hendersonville	hendersonville	6	191
8597	Hertford	hertford	6	187
8598	Hickory	hickory	6	188
8599	High Point	high-point	6	186
8600	Highlands	highlands	6	191
8601	Hildebran	hildebran	6	188
8602	Hillsborough	hillsborough	6	185
8603	Hoffman	hoffman	6	188
8604	Holly Ridge	holly-ridge	6	189
8605	Holly Springs	holly-springs	6	185
8606	Hope Mills	hope-mills	6	185
8607	Horse Shoe	horse-shoe	6	191
8608	Hudson	hudson	6	188
8609	Huntersville	huntersville	6	188
8610	Indian Trail	indian-trail	6	188
8611	Jackson	jackson	6	185
8612	Jackson Springs	jackson-springs	6	185
8613	Jacksonville	jacksonville	6	189
8614	Jamestown	jamestown	6	186
8615	Jefferson	jefferson	6	188
8616	Kannapolis	kannapolis	6	188
8617	Kenansville	kenansville	6	189
8618	Kernersville	kernersville	6	186
8619	Kill Devil Hills	kill-devil-hills	6	187
8620	King	king	6	186
8621	Kings Mountain	kings-mountain	6	188
8622	Kinston	kinston	6	189
8623	Kittrell	kittrell	6	185
8624	Kitty Hawk	kitty-hawk	6	187
8625	Knightdale	knightdale	6	185
8626	Knotts Island	knotts-island	6	187
8627	Kure Beach	kure-beach	6	192
8628	La Grange	la-grange	6	189
8629	Lake Junaluska	lake-junaluska	6	191
8630	Lake Lure	lake-lure	6	191
8631	Lansing	lansing	6	188
8632	Lattimore	lattimore	6	188
8633	Laurinburg	laurinburg	6	194
8634	Lawndale	lawndale	6	188
8635	Leland	leland	6	192
8636	Lenoir	lenoir	6	188
8637	Lewisville	lewisville	6	186
8638	Lexington	lexington	6	186
8639	Lillington	lillington	6	185
8640	Lincolnton	lincolnton	6	188
8641	Littleton	littleton	6	185
8642	Louisburg	louisburg	6	185
8643	Lowell	lowell	6	188
8644	Lucama	lucama	6	185
8645	Lumberton	lumberton	6	194
8646	Madison	madison	6	186
8647	Maggie Valley	maggie-valley	6	191
8648	Maiden	maiden	6	188
8649	Manns Harbor	manns-harbor	6	187
8650	Manson	manson	6	185
8651	Manteo	manteo	6	187
8652	Maple	maple	6	187
8653	Marble	marble	6	190
8654	Marion	marion	6	191
8655	Mars Hill	mars-hill	6	191
8656	Marshall	marshall	6	191
8657	Marshville	marshville	6	188
8658	Matthews	matthews	6	188
8659	Maury	maury	6	189
8660	Maxton	maxton	6	194
8661	Mayodan	mayodan	6	186
8662	McLeansville	mcleansville	6	186
8663	McCain	mccain	6	185
8664	MCAS New River	mcas-new-river	6	189
8665	Mebane	mebane	6	186
8666	Middlesex	middlesex	6	185
8667	Midland	midland	6	188
8668	Mill Spring	mill-spring	6	191
8669	Misenheimer	misenheimer	6	188
8670	Mocksville	mocksville	6	186
8671	Monroe	monroe	6	188
8672	Mooresville	mooresville	6	188
8673	Morehead City	morehead-city	6	189
8674	Morganton	morganton	6	188
8675	Morrisville	morrisville	6	185
8676	Mount Airy	mount-airy	6	186
8677	Mount Gilead	mount-gilead	6	186
8678	Mount Holly	mount-holly	6	188
8679	Mount Olive	mount-olive	6	185
8680	Mount Pleasant	mount-pleasant	6	188
8681	Mount Ulla	mount-ulla	6	188
8682	Mountain Home	mountain-home	6	191
8683	Moyock	moyock	6	187
8684	Murfreesboro	murfreesboro	6	187
8685	Murphy	murphy	6	190
8686	Nags Head	nags-head	6	187
8687	Naples	naples	6	191
8688	Nashville	nashville	6	185
8689	Nebo	nebo	6	191
8690	New Bern	new-bern	6	189
8691	New London	new-london	6	188
8692	Newell	newell	6	188
8693	Newland	newland	6	188
8694	Newport	newport	6	189
8695	Newton	newton	6	188
8696	Newton Grove	newton-grove	6	185
8697	North Wilkesboro	north-wilkesboro	6	186
8698	Oak Island	oak-island	6	192
8699	Ocean Isle Beach	ocean-isle-beach	6	192
8700	Ocracoke	ocracoke	6	189
8701	Old Fort	old-fort	6	191
8702	Oriental	oriental	6	189
8703	Otto	otto	6	191
8704	Oxford	oxford	6	185
8705	Pantego	pantego	6	189
8706	Pembroke	pembroke	6	194
8707	Pfafftown	pfafftown	6	186
8708	Pilot Mountain	pilot-mountain	6	186
8709	Pine Hall	pine-hall	6	186
8710	Pinehurst	pinehurst	6	185
8711	Pinetops	pinetops	6	185
8712	Pinetown	pinetown	6	189
8713	Pineville	pineville	6	188
8714	Pisgah Forest	pisgah-forest	6	191
8715	Pittsboro	pittsboro	6	185
8716	Pleasant Garden	pleasant-garden	6	186
8717	Plymouth	plymouth	6	189
8718	Point Harbor	point-harbor	6	187
8719	Polkton	polkton	6	188
8720	Pollocksville	pollocksville	6	189
8721	Pope Field	pope-field	6	185
8722	Poplar Branch	poplar-branch	6	187
8723	Purlear	purlear	6	186
8724	Raeford	raeford	6	185
8725	Raleigh	raleigh	6	185
8726	Ramseur	ramseur	6	186
8727	Randleman	randleman	6	186
8728	Red Springs	red-springs	6	194
8729	Reidsville	reidsville	6	186
8730	Rex	rex	6	194
8731	Roanoke Rapids	roanoke-rapids	6	185
8732	Robbins	robbins	6	185
8733	Robbinsville	robbinsville	6	191
8734	Robersonville	robersonville	6	189
8735	Rockingham	rockingham	6	188
8736	Rocky Mount	rocky-mount	6	185
8737	Rocky Point	rocky-point	6	192
8738	Roduco	roduco	6	187
8739	Rose Hill	rose-hill	6	189
8740	Roseboro	roseboro	6	185
8741	Rosman	rosman	6	191
8742	Roxboro	roxboro	6	185
8743	Rural Hall	rural-hall	6	186
8744	Rutherford College	rutherford-college	6	188
8745	Rutherfordton	rutherfordton	6	191
8746	Salisbury	salisbury	6	188
8747	Saluda	saluda	6	191
8748	Sanford	sanford	6	185
8749	Scotland Neck	scotland-neck	6	185
8750	Selma	selma	6	185
8751	Shallotte	shallotte	6	192
8752	Shelby	shelby	6	188
8753	Siler City	siler-city	6	185
8754	Smithfield	smithfield	6	185
8755	Sneads Ferry	sneads-ferry	6	189
8756	Snow Hill	snow-hill	6	189
8757	Southern Pines	southern-pines	6	185
8758	Southport	southport	6	192
8759	Sparta	sparta	6	186
8760	Spindale	spindale	6	191
8761	Spring Hope	spring-hope	6	185
8762	Spring Lake	spring-lake	6	185
8763	Spruce Pine	spruce-pine	6	191
8764	Staley	staley	6	186
8765	Stanley	stanley	6	188
8766	Star	star	6	186
8767	Statesville	statesville	6	188
8768	Stoneville	stoneville	6	186
8769	Stony Point	stony-point	6	188
8770	Sunbury	sunbury	6	187
8771	Supply	supply	6	192
8772	Swannanoa	swannanoa	6	191
8773	Swan Quarter	swan-quarter	6	189
8774	Swansboro	swansboro	6	189
8775	Swepsonville	swepsonville	6	186
8776	Sylva	sylva	6	191
8777	Tabor City	tabor-city	6	192
8778	Tarboro	tarboro	6	185
8779	Township of Taylorsville	township-of-taylorsville	6	188
8780	Thomasville	thomasville	6	186
8781	Tillery	tillery	6	185
8782	Timberlake	timberlake	6	185
8783	Tobaccoville	tobaccoville	6	186
8784	Trenton	trenton	6	189
8785	Trinity	trinity	6	186
8786	Troutman	troutman	6	188
8787	Troy	troy	6	186
8788	Tryon	tryon	6	191
8789	Tyner	tyner	6	187
8790	Valdese	valdese	6	188
8791	Vale	vale	6	188
8792	Vanceboro	vanceboro	6	189
8793	Wadesboro	wadesboro	6	188
8794	Wagram	wagram	6	194
8795	Wake Forest	wake-forest	6	185
8796	Wallace	wallace	6	189
8797	Walnut Cove	walnut-cove	6	186
8798	Wanchese	wanchese	6	187
8799	Warrensville	warrensville	6	188
8800	Warrenton	warrenton	6	185
8801	Washington	washington	6	189
8802	Waxhaw	waxhaw	6	188
8803	Waynesville	waynesville	6	191
8804	Weaverville	weaverville	6	191
8805	Webster	webster	6	191
8806	Welcome	welcome	6	186
8807	Weldon	weldon	6	185
8808	Wendell	wendell	6	185
8809	Wentworth	wentworth	6	186
8810	West End	west-end	6	185
8811	West Jefferson	west-jefferson	6	188
8812	Whiteville	whiteville	6	192
8813	Whitsett	whitsett	6	186
8814	Whittier	whittier	6	191
8815	Wilkesboro	wilkesboro	6	186
8816	Willard	willard	6	192
8817	Williamston	williamston	6	189
8818	Willow Spring	willow-spring	6	185
8819	Wilmington	wilmington	6	192
8820	Wilson	wilson	6	185
8821	Windsor	windsor	6	189
8822	Winston-Salem	winston-salem	6	186
8823	Winterville	winterville	6	189
8824	Winton	winton	6	187
8825	Wrightsville Beach	wrightsville-beach	6	192
8826	Yadkinville	yadkinville	6	186
8827	Yanceyville	yanceyville	6	186
8828	Youngsville	youngsville	6	185
8829	Zebulon	zebulon	6	185
8830	Archdale	archdale	6	186
8831	Beulaville	beulaville	6	189
8832	Bladenboro	bladenboro	6	192
8833	Boiling Spring Lakes	boiling-spring-lakes	6	192
8834	Carolina Shores	carolina-shores	6	192
8835	China Grove	china-grove	6	188
8836	Crossnore	crossnore	6	188
8837	Denton	denton	6	186
8838	Duck	duck	6	187
8839	Fearrington	fearrington	6	185
8840	Holden Beach	holden-beach	6	192
8841	Holly Springs	holly-springs	6	185
8842	Liberty	liberty	6	186
8843	Locust	locust	6	188
8844	Marvin	marvin	6	188
8845	Mills River	mills-river	6	191
8846	Mint Hill	mint-hill	6	188
8847	North Topsail Beach	north-topsail-beach	6	189
8848	Oak Ridge	oak-ridge	6	186
8849	Oakboro	oakboro	6	188
8850	Richlands	richlands	6	189
8851	Rockfish	rockfish	6	185
8852	Rockwell	rockwell	6	188
8853	Saxapahaw	saxapahaw	6	186
8854	Seven Lakes	seven-lakes	6	185
8855	Stallings	stallings	6	188
8856	Summerfield	summerfield	6	186
8857	Sunset Beach	sunset-beach	6	192
8858	Surf City	surf-city	6	192
8859	Varnamtown	varnamtown	6	192
8860	Wallburg	wallburg	6	186
8861	Weddington	weddington	6	188
8862	Wesley Chapel	wesley-chapel	6	188
8863	Westport	westport	6	188
8864	Wingate	wingate	6	188
8865	Woodfin	woodfin	6	191
8866	Abercrombie	abercrombie	44	195
8867	Adams	adams	44	195
8868	Alexander	alexander	44	196
8869	Amidon	amidon	44	196
8870	Anamoose	anamoose	44	196
8871	Argusville	argusville	44	195
8872	Ashley	ashley	44	196
8873	Baldwin	baldwin	44	196
8874	Bantry	bantry	44	196
8875	Barney	barney	44	195
8876	Beach	beach	44	196
8877	Belcourt	belcourt	44	196
8878	Belfield	belfield	44	196
8879	Berthold	berthold	44	196
8880	Beulah	beulah	44	196
8881	Binford	binford	44	195
8882	Bisbee	bisbee	44	195
8883	Bismarck	bismarck	44	196
8884	Bottineau	bottineau	44	196
8885	Bowbells	bowbells	44	196
8886	Bowman	bowman	44	196
8887	Butte	butte	44	196
8888	Buxton	buxton	44	195
8889	Calvin	calvin	44	195
8890	Cando	cando	44	195
8891	Carrington	carrington	44	195
8892	Carson	carson	44	196
8893	Casselton	casselton	44	195
8894	Cavalier	cavalier	44	195
8895	Center	center	44	196
8896	Colfax	colfax	44	195
8897	Cooperstown	cooperstown	44	195
8898	Crosby	crosby	44	196
8899	Des Lacs	des-lacs	44	196
8900	Devils Lake	devils-lake	44	195
8901	Dickey	dickey	44	195
8902	Dickinson	dickinson	44	196
8903	Drake	drake	44	196
8904	Drayton	drayton	44	195
8905	Driscoll	driscoll	44	196
8906	Dunseith	dunseith	44	196
8907	Edgeley	edgeley	44	195
8908	Edinburg	edinburg	44	195
8909	Edmore	edmore	44	195
8910	Elgin	elgin	44	196
8911	Ellendale	ellendale	44	195
8912	Emerado	emerado	44	195
8913	Enderlin	enderlin	44	195
8914	Fairmount	fairmount	44	195
8915	Fargo	fargo	44	195
8916	Fessenden	fessenden	44	196
8917	Finley	finley	44	195
8918	Flasher	flasher	44	196
8919	Fordville	fordville	44	195
8920	Forman	forman	44	195
8921	Fort Totten	fort-totten	44	195
8922	Fort Yates	fort-yates	44	196
8923	Gackle	gackle	44	196
8924	Garrison	garrison	44	196
8925	Glen Ullin	glen-ullin	44	196
8926	Glenburn	glenburn	44	196
8927	Golden Valley	golden-valley	44	196
8928	Goodrich	goodrich	44	196
8929	Grafton	grafton	44	195
8930	Grand Forks	grand-forks	44	195
8931	Grand Forks Air Force Base	grand-forks-air-force-base	44	195
8932	Granville	granville	44	196
8933	Grenora	grenora	44	196
8934	Gwinner	gwinner	44	195
8935	Halliday	halliday	44	196
8936	Hankinson	hankinson	44	195
8937	Harvey	harvey	44	196
8938	Hatton	hatton	44	195
8939	Hazelton	hazelton	44	196
8940	Hazen	hazen	44	196
8941	Hebron	hebron	44	196
8942	Hettinger	hettinger	44	196
8943	Hillsboro	hillsboro	44	195
8944	Hoople	hoople	44	195
8945	Hope	hope	44	195
8946	Hunter	hunter	44	195
8947	Inkster	inkster	44	195
8948	Jamestown	jamestown	44	195
8949	Kenmare	kenmare	44	196
8950	Kensal	kensal	44	195
8951	Killdeer	killdeer	44	196
8952	Kindred	kindred	44	195
8953	Kulm	kulm	44	195
8954	Lakota	lakota	44	195
8955	LaMoure	lamoure	44	195
8956	Langdon	langdon	44	195
8957	Larimore	larimore	44	195
8958	Leeds	leeds	44	195
8959	Lehr	lehr	44	196
8960	Lidgerwood	lidgerwood	44	195
8961	Lignite	lignite	44	196
8962	Linton	linton	44	196
8963	Lisbon	lisbon	44	195
8964	Litchville	litchville	44	195
8965	Maddock	maddock	44	195
8966	Makoti	makoti	44	196
8967	Mandan	mandan	44	196
8968	Mandaree	mandaree	44	196
8969	Manning	manning	44	196
8970	Manvel	manvel	44	195
8971	Marion	marion	44	195
8972	Max	max	44	196
8973	Mayville	mayville	44	195
8974	McClusky	mcclusky	44	196
8975	McHenry	mchenry	44	195
8976	McKenzie	mckenzie	44	196
8977	McVille	mcville	44	195
8978	Medina	medina	44	195
8979	Medora	medora	44	196
8980	Menoken	menoken	44	196
8981	Mercer	mercer	44	196
8982	Milnor	milnor	44	195
8983	Milton	milton	44	195
8984	Minnewaukan	minnewaukan	44	195
8985	Minot	minot	44	196
8986	Minot Air Force Base	minot-air-force-base	44	196
8987	Minto	minto	44	195
8988	Mohall	mohall	44	196
8989	Montpelier	montpelier	44	195
8990	Mott	mott	44	196
8991	Munich	munich	44	195
8992	Napoleon	napoleon	44	196
8993	Neche	neche	44	195
8994	New England	new-england	44	196
8995	New Rockford	new-rockford	44	195
8996	New Salem	new-salem	44	196
8997	New Town	new-town	44	196
8998	Newburg	newburg	44	196
8999	Noonan	noonan	44	196
9000	Northwood	northwood	44	195
9001	Oakes	oakes	44	195
9002	Oriska	oriska	44	195
9003	Osnabrock	osnabrock	44	195
9004	Page	page	44	195
9005	Park River	park-river	44	195
9006	Parshall	parshall	44	196
9007	Pembina	pembina	44	195
9008	Pingree	pingree	44	195
9009	Plaza	plaza	44	196
9010	Portal	portal	44	196
9011	Powers Lake	powers-lake	44	196
9012	Ray	ray	44	196
9013	Regent	regent	44	196
9014	Rhame	rhame	44	196
9015	Richardton	richardton	44	196
9016	Rocklake	rocklake	44	195
9017	Rogers	rogers	44	195
9018	Rolette	rolette	44	196
9019	Rolla	rolla	44	196
9020	Roseglen	roseglen	44	196
9021	Rugby	rugby	44	196
9022	Sawyer	sawyer	44	196
9023	Scranton	scranton	44	196
9024	Selfridge	selfridge	44	196
9025	Sherwood	sherwood	44	196
9026	Sheyenne	sheyenne	44	195
9027	Solen	solen	44	196
9028	South Heart	south-heart	44	196
9029	Saint John	saint-john	44	196
9030	Saint Thomas	saint-thomas	44	195
9031	Stanley	stanley	44	196
9032	Stanton	stanton	44	196
9033	Starkweather	starkweather	44	195
9034	Steele	steele	44	196
9035	Strasburg	strasburg	44	196
9036	Surrey	surrey	44	196
9037	Sykeston	sykeston	44	196
9038	Tappen	tappen	44	196
9039	Taylor	taylor	44	196
9040	Thompson	thompson	44	195
9041	Tioga	tioga	44	196
9042	Tower City	tower-city	44	195
9043	Towner	towner	44	196
9044	Turtle Lake	turtle-lake	44	196
9045	Tuttle	tuttle	44	196
9046	Underwood	underwood	44	196
9047	Upham	upham	44	196
9048	Valley City	valley-city	44	195
9049	Velva	velva	44	196
9050	Verona	verona	44	195
9051	Wahpeton	wahpeton	44	195
9052	Walhalla	walhalla	44	195
9053	Warwick	warwick	44	195
9054	Washburn	washburn	44	196
9055	Watford City	watford-city	44	196
9056	West Fargo	west-fargo	44	195
9057	Westhope	westhope	44	196
9058	Wildrose	wildrose	44	196
9059	Williston	williston	44	196
9060	Willow City	willow-city	44	196
9061	Wilton	wilton	44	196
9062	Wimbledon	wimbledon	44	195
9063	Wing	wing	44	196
9064	Wishek	wishek	44	196
9065	Wolford	wolford	44	196
9066	Wyndmere	wyndmere	44	195
9067	Zeeland	zeeland	44	196
9068	Ainsworth	ainsworth	46	197
9069	Albion	albion	46	197
9070	Alda	alda	46	197
9071	Allen	allen	46	198
9072	Alliance	alliance	46	199
9073	Alma	alma	46	197
9074	Amherst	amherst	46	197
9075	Arapahoe	arapahoe	46	197
9076	Arcadia	arcadia	46	197
9077	Arnold	arnold	46	197
9078	Arthur	arthur	46	199
9079	Atkinson	atkinson	46	197
9080	Auburn	auburn	46	200
9081	Aurora	aurora	46	197
9082	Axtell	axtell	46	197
9083	Bartlett	bartlett	46	197
9084	Bassett	bassett	46	197
9085	Battle Creek	battle-creek	46	198
9086	Beatrice	beatrice	46	197
9087	Beaver City	beaver-city	46	197
9088	Bellevue	bellevue	46	200
9089	Benkelman	benkelman	46	199
9090	Bertrand	bertrand	46	197
9091	Big Springs	big-springs	46	199
9092	Blair	blair	46	200
9093	Bloomfield	bloomfield	46	198
9094	Blue Hill	blue-hill	46	197
9095	Boys Town	boys-town	46	200
9096	Brewster	brewster	46	197
9097	Bridgeport	bridgeport	46	199
9098	Broken Bow	broken-bow	46	197
9099	Burwell	burwell	46	197
9100	Butte	butte	46	197
9101	Cairo	cairo	46	197
9102	Cambridge	cambridge	46	197
9103	Cedar Rapids	cedar-rapids	46	197
9104	Central City	central-city	46	197
9105	Ceresco	ceresco	46	200
9106	Chadron	chadron	46	199
9107	Chambers	chambers	46	197
9108	Chappell	chappell	46	199
9109	Clay Center	clay-center	46	197
9110	Coleridge	coleridge	46	198
9111	Columbus	columbus	46	200
9112	Cozad	cozad	46	197
9113	Creighton	creighton	46	198
9114	Crete	crete	46	197
9115	Crofton	crofton	46	198
9116	Curtis	curtis	46	197
9117	Dakota City	dakota-city	46	198
9118	Dalton	dalton	46	199
9119	David City	david-city	46	197
9120	Deshler	deshler	46	197
9121	Diller	diller	46	197
9122	Dodge	dodge	46	200
9123	Doniphan	doniphan	46	197
9124	Duncan	duncan	46	200
9125	Dunning	dunning	46	197
9126	Eagle	eagle	46	200
9127	Elba	elba	46	197
9128	Elm Creek	elm-creek	46	197
9129	Elwood	elwood	46	197
9130	Eustis	eustis	46	197
9131	Exeter	exeter	46	197
9132	Fairbury	fairbury	46	197
9133	Fairmont	fairmont	46	197
9134	Falls City	falls-city	46	200
9135	Franklin	franklin	46	197
9136	Fremont	fremont	46	200
9137	Fort Calhoun	fort-calhoun	46	200
9138	Fullerton	fullerton	46	197
9139	Geneva	geneva	46	197
9140	Genoa	genoa	46	197
9141	Gering	gering	46	201
9142	Gibbon	gibbon	46	197
9143	Gordon	gordon	46	199
9144	Gothenburg	gothenburg	46	197
9145	Grand Island	grand-island	46	197
9146	Grant	grant	46	197
9147	Greeley	greeley	46	197
9148	Gretna	gretna	46	200
9149	Harrisburg	harrisburg	46	199
9150	Harrison	harrison	46	199
9151	Hartington	hartington	46	198
9152	Hastings	hastings	46	197
9153	Hay Springs	hay-springs	46	199
9154	Hayes Center	hayes-center	46	197
9155	Hebron	hebron	46	197
9156	Hemingford	hemingford	46	199
9157	Henderson	henderson	46	197
9158	Hershey	hershey	46	202
9159	Holdrege	holdrege	46	197
9160	Hooper	hooper	46	200
9161	Howells	howells	46	200
9162	Humboldt	humboldt	46	200
9163	Humphrey	humphrey	46	200
9164	Hyannis	hyannis	46	199
9165	Imperial	imperial	46	197
9166	Jackson	jackson	46	198
9167	Kearney	kearney	46	197
9168	Keystone	keystone	46	202
9169	Kimball	kimball	46	199
9170	La Vista	la-vista	46	200
9171	Laurel	laurel	46	198
9172	Lewiston	lewiston	46	197
9173	Lexington	lexington	46	197
9174	Lincoln	lincoln	46	197
9175	Litchfield	litchfield	46	197
9176	Long Pine	long-pine	46	197
9177	Loup City	loup-city	46	197
9178	Lynch	lynch	46	197
9179	Madison	madison	46	198
9180	Malcolm	malcolm	46	197
9181	McCook	mccook	46	197
9182	Merna	merna	46	197
9183	Milford	milford	46	197
9184	Minden	minden	46	197
9185	Mitchell	mitchell	46	201
9186	Mullen	mullen	46	199
9187	Murdock	murdock	46	200
9188	Murray	murray	46	200
9189	Nebraska City	nebraska-city	46	200
9190	Neligh	neligh	46	197
9191	Nelson	nelson	46	197
9192	Newman Grove	newman-grove	46	198
9193	Norfolk	norfolk	46	198
9194	North Platte	north-platte	46	202
9195	Oakland	oakland	46	200
9196	Offutt Air Force Base	offutt-air-force-base	46	200
9197	Ogallala	ogallala	46	202
9198	Ohiowa	ohiowa	46	197
9199	Omaha	omaha	46	200
9200	O Neill	o-neill	46	197
9201	Ord	ord	46	197
9202	Osceola	osceola	46	197
9203	Oshkosh	oshkosh	46	199
9204	Osmond	osmond	46	198
9205	Overton	overton	46	197
9206	Oxford	oxford	46	197
9207	Papillion	papillion	46	200
9208	Pawnee City	pawnee-city	46	197
9209	Pender	pender	46	198
9210	Peru	peru	46	200
9211	Petersburg	petersburg	46	197
9212	Pierce	pierce	46	198
9213	Plainview	plainview	46	198
9214	Plattsmouth	plattsmouth	46	200
9215	Pleasanton	pleasanton	46	197
9216	Ponca	ponca	46	198
9217	Prague	prague	46	200
9218	Randolph	randolph	46	198
9219	Ravenna	ravenna	46	197
9220	Red Cloud	red-cloud	46	197
9221	Republican City	republican-city	46	197
9222	Rushville	rushville	46	199
9223	Schuyler	schuyler	46	200
9224	Scotia	scotia	46	197
9225	Scottsbluff	scottsbluff	46	201
9226	Seward	seward	46	197
9227	Shelby	shelby	46	197
9228	Shelton	shelton	46	197
9229	Sidney	sidney	46	199
9230	Silver Creek	silver-creek	46	197
9231	Snyder	snyder	46	200
9232	South Sioux City	south-sioux-city	46	198
9233	Spalding	spalding	46	197
9234	Spencer	spencer	46	197
9235	Springfield	springfield	46	200
9236	Springview	springview	46	197
9237	Saint Edward	saint-edward	46	197
9238	Saint Paul	saint-paul	46	197
9239	Stanton	stanton	46	198
9240	Stapleton	stapleton	46	202
9241	Sterling	sterling	46	200
9242	Stockville	stockville	46	197
9243	Strang	strang	46	197
9244	Stuart	stuart	46	197
9245	Superior	superior	46	197
9246	Sutherland	sutherland	46	202
9247	Syracuse	syracuse	46	200
9248	Taylor	taylor	46	197
9249	Tecumseh	tecumseh	46	200
9250	Tekamah	tekamah	46	200
9251	Thedford	thedford	46	203
9252	Tilden	tilden	46	198
9253	Trenton	trenton	46	197
9254	Tryon	tryon	46	202
9255	Valentine	valentine	46	203
9256	Valley	valley	46	200
9257	Wahoo	wahoo	46	200
9258	Wakefield	wakefield	46	198
9259	Waterloo	waterloo	46	200
9260	Wausa	wausa	46	198
9261	Waverly	waverly	46	197
9262	Wayne	wayne	46	198
9263	Weeping Water	weeping-water	46	200
9264	West Point	west-point	46	200
9265	Wilber	wilber	46	197
9266	Wilcox	wilcox	46	197
9267	Winnebago	winnebago	46	198
9268	Wisner	wisner	46	200
9269	Wolbach	wolbach	46	197
9270	Wood River	wood-river	46	197
9271	Wymore	wymore	46	197
9272	York	york	46	197
9273	Chalco	chalco	46	200
9274	Walthill	walthill	46	198
9275	Alstead	alstead	15	204
9276	Alton	alton	15	204
9277	Amherst	amherst	15	204
9278	Andover	andover	15	204
9279	Ashland	ashland	15	205
9280	Atkinson	atkinson	15	204
9281	Auburn	auburn	15	204
9282	Barnstead	barnstead	15	204
9283	Barrington	barrington	15	204
9284	Bartlett	bartlett	15	206
9285	Bedford	bedford	15	204
9286	Belmont	belmont	15	204
9287	Bennington	bennington	15	204
9288	Berlin	berlin	15	206
9289	Bethlehem	bethlehem	15	205
9290	Bow	bow	15	204
9291	Bradford	bradford	15	204
9292	Brookline	brookline	15	204
9293	Campton	campton	15	205
9294	Canaan	canaan	15	205
9295	Candia	candia	15	204
9296	Canterbury	canterbury	15	204
9297	Center Harbor	center-harbor	15	204
9298	Chester	chester	15	204
9299	Chesterfield	chesterfield	15	204
9300	Chichester	chichester	15	204
9301	Claremont	claremont	15	205
9302	Colebrook	colebrook	15	206
9303	Concord	concord	15	204
9304	Cornish	cornish	15	205
9305	Danbury	danbury	15	204
9306	Danville	danville	15	204
9307	Deerfield	deerfield	15	204
9308	Dover	dover	15	204
9309	Dublin	dublin	15	204
9310	Dunbarton	dunbarton	15	204
9311	Durham	durham	15	204
9312	East Kingston	east-kingston	15	204
9313	Epping	epping	15	204
9314	Epsom	epsom	15	204
9315	Errol	errol	15	206
9316	Fitzwilliam	fitzwilliam	15	204
9317	Francestown	francestown	15	204
9318	Franconia	franconia	15	205
9319	Franklin	franklin	15	204
9320	Fremont	fremont	15	204
9321	Gilford	gilford	15	204
9322	Gilsum	gilsum	15	204
9323	Goffstown	goffstown	15	204
9324	Grafton	grafton	15	205
9325	Grantham	grantham	15	205
9326	Greenfield	greenfield	15	204
9327	Greenland	greenland	15	204
9328	Hampstead	hampstead	15	204
9329	Hampton	hampton	15	204
9330	Hampton Falls	hampton-falls	15	204
9331	Hancock	hancock	15	204
9332	Harrisville	harrisville	15	204
9333	Haverhill	haverhill	15	205
9334	Hill	hill	15	204
9335	Hillsboro	hillsboro	15	204
9336	Hinsdale	hinsdale	15	204
9337	Holderness	holderness	15	205
9338	Hollis	hollis	15	204
9339	Jackson	jackson	15	206
9340	Jefferson	jefferson	15	206
9341	Keene	keene	15	204
9342	Kingston	kingston	15	204
9343	Laconia	laconia	15	204
9344	Lebanon	lebanon	15	205
9345	Lempster	lempster	15	205
9346	Lincoln	lincoln	15	205
9347	Litchfield	litchfield	15	204
9348	Loudon	loudon	15	204
9349	Lyme	lyme	15	205
9350	Lyndeborough	lyndeborough	15	204
9351	Madison	madison	15	206
9352	Manchester	manchester	15	204
9353	Marlborough	marlborough	15	204
9354	Marlow	marlow	15	204
9355	Meriden	meriden	15	205
9356	Merrimack	merrimack	15	204
9357	Milan	milan	15	206
9358	Milton	milton	15	204
9359	Monroe	monroe	15	205
9360	Mont Vernon	mont-vernon	15	204
9361	Moultonborough	moultonborough	15	206
9362	Nashua	nashua	15	204
9363	New Boston	new-boston	15	204
9364	New Castle	new-castle	15	204
9365	New Durham	new-durham	15	204
9366	New Hampton	new-hampton	15	204
9367	New Ipswich	new-ipswich	15	204
9368	New London	new-london	15	204
9369	Newbury	newbury	15	204
9370	Newfields	newfields	15	204
9371	North Conway	north-conway	15	206
9372	North Hampton	north-hampton	15	204
9373	Northwood	northwood	15	204
9374	Nottingham	nottingham	15	204
9375	Orford	orford	15	205
9376	Ossipee	ossipee	15	206
9377	Pelham	pelham	15	204
9378	Piermont	piermont	15	205
9379	Pittsburg	pittsburg	15	206
9380	Plainfield	plainfield	15	205
9381	Plaistow	plaistow	15	204
9382	Portsmouth	portsmouth	15	204
9383	Raymond	raymond	15	204
9384	Rindge	rindge	15	204
9385	Rochester	rochester	15	204
9386	Rollinsford	rollinsford	15	204
9387	Rumney	rumney	15	205
9388	Rye	rye	15	204
9389	Salem	salem	15	204
9390	Sanbornton	sanbornton	15	204
9391	Seabrook	seabrook	15	204
9392	Somersworth	somersworth	15	204
9393	Stoddard	stoddard	15	204
9394	Strafford	strafford	15	204
9395	Stratham	stratham	15	204
9396	Sullivan	sullivan	15	204
9397	Sunapee	sunapee	15	205
9398	Suncook	suncook	15	204
9399	Swanzey	swanzey	15	204
9400	Tamworth	tamworth	15	206
9401	Temple	temple	15	204
9402	Tilton	tilton	15	204
9403	Troy	troy	15	204
9404	Walpole	walpole	15	204
9405	Warner	warner	15	204
9406	Warren	warren	15	205
9407	Waterville Valley	waterville-valley	15	205
9408	Weare	weare	15	204
9409	Westmoreland	westmoreland	15	204
9410	Wilmot	wilmot	15	204
9411	Windham	windham	15	204
9412	Wolfeboro	wolfeboro	15	206
9413	Woodstock	woodstock	15	205
9414	Brentwood	brentwood	15	204
9415	Charlestown	charlestown	15	205
9416	Conway	conway	15	206
9417	Derry	derry	15	204
9418	Exeter	exeter	15	204
9419	Farmington	farmington	15	204
9420	Freedom	freedom	15	206
9421	Hanover	hanover	15	205
9422	Henniker	henniker	15	204
9423	Hooksett	hooksett	15	204
9424	Hopkinton	hopkinton	15	204
9425	Hudson	hudson	15	204
9426	Jaffrey	jaffrey	15	204
9427	Lancaster	lancaster	15	206
9428	Littleton	littleton	15	205
9429	Londonderry	londonderry	15	204
9430	Meredith	meredith	15	204
9431	Milford	milford	15	204
9432	Newmarket	newmarket	15	204
9433	Newport	newport	15	205
9434	Newton	newton	15	204
9435	Peterborough	peterborough	15	204
9436	Plymouth	plymouth	15	205
9437	Salisbury	salisbury	15	204
9438	Wakefield	wakefield	15	206
9439	Wilton	wilton	15	204
9440	Absecon	absecon	50	207
9441	Allamuchy Township	allamuchy-township	50	208
9442	Allendale	allendale	50	208
9443	Allenhurst	allenhurst	50	208
9444	Allentown	allentown	50	208
9445	Alpine	alpine	50	208
9446	Andover	andover	50	208
9447	Asbury	asbury	50	208
9448	Asbury Park	asbury-park	50	208
9449	Atco	atco	50	207
9450	Atlantic City	atlantic-city	50	207
9451	Atlantic Highlands	atlantic-highlands	50	208
9452	Audubon	audubon	50	207
9453	Avalon	avalon	50	207
9454	Avon-by-the-Sea	avon-by-the-sea	50	208
9455	Barrington	barrington	50	207
9456	Bayonne	bayonne	50	208
9457	Beach Haven	beach-haven	50	208
9458	Beachwood	beachwood	50	208
9459	Bedminster Township	bedminster-township	50	208
9460	Belleville	belleville	50	208
9461	Bellmawr	bellmawr	50	207
9462	Belmar	belmar	50	208
9463	Belvidere	belvidere	50	208
9464	Bergenfield	bergenfield	50	208
9465	Berkeley Heights	berkeley-heights	50	208
9466	Berlin	berlin	50	207
9467	Bernardsville	bernardsville	50	208
9468	Beverly	beverly	50	207
9469	Blairstown	blairstown	50	208
9470	Bloomfield	bloomfield	50	208
9471	Bloomingdale	bloomingdale	50	208
9472	Bloomsbury	bloomsbury	50	208
9473	Bogota	bogota	50	208
9474	Boonton	boonton	50	208
9475	Bordentown	bordentown	50	207
9476	Bound Brook	bound-brook	50	208
9477	Bradley Beach	bradley-beach	50	208
9478	Branchville	branchville	50	208
9479	Brick	brick	50	208
9480	Bridgeton	bridgeton	50	207
9481	Bridgewater	bridgewater	50	208
9482	Brielle	brielle	50	208
9483	Brigantine	brigantine	50	207
9484	Broadway	broadway	50	208
9485	Buena	buena	50	207
9486	Burlington	burlington	50	207
9487	Butler	butler	50	208
9488	White	white	50	208
9489	Caldwell	caldwell	50	208
9490	Califon	califon	50	208
9491	Camden	camden	50	207
9492	Cape May	cape-may	50	207
9493	Carlstadt	carlstadt	50	208
9494	Carteret	carteret	50	208
9495	Cedar Grove	cedar-grove	50	208
9496	Chatham	chatham	50	208
9497	Cherry Hill	cherry-hill	50	207
9498	Chester	chester	50	208
9499	Clark	clark	50	208
9500	Clarksboro	clarksboro	50	207
9501	Clayton	clayton	50	207
9502	Clementon	clementon	50	207
9503	Cliffside Park	cliffside-park	50	208
9504	Clifton	clifton	50	208
9505	Clinton	clinton	50	208
9506	Closter	closter	50	208
9507	Collingswood	collingswood	50	207
9508	Colts Neck	colts-neck	50	208
9509	Columbia	columbia	50	208
9510	Cranford	cranford	50	208
9511	Cresskill	cresskill	50	208
9512	Deal	deal	50	208
9513	Demarest	demarest	50	208
9514	Denville	denville	50	208
9515	Dover	dover	50	208
9516	Dumont	dumont	50	208
9517	Dunellen	dunellen	50	208
9518	East Brunswick	east-brunswick	50	208
9519	East Hanover	east-hanover	50	208
9520	East Orange	east-orange	50	208
9521	East Rutherford	east-rutherford	50	208
9522	Eatontown	eatontown	50	208
9523	Edgewater	edgewater	50	208
9524	Edison	edison	50	208
9525	Egg Harbor City	egg-harbor-city	50	207
9526	Egg Harbor Township	egg-harbor-township	50	207
9527	Elizabeth	elizabeth	50	208
9528	Elmer	elmer	50	207
9529	Elmwood Park	elmwood-park	50	208
9530	Emerson	emerson	50	208
9531	Englewood	englewood	50	208
9532	Englewood Cliffs	englewood-cliffs	50	208
9533	Englishtown	englishtown	50	208
9534	Essex Fells	essex-fells	50	208
9535	Estell Manor	estell-manor	50	207
9536	Fair Haven	fair-haven	50	208
9537	Fair Lawn	fair-lawn	50	208
9538	Fairfield	fairfield	50	208
9539	Fairview	fairview	50	208
9540	Fanwood	fanwood	50	208
9541	Far Hills	far-hills	50	208
9542	Farmingdale	farmingdale	50	208
9543	Flemington	flemington	50	208
9544	Florence Township	florence-township	50	207
9545	Florham Park	florham-park	50	208
9546	Franklin	franklin	50	208
9547	Franklin Lakes	franklin-lakes	50	208
9548	Freehold	freehold	50	208
9549	Frenchtown	frenchtown	50	208
9550	Fort Lee	fort-lee	50	208
9551	Fort Monmouth	fort-monmouth	50	208
9552	Garfield	garfield	50	208
9553	Garwood	garwood	50	208
9554	Gibbsboro	gibbsboro	50	207
9555	Gillette	gillette	50	208
9556	Peapack and Gladstone	peapack-and-gladstone	50	208
9557	Glassboro	glassboro	50	207
9558	Glen Gardner	glen-gardner	50	208
9559	Glen Ridge	glen-ridge	50	208
9560	Glen Rock	glen-rock	50	208
9561	Gloucester City	gloucester-city	50	207
9562	Greenwich	greenwich	50	207
9563	Hackensack	hackensack	50	208
9564	Hackettstown	hackettstown	50	208
9565	Haddon Heights	haddon-heights	50	207
9566	Haddonfield	haddonfield	50	207
9567	Hainesport	hainesport	50	207
9568	Haledon	haledon	50	208
9569	Hamburg	hamburg	50	208
9570	Hammonton	hammonton	50	207
9571	Hampton	hampton	50	208
9572	Harrington Park	harrington-park	50	208
9573	Harrison	harrison	50	208
9574	Hasbrouck Heights	hasbrouck-heights	50	208
9575	Haworth	haworth	50	208
9576	Hawthorne	hawthorne	50	208
9577	Hazlet	hazlet	50	208
9578	Helmetta	helmetta	50	208
9579	High Bridge	high-bridge	50	208
9580	Highland Park	highland-park	50	208
9581	Highlands	highlands	50	208
9582	Hightstown	hightstown	50	207
9583	Hillsborough Township	hillsborough-township	50	208
9584	Hillsdale	hillsdale	50	208
9585	Hillside	hillside	50	208
9586	Ho-Ho-Kus	ho-ho-kus	50	208
9587	Hoboken	hoboken	50	208
9588	Holmdel	holmdel	50	208
9589	Hopatcong	hopatcong	50	208
9590	Hope	hope	50	208
9591	Hopewell	hopewell	50	207
9592	Howell	howell	50	208
9593	Irvington	irvington	50	208
9594	Island Heights	island-heights	50	208
9595	Jackson	jackson	50	208
9596	Jersey City	jersey-city	50	208
9597	Keansburg	keansburg	50	208
9598	Kearny	kearny	50	208
9599	Kenilworth	kenilworth	50	208
9600	Keyport	keyport	50	208
9601	Lafayette Township	lafayette-township	50	208
9602	Lake Hopatcong	lake-hopatcong	50	208
9603	Lakehurst	lakehurst	50	208
9604	Lambertville	lambertville	50	208
9605	Lavallette	lavallette	50	208
9606	Lawnside	lawnside	50	207
9607	Lebanon	lebanon	50	208
9608	Leonia	leonia	50	208
9609	Lincoln Park	lincoln-park	50	208
9610	Linden	linden	50	208
9611	Linwood	linwood	50	207
9612	Little Falls	little-falls	50	208
9613	Little Ferry	little-ferry	50	208
9614	Little Silver	little-silver	50	208
9615	Livingston	livingston	50	208
9616	Lodi	lodi	50	208
9617	Long Branch	long-branch	50	208
9618	Longport	longport	50	207
9619	Lumberton	lumberton	50	207
9620	Lyndhurst	lyndhurst	50	208
9621	Madison	madison	50	208
9622	Magnolia	magnolia	50	207
9623	Mahwah	mahwah	50	208
9624	Manasquan	manasquan	50	208
9625	Mantua Township	mantua-township	50	207
9626	Manville	manville	50	208
9627	Maple Shade Township	maple-shade-township	50	207
9628	Maplewood	maplewood	50	208
9629	Margate City	margate-city	50	207
9630	Marlboro Township	marlboro-township	50	208
9631	Marmora	marmora	50	207
9632	Matawan	matawan	50	208
9633	Maywood	maywood	50	208
9634	Medford	medford	50	207
9635	Mendham	mendham	50	208
9636	Merchantville	merchantville	50	207
9637	Metuchen	metuchen	50	208
9638	Mickleton	mickleton	50	207
9639	Middlesex	middlesex	50	208
9640	Middletown	middletown	50	208
9641	Midland Park	midland-park	50	208
9642	Milford	milford	50	208
9643	Millburn	millburn	50	208
9644	Milltown	milltown	50	208
9645	Millville	millville	50	207
9646	Mine Hill Township	mine-hill-township	50	208
9647	Monroe Township	monroe-township	50	208
9648	Montague Township	montague-township	50	208
9649	Montclair	montclair	50	208
9650	Montvale	montvale	50	208
9651	Montville	montville	50	208
9652	Moonachie	moonachie	50	208
9653	Moorestown	moorestown	50	207
9654	Morris Plains	morris-plains	50	208
9655	Morristown	morristown	50	208
9656	Mount Arlington	mount-arlington	50	208
9657	Mount Ephraim	mount-ephraim	50	207
9658	Mount Holly	mount-holly	50	207
9659	Mount Laurel	mount-laurel	50	207
9660	Mountain Lakes	mountain-lakes	50	208
9661	Mountainside	mountainside	50	208
9662	National Park	national-park	50	207
9663	Neptune City	neptune-city	50	208
9664	Netcong	netcong	50	208
9665	New Brunswick	new-brunswick	50	208
9666	New Milford	new-milford	50	208
9667	New Providence	new-providence	50	208
9668	New Vernon	new-vernon	50	208
9669	Newark	newark	50	208
9670	Newfield	newfield	50	207
9671	Newton	newton	50	208
9672	North Arlington	north-arlington	50	208
9673	North Bergen	north-bergen	50	208
9674	North Brunswick Township	north-brunswick-township	50	208
9675	Northfield	northfield	50	207
9676	Northvale	northvale	50	208
9677	Norwood	norwood	50	208
9678	Nutley	nutley	50	208
9679	Oakland	oakland	50	208
9680	Oaklyn	oaklyn	50	207
9681	Ocean City	ocean-city	50	207
9682	Oceanport	oceanport	50	208
9683	Ogdensburg	ogdensburg	50	208
9684	Oradell	oradell	50	208
9685	City of Orange	city-of-orange	50	208
9686	Palisades Park	palisades-park	50	208
9687	Palmyra	palmyra	50	207
9688	Paramus	paramus	50	208
9689	Park Ridge	park-ridge	50	208
9690	Parsippany-Troy Hills	parsippany-troy-hills	50	208
9691	Passaic	passaic	50	208
9692	Paterson	paterson	50	208
9693	Paulsboro	paulsboro	50	207
9694	Pedricktown	pedricktown	50	207
9695	Pemberton	pemberton	50	207
9696	Pennington	pennington	50	207
9697	Penns Grove	penns-grove	50	207
9698	Pennsauken Township	pennsauken-township	50	207
9699	Pequannock Township	pequannock-township	50	208
9700	Perth Amboy	perth-amboy	50	208
9701	Phillipsburg	phillipsburg	50	208
9702	Picatinny Arsenal	picatinny-arsenal	50	208
9703	Piscataway Township	piscataway-township	50	208
9704	Pitman	pitman	50	207
9705	Plainfield	plainfield	50	208
9706	Plainsboro Township	plainsboro-township	50	208
9707	Pleasantville	pleasantville	50	207
9708	Point Pleasant Beach	point-pleasant-beach	50	208
9709	Pompton Lakes	pompton-lakes	50	208
9710	Port Republic	port-republic	50	207
9711	Princeton	princeton	50	207
9712	Quinton	quinton	50	207
9713	Rahway	rahway	50	208
9714	Ramsey	ramsey	50	208
9715	Randolph	randolph	50	208
9716	Raritan	raritan	50	208
9717	Readington Township	readington-township	50	208
9718	Red Bank	red-bank	50	208
9719	Ridgefield	ridgefield	50	208
9720	Ridgefield Park	ridgefield-park	50	208
9721	Ridgewood	ridgewood	50	208
9722	Ringwood	ringwood	50	208
9723	River Edge	river-edge	50	208
9724	Riverdale	riverdale	50	208
9725	Riverside	riverside	50	207
9726	Riverton	riverton	50	207
9727	Rochelle Park	rochelle-park	50	208
9728	Rockaway	rockaway	50	208
9729	Rocky Hill	rocky-hill	50	208
9730	Roosevelt	roosevelt	50	208
9731	Roseland	roseland	50	208
9732	Roselle	roselle	50	208
9733	Roselle Park	roselle-park	50	208
9734	Rumson	rumson	50	208
9735	Runnemede	runnemede	50	207
9736	Rutherford	rutherford	50	208
9737	Saddle Brook	saddle-brook	50	208
9738	Saddle River	saddle-river	50	208
9739	Salem	salem	50	207
9740	Sayreville	sayreville	50	208
9741	Scotch Plains	scotch-plains	50	208
9742	Sea Girt	sea-girt	50	208
9743	Sea Isle City	sea-isle-city	50	207
9744	Seaside Heights	seaside-heights	50	208
9745	Seaside Park	seaside-park	50	208
9746	Secaucus	secaucus	50	208
9747	Shrewsbury	shrewsbury	50	208
9748	Somerdale	somerdale	50	207
9749	Somers Point	somers-point	50	207
9750	Somerville	somerville	50	208
9751	South Amboy	south-amboy	50	208
9752	South Bound Brook	south-bound-brook	50	208
9753	South Hackensack	south-hackensack	50	208
9754	South Orange	south-orange	50	208
9755	South Plainfield	south-plainfield	50	208
9756	South River	south-river	50	208
9757	Sparta Township	sparta-township	50	208
9758	Spotswood	spotswood	50	208
9759	Spring Lake	spring-lake	50	208
9760	Springfield Township	springfield-township	50	208
9761	Stanhope	stanhope	50	208
9762	Stewartsville	stewartsville	50	208
9763	Stillwater Township	stillwater-township	50	208
9764	Stockton	stockton	50	208
9765	Stone Harbor	stone-harbor	50	207
9766	Stratford	stratford	50	207
9767	Summit	summit	50	208
9768	Sussex	sussex	50	208
9769	Swedesboro	swedesboro	50	207
9770	Teaneck	teaneck	50	208
9771	Tenafly	tenafly	50	208
9772	Teterboro	teterboro	50	208
9773	Toms River	toms-river	50	208
9774	Totowa	totowa	50	208
9775	Trenton	trenton	50	207
9776	Tuckerton	tuckerton	50	208
9777	Union	union	50	208
9778	Union City	union-city	50	208
9779	Ventnor City	ventnor-city	50	207
9780	Vernon Township	vernon-township	50	208
9781	Verona	verona	50	208
9782	Vineland	vineland	50	207
9783	Voorhees Township	voorhees-township	50	207
9784	Waldwick	waldwick	50	208
9785	Wallington	wallington	50	208
9786	Walpack Township	walpack-township	50	208
9787	Wanaque	wanaque	50	208
9788	Warren	warren	50	208
9789	Washington	washington	50	208
9790	Watchung	watchung	50	208
9791	Wayne	wayne	50	208
9792	Weehawken	weehawken	50	208
9793	West Long Branch	west-long-branch	50	208
9794	West Milford	west-milford	50	208
9795	West New York	west-new-york	50	208
9796	West Orange	west-orange	50	208
9797	Westfield	westfield	50	208
9798	Westville	westville	50	207
9799	Westwood	westwood	50	208
9800	Wharton	wharton	50	208
9801	Wildwood	wildwood	50	207
9802	Willingboro	willingboro	50	207
9803	Windsor	windsor	50	207
9804	Wood-Ridge	wood-ridge	50	208
9805	Woodbine	woodbine	50	207
9806	Woodbury	woodbury	50	207
9807	Woodbury Heights	woodbury-heights	50	207
9808	Woodcliff Lake	woodcliff-lake	50	208
9809	Woodstown	woodstown	50	207
9810	Wrightstown	wrightstown	50	207
9811	Wyckoff	wyckoff	50	208
9812	Aberdeen Township	aberdeen-township	50	208
9813	Alexandria	alexandria	50	208
9814	Andover Township	andover-township	50	208
9815	Barnegat Township	barnegat-township	50	208
9816	Berkeley Township	berkeley-township	50	208
9817	Berlin Township	berlin-township	50	207
9818	Boonton Township	boonton-township	50	208
9819	Bordentown Township	bordentown-township	50	207
9820	Branchburg	branchburg	50	208
9821	Burlington Township	burlington-township	50	207
9822	Byram Township	byram-township	50	208
9823	Carneys Point Township	carneys-point-township	50	207
9824	Chatham Township	chatham-township	50	208
9825	Chester Township	chester-township	50	208
9826	Chesterfield Township	chesterfield-township	50	207
9827	Cinnaminson	cinnaminson	50	207
9828	Clinton Township	clinton-township	50	208
9829	Cranbury Township	cranbury-township	50	208
9830	Delran	delran	50	207
9831	Dennis	dennis	50	207
9832	Deptford Township	deptford-township	50	207
9833	East Amwell Township	east-amwell-township	50	208
9834	East Windsor	east-windsor	50	207
9835	Eastampton Township	eastampton-township	50	207
9836	Edgewater Park	edgewater-park	50	207
9837	Evesham Township	evesham-township	50	207
9838	Ewing Township	ewing-township	50	207
9839	Frankford	frankford	50	208
9840	Franklin	franklin	50	207
9841	Franklin Township	franklin-township	50	208
9842	Fredon Township	fredon-township	50	208
9843	Freehold Township	freehold-township	50	208
9844	Galloway	galloway	50	207
9845	Gloucester Township	gloucester-township	50	207
9846	Green Brook Township	green-brook-township	50	208
9847	Green Township	green-township	50	208
9848	Greenwich Township	greenwich-township	50	207
9849	Haddon Township	haddon-township	50	207
9850	Hamilton Township	hamilton-township	50	207
9851	Hamilton Township	hamilton-township	50	207
9852	Hampton Township	hampton-township	50	208
9853	Hanover	hanover	50	208
9854	Hardwick	hardwick	50	208
9855	Hardyston Township	hardyston-township	50	208
9856	Harrison Township	harrison-township	50	207
9857	Holland	holland	50	208
9858	Hopewell Township	hopewell-township	50	207
9859	Jefferson	jefferson	50	208
9860	Kingwood	kingwood	50	208
9861	Kinnelon	kinnelon	50	208
9862	Lacey Township	lacey-township	50	208
9863	Lakewood Township	lakewood-township	50	208
9864	Lawrence Township	lawrence-township	50	207
9865	Lebanon Township	lebanon-township	50	208
9866	Lindenwold	lindenwold	50	207
9867	Little Egg Harbor Township	little-egg-harbor-township	50	208
9868	Logan Township	logan-township	50	207
9869	Long Beach Township	long-beach-township	50	208
9870	Long Hill	long-hill	50	208
9871	Lower Township	lower-township	50	207
9872	Manchester Township	manchester-township	50	208
9873	Mansfield	mansfield	50	207
9874	Middle Township	middle-township	50	207
9875	Millstone	millstone	50	208
9876	Monroe Township	monroe-township	50	207
9877	Montgomery	montgomery	50	208
9878	Morris Township	morris-township	50	208
9879	Mount Olive Township	mount-olive-township	50	208
9880	Neptune Township	neptune-township	50	208
9881	New Hanover Township	new-hanover-township	50	207
9882	North Haledon	north-haledon	50	208
9883	North Hanover Township	north-hanover-township	50	207
9884	North Plainfield	north-plainfield	50	208
9885	Ocean Township	ocean-township	50	208
9886	Old Bridge Township	old-bridge-township	50	208
9887	Old Tappan	old-tappan	50	208
9888	Pemberton Township	pemberton-township	50	207
9889	Pennsville Township	pennsville-township	50	207
9890	Pilesgrove	pilesgrove	50	207
9891	Pittsgrove Township	pittsgrove-township	50	207
9892	Plumsted Township	plumsted-township	50	208
9893	Point Pleasant	point-pleasant	50	208
9894	River Vale	river-vale	50	208
9895	Robbinsville	robbinsville	50	207
9896	Rockaway Township	rockaway-township	50	208
9897	Roxbury Township	roxbury-township	50	208
9898	Sandyston	sandyston	50	208
9899	South Brunswick Township	south-brunswick-township	50	208
9900	Southampton Township	southampton-township	50	207
9901	Stafford Township	stafford-township	50	208
9902	Tabernacle	tabernacle	50	207
9903	Tewksbury	tewksbury	50	208
9904	Tinton Falls	tinton-falls	50	208
9905	Township of Washington	township-of-washington	50	208
9906	Upper Deerfield Township	upper-deerfield-township	50	207
9907	Upper Freehold	upper-freehold	50	208
9908	Upper Saddle River	upper-saddle-river	50	208
9909	Wall Township	wall-township	50	208
9910	Wantage	wantage	50	208
9911	Washington Township	washington-township	50	208
9912	Washington Township	washington-township	50	208
9913	Washington Township	washington-township	50	207
9914	Waterford	waterford	50	207
9915	West Caldwell	west-caldwell	50	208
9916	West Deptford	west-deptford	50	207
9917	West Windsor Township	west-windsor-township	50	207
9918	Westampton	westampton	50	207
9919	Woodbridge Township	woodbridge-township	50	208
9920	Woodland Park	woodland-park	50	208
9921	Woolwich Township	woolwich-township	50	207
9922	Alamogordo	alamogordo	25	209
9923	Albuquerque	albuquerque	25	209
9924	Algodones	algodones	25	209
9925	Alto	alto	25	209
9926	Angel Fire	angel-fire	25	209
9927	Animas	animas	25	209
9928	Anthony	anthony	25	210
9929	Artesia	artesia	25	209
9930	Aztec	aztec	25	209
9931	Bayard	bayard	25	209
9932	Belen	belen	25	209
9933	Bernalillo	bernalillo	25	209
9934	Bloomfield	bloomfield	25	209
9935	Bosque	bosque	25	209
9936	Bosque Farms	bosque-farms	25	209
9937	Buena Vista	buena-vista	25	209
9938	Cannon Air Force Base	cannon-air-force-base	25	211
9939	Capitan	capitan	25	209
9940	Carlsbad	carlsbad	25	209
9941	Carrizozo	carrizozo	25	209
9942	Cedar Crest	cedar-crest	25	209
9943	Los Cerrillos	los-cerrillos	25	209
9944	Chama	chama	25	209
9945	Church Rock	church-rock	25	209
9946	Clayton	clayton	25	211
9947	Cloudcroft	cloudcroft	25	209
9948	Clovis	clovis	25	211
9949	Corrales	corrales	25	209
9950	Crownpoint	crownpoint	25	209
9951	Cuba	cuba	25	209
9952	Datil	datil	25	209
9953	Deming	deming	25	209
9954	Des Moines	des-moines	25	211
9955	Dora	dora	25	211
9956	Dulce	dulce	25	209
9957	Edgewood	edgewood	25	209
9958	El Rito	el-rito	25	209
9959	Elida	elida	25	211
9960	Espanola	espanola	25	209
9961	Estancia	estancia	25	209
9962	Farmington	farmington	25	209
9963	Fence Lake	fence-lake	25	209
9964	Flora Vista	flora-vista	25	209
9965	Floyd	floyd	25	211
9966	Fort Sumner	fort-sumner	25	209
9967	Gallup	gallup	25	209
9968	Garfield	garfield	25	210
9969	Grants	grants	25	209
9970	Hatch	hatch	25	210
9971	Hobbs	hobbs	25	209
9972	Holloman Air Force Base	holloman-air-force-base	25	209
9973	Jemez Springs	jemez-springs	25	209
9974	Kirtland	kirtland	25	209
9975	La Mesa	la-mesa	25	210
9976	Laguna	laguna	25	209
9977	Las Cruces	las-cruces	25	210
9978	Las Vegas	las-vegas	25	209
9979	Lordsburg	lordsburg	25	209
9980	Los Alamos	los-alamos	25	209
9981	Los Lunas	los-lunas	25	209
9982	Los Ojos	los-ojos	25	209
9983	Lovington	lovington	25	209
9984	Magdalena	magdalena	25	209
9985	Maxwell	maxwell	25	209
9986	Melrose	melrose	25	211
9987	Mescalero	mescalero	25	209
9988	Mesquite	mesquite	25	210
9989	Montezuma	montezuma	25	209
9990	Mora	mora	25	209
9991	Moriarty	moriarty	25	209
9992	Mosquero	mosquero	25	209
9993	Mountainair	mountainair	25	209
9994	Ojo Caliente	ojo-caliente	25	209
9995	Penasco	penasco	25	209
9996	Peralta	peralta	25	209
9997	Mountain View	mountain-view	25	209
9998	Placitas	placitas	25	209
9999	Portales	portales	25	211
10000	Radium Springs	radium-springs	25	210
10001	Ramah	ramah	25	209
10002	Raton	raton	25	209
10003	Red River	red-river	25	209
10004	Rehoboth	rehoboth	25	209
10005	Reserve	reserve	25	209
10006	Rincon	rincon	25	210
10007	Rio Rancho	rio-rancho	25	209
10008	Rociada	rociada	25	209
10009	Roswell	roswell	25	209
10010	Roy	roy	25	209
10011	Ruidoso	ruidoso	25	209
10012	Salem	salem	25	210
10013	Sandia Park	sandia-park	25	209
10014	Santa Cruz	santa-cruz	25	209
10015	Santa Fe	santa-fe	25	209
10016	Santa Rosa	santa-rosa	25	209
10017	Shiprock	shiprock	25	209
10018	Silver City	silver-city	25	209
10019	Socorro	socorro	25	209
10020	Springer	springer	25	209
10021	Sunland Park	sunland-park	25	210
10022	Sunspot	sunspot	25	209
10023	Taos	taos	25	209
10024	Tesuque	tesuque	25	209
10025	Texico	texico	25	211
10026	Thoreau	thoreau	25	209
10027	Tierra Amarilla	tierra-amarilla	25	209
10028	Tijeras	tijeras	25	209
10029	Tohatchi	tohatchi	25	209
10030	Truth or Consequences	truth-or-consequences	25	209
10031	Tucumcari	tucumcari	25	211
10032	Tularosa	tularosa	25	209
10033	Vanderwagen	vanderwagen	25	209
10034	Vaughn	vaughn	25	209
10035	Villanueva	villanueva	25	209
10036	Waterflow	waterflow	25	209
10037	Watrous	watrous	25	209
10038	Zuni	zuni	25	209
10039	Pecos	pecos	25	209
10040	Cuyamungue	cuyamungue	25	209
10041	South Valley	south-valley	25	209
10042	Amargosa Valley	amargosa-valley	30	212
10043	Baker	baker	30	213
10044	Battle Mountain	battle-mountain	30	214
10045	Boulder City	boulder-city	30	212
10046	Bunkerville	bunkerville	30	212
10047	Cal-Nev-Ari	cal-nev-ari	30	212
10048	Caliente	caliente	30	212
10049	Carlin	carlin	30	213
10050	Carson City	carson-city	30	214
10051	Crystal Bay	crystal-bay	30	214
10052	Dayton	dayton	30	214
10053	Dyer	dyer	30	215
10054	Elko	elko	30	213
10055	Ely	ely	30	213
10056	Eureka	eureka	30	213
10057	Fallon	fallon	30	214
10058	Fernley	fernley	30	214
10059	Gabbs	gabbs	30	212
10060	Gardnerville	gardnerville	30	214
10061	Gerlach	gerlach	30	214
10062	Glenbrook	glenbrook	30	214
10063	Goldfield	goldfield	30	215
10064	Hawthorne	hawthorne	30	214
10065	Henderson	henderson	30	212
10066	Incline Village	incline-village	30	214
10067	Indian Springs	indian-springs	30	212
10068	Jackpot	jackpot	30	213
10069	Las Vegas	las-vegas	30	212
10070	Laughlin	laughlin	30	212
10071	Lovelock	lovelock	30	214
10072	Lund	lund	30	213
10073	McDermitt	mcdermitt	30	214
10074	Mesquite	mesquite	30	212
10075	Mina	mina	30	214
10076	Minden	minden	30	214
10077	Nellis Air Force Base	nellis-air-force-base	30	212
10078	Nixon	nixon	30	214
10079	North Las Vegas	north-las-vegas	30	212
10080	Pahrump	pahrump	30	212
10081	Pioche	pioche	30	212
10082	Reno	reno	30	214
10083	Schurz	schurz	30	214
10084	Silver Springs	silver-springs	30	214
10085	Sparks	sparks	30	214
10086	Stateline	stateline	30	214
10087	Sun Valley	sun-valley	30	214
10088	Tonopah	tonopah	30	212
10089	Verdi	verdi	30	214
10090	Virginia City	virginia-city	30	214
10091	New Washoe City	new-washoe-city	30	214
10092	West Wendover	west-wendover	30	213
10093	Winnemucca	winnemucca	30	214
10094	Yerington	yerington	30	214
10095	Zephyr Cove-Round Hill Village	zephyr-cove-round-hill-village	30	214
10096	Enterprise	enterprise	30	212
10097	Gardnerville Ranchos	gardnerville-ranchos	30	214
10098	Johnson Lane	johnson-lane	30	214
10099	Moapa Valley	moapa-valley	30	212
10100	Paradise	paradise	30	212
10101	Spanish Springs	spanish-springs	30	214
10102	Spring Valley	spring-valley	30	212
10103	Summerlin South	summerlin-south	30	212
10104	Sunrise Manor	sunrise-manor	30	212
10105	Whitney	whitney	30	212
10106	Winchester	winchester	30	212
10107	Accord	accord	51	216
10108	Addison	addison	51	217
10109	Adirondack	adirondack	51	218
10110	Afton	afton	51	219
10111	Akron	akron	51	220
10112	Albany	albany	51	218
10113	Albertson	albertson	51	216
10114	Albion	albion	51	220
10115	Alden	alden	51	220
10116	Alexander	alexander	51	220
10117	Alexandria Bay	alexandria-bay	51	221
10118	Alfred	alfred	51	220
10119	Allegany	allegany	51	220
10120	Alma	alma	51	220
10121	Altamont	altamont	51	218
10122	Amagansett	amagansett	51	216
10123	Amawalk	amawalk	51	216
10124	Amenia	amenia	51	216
10125	Amityville	amityville	51	216
10126	Amsterdam	amsterdam	51	218
10127	Ancram	ancram	51	218
10128	Ancramdale	ancramdale	51	218
10129	Andover	andover	51	220
10130	Angola	angola	51	220
10131	Annandale-on-Hudson	annandale-on-hudson	51	216
10132	Apalachin	apalachin	51	219
10133	Arcade	arcade	51	220
10134	Ardsley	ardsley	51	216
10135	Argyle	argyle	51	218
10136	Armonk	armonk	51	216
10137	Athens	athens	51	218
10138	Atlantic Beach	atlantic-beach	51	216
10139	Attica	attica	51	220
10140	Auburn	auburn	51	222
10141	Aurora	aurora	51	222
10142	Ava	ava	51	222
10143	Averill Park	averill-park	51	218
10144	Avon	avon	51	223
10145	Babylon	babylon	51	216
10146	Bainbridge	bainbridge	51	219
10147	Baldwin	baldwin	51	216
10148	Baldwinsville	baldwinsville	51	222
10149	Ballston Lake	ballston-lake	51	218
10150	Ballston Spa	ballston-spa	51	218
10151	Bangall	bangall	51	216
10152	Barneveld	barneveld	51	224
10153	Barrytown	barrytown	51	216
10154	Batavia	batavia	51	220
10155	Bath	bath	51	217
10156	Bay Shore	bay-shore	51	216
10157	Bayport	bayport	51	216
10158	Bayville	bayville	51	216
10159	Beacon	beacon	51	216
10160	Bear Mountain	bear-mountain	51	216
10161	Bearsville	bearsville	51	216
10162	Bedford	bedford	51	216
10163	Bedford Hills	bedford-hills	51	216
10164	Bellerose	bellerose	51	216
10165	Bellmore	bellmore	51	216
10166	Bellport	bellport	51	216
10167	Belmont	belmont	51	220
10168	Bergen	bergen	51	220
10169	Bethel	bethel	51	216
10170	Bethpage	bethpage	51	216
10171	Big Flats	big-flats	51	217
10172	Binghamton	binghamton	51	219
10173	Blauvelt	blauvelt	51	216
10174	Bloomfield	bloomfield	51	223
10175	Blue Point	blue-point	51	216
10176	Bohemia	bohemia	51	216
10177	Bombay	bombay	51	225
10178	Boonville	boonville	51	224
10179	Bowmansville	bowmansville	51	220
10180	Brant	brant	51	220
10181	Brentwood	brentwood	51	216
10182	Brewerton	brewerton	51	222
10183	Brewster	brewster	51	216
10184	Briarcliff Manor	briarcliff-manor	51	216
10185	Bridgehampton	bridgehampton	51	216
10186	Bridgeport	bridgeport	51	222
10187	Brier Hill	brier-hill	51	221
10188	Brightwaters	brightwaters	51	216
10189	Broadalbin	broadalbin	51	218
10190	Brockport	brockport	51	223
10191	Bronxville	bronxville	51	216
10192	Brookhaven	brookhaven	51	216
10193	Buchanan	buchanan	51	216
10194	Buffalo	buffalo	51	220
10195	Burdett	burdett	51	217
10196	Buskirk	buskirk	51	218
10197	Byron	byron	51	220
10198	Cairo	cairo	51	218
10199	Caledonia	caledonia	51	223
10200	Callicoon	callicoon	51	216
10201	Calverton	calverton	51	216
10202	Cambridge	cambridge	51	218
10203	Camden	camden	51	222
10204	Camillus	camillus	51	222
10205	Campbell	campbell	51	217
10206	Campbell Hall	campbell-hall	51	216
10207	Canaan	canaan	51	218
10208	Canajoharie	canajoharie	51	218
10209	Canandaigua	canandaigua	51	223
10210	Candor	candor	51	219
10211	Canton	canton	51	221
10212	Cape Vincent	cape-vincent	51	221
10213	Carle Place	carle-place	51	216
10214	Castleton-on-Hudson	castleton-on-hudson	51	218
10215	Catskill	catskill	51	218
10216	Cazenovia	cazenovia	51	222
10217	Cedarhurst	cedarhurst	51	216
10218	Center Moriches	center-moriches	51	216
10219	Centereach	centereach	51	216
10220	Centerport	centerport	51	216
10221	Central Islip	central-islip	51	216
10222	Chadwicks	chadwicks	51	224
10223	Champlain	champlain	51	225
10224	Chappaqua	chappaqua	51	216
10225	Chatham	chatham	51	218
10226	Chaumont	chaumont	51	221
10227	Chautauqua	chautauqua	51	220
10228	Chazy	chazy	51	225
10229	Cherry Valley	cherry-valley	51	224
10230	Chester	chester	51	216
10231	Chittenango	chittenango	51	222
10232	Churchville	churchville	51	223
10233	Cicero	cicero	51	222
10234	Clarence Center	clarence-center	51	220
10235	Clarkson	clarkson	51	223
10236	Claverack	claverack	51	218
10237	Clay	clay	51	222
10238	Clayton	clayton	51	221
10239	Clemons	clemons	51	218
10240	Clifton Springs	clifton-springs	51	223
10241	Clinton	clinton	51	224
10242	Clinton Corners	clinton-corners	51	216
10243	Cobleskill	cobleskill	51	218
10244	Cohoes	cohoes	51	218
10245	Cold Spring	cold-spring	51	216
10246	Cold Spring Harbor	cold-spring-harbor	51	216
10247	Collins	collins	51	220
10248	Colton	colton	51	221
10249	Columbiaville	columbiaville	51	218
10250	Commack	commack	51	216
10251	Comstock	comstock	51	218
10252	Congers	congers	51	216
10253	Cooperstown	cooperstown	51	224
10254	Copake	copake	51	218
10255	Copiague	copiague	51	216
10256	Coram	coram	51	216
10257	Corfu	corfu	51	220
10258	Corinth	corinth	51	218
10259	Corning	corning	51	217
10260	Cornwall	cornwall	51	216
10261	Cornwall-on-Hudson	cornwall-on-hudson	51	216
10262	Cortland	cortland	51	222
10263	Cossayuna	cossayuna	51	218
10264	Coxsackie	coxsackie	51	218
10265	Cranberry Lake	cranberry-lake	51	221
10266	Craryville	craryville	51	218
10267	Cropseyville	cropseyville	51	218
10268	Cross River	cross-river	51	216
10269	Croton Falls	croton-falls	51	216
10270	Croton-on-Hudson	croton-on-hudson	51	216
10271	Cuba	cuba	51	220
10272	Cutchogue	cutchogue	51	216
10273	Dansville	dansville	51	223
10274	DeRuyter	deruyter	51	222
10275	Deer Park	deer-park	51	216
10276	Delhi	delhi	51	219
10277	Delmar	delmar	51	218
10278	Depew	depew	51	220
10279	Deposit	deposit	51	219
10280	Derby	derby	51	220
10281	Dobbs Ferry	dobbs-ferry	51	216
10282	Dolgeville	dolgeville	51	224
10283	Dover Plains	dover-plains	51	216
10284	Dryden	dryden	51	222
10285	Duanesburg	duanesburg	51	218
10286	Dundee	dundee	51	223
10287	Dunkirk	dunkirk	51	220
10288	East Amherst	east-amherst	51	220
10289	East Aurora	east-aurora	51	220
10290	East Bloomfield	east-bloomfield	51	223
10291	East Chatham	east-chatham	51	218
10292	East Greenbush	east-greenbush	51	218
10293	East Hampton	east-hampton	51	216
10294	East Islip	east-islip	51	216
10295	East Marion	east-marion	51	216
10296	East Meadow	east-meadow	51	216
10297	East Moriches	east-moriches	51	216
10298	East Northport	east-northport	51	216
10299	East Norwich	east-norwich	51	216
10300	East Quogue	east-quogue	51	216
10301	East Rochester	east-rochester	51	223
10302	East Rockaway	east-rockaway	51	216
10303	Setauket- East Setauket	setauket-east-setauket	51	216
10304	East Syracuse	east-syracuse	51	222
10305	Eastchester	eastchester	51	216
10306	Eastport	eastport	51	216
10307	Elba	elba	51	220
10308	Elbridge	elbridge	51	222
10309	Eldred	eldred	51	216
10310	Elizabethtown	elizabethtown	51	225
10311	Elizaville	elizaville	51	218
10312	Ellenville	ellenville	51	216
10313	Ellicottville	ellicottville	51	220
10314	Elma	elma	51	220
10315	Elmira	elmira	51	217
10316	Elmont	elmont	51	216
10317	Elmsford	elmsford	51	216
10318	Endicott	endicott	51	219
10319	Endwell	endwell	51	219
10320	Fair Haven	fair-haven	51	222
10321	Fairport	fairport	51	223
10322	Fallsburg	fallsburg	51	216
10323	Farmingdale	farmingdale	51	216
10324	Farmingville	farmingville	51	216
10325	Fayetteville	fayetteville	51	222
10326	Ferndale	ferndale	51	216
10327	Fine	fine	51	221
10328	Fishers	fishers	51	223
10329	Fishkill	fishkill	51	216
10330	Floral Park	floral-park	51	216
10331	Florida	florida	51	216
10332	Frankfort	frankfort	51	224
10333	Franklin	franklin	51	219
10334	Franklin Square	franklin-square	51	216
10335	Franklinville	franklinville	51	220
10336	Fredonia	fredonia	51	220
10337	Freeport	freeport	51	216
10338	Fort Ann	fort-ann	51	218
10339	Fort Drum	fort-drum	51	221
10340	Fort Edward	fort-edward	51	218
10341	Fort Montgomery	fort-montgomery	51	216
10342	Fort Plain	fort-plain	51	218
10343	Fulton	fulton	51	222
10344	Fultonville	fultonville	51	218
10345	Gabriels	gabriels	51	225
10346	Gainesville	gainesville	51	220
10347	Garden City	garden-city	51	216
10348	Gardiner	gardiner	51	216
10349	Garrison	garrison	51	216
10350	Geneseo	geneseo	51	223
10351	Geneva	geneva	51	223
10352	Germantown	germantown	51	218
10353	Getzville	getzville	51	220
10354	Ghent	ghent	51	218
10355	Glen Cove	glen-cove	51	216
10356	Glen Head	glen-head	51	216
10357	Glenmont	glenmont	51	218
10358	Glens Falls	glens-falls	51	218
10359	Glenwood Landing	glenwood-landing	51	216
10360	Gloversville	gloversville	51	218
10361	Goshen	goshen	51	216
10362	Gouverneur	gouverneur	51	221
10363	Gowanda	gowanda	51	220
10364	Grand Island	grand-island	51	220
10365	Granville	granville	51	218
10366	Great Neck	great-neck	51	216
10367	Great River	great-river	51	216
10368	Greenlawn	greenlawn	51	216
10369	Greenport	greenport	51	216
10370	Greenvale	greenvale	51	216
10371	Greenville	greenville	51	218
10372	Greenwich	greenwich	51	218
10373	Guilderland	guilderland	51	218
10374	Guilderland Center	guilderland-center	51	218
10375	Haines Falls	haines-falls	51	218
10376	Hamburg	hamburg	51	220
10377	Hamilton	hamilton	51	222
10378	Hamlin	hamlin	51	223
10379	Hammond	hammond	51	221
10380	Hampton	hampton	51	218
10381	Hampton Bays	hampton-bays	51	216
10382	Hancock	hancock	51	219
10383	Harriman	harriman	51	216
10384	Harris	harris	51	216
10385	Harrison	harrison	51	216
10386	Hartford	hartford	51	218
10387	Hartsdale	hartsdale	51	216
10388	Hastings-on-Hudson	hastings-on-hudson	51	216
10389	Hauppauge	hauppauge	51	216
10390	Haverstraw	haverstraw	51	216
10391	Hawthorne	hawthorne	51	216
10392	Hemlock	hemlock	51	223
10393	Hempstead	hempstead	51	216
10394	Henderson	henderson	51	221
10395	Henrietta	henrietta	51	223
10396	Herkimer	herkimer	51	224
10397	Hermon	hermon	51	221
10398	Hewlett	hewlett	51	216
10399	Hicksville	hicksville	51	216
10400	High Falls	high-falls	51	216
10401	Highland	highland	51	216
10402	Highland Falls	highland-falls	51	216
10403	Hillburn	hillburn	51	216
10404	Hillsdale	hillsdale	51	218
10405	Hilton	hilton	51	223
10406	Hogansburg	hogansburg	51	225
10407	Holbrook	holbrook	51	216
10408	Holland	holland	51	220
10409	Holley	holley	51	220
10410	Hollowville	hollowville	51	218
10411	Holtsville	holtsville	51	216
10412	Homer	homer	51	222
10413	Honeoye	honeoye	51	223
10414	Honeoye Falls	honeoye-falls	51	223
10415	Hoosick	hoosick	51	218
10416	Hoosick Falls	hoosick-falls	51	218
10417	Hopewell Junction	hopewell-junction	51	216
10418	Hornell	hornell	51	217
10419	Horseheads	horseheads	51	217
10420	Houghton	houghton	51	220
10421	Hudson	hudson	51	218
10422	Hudson Falls	hudson-falls	51	218
10423	Huletts Landing	huletts-landing	51	218
10424	Hunter	hunter	51	218
10425	Huntington	huntington	51	216
10426	Huntington Station	huntington-station	51	216
10427	Hurley	hurley	51	216
10428	Hurleyville	hurleyville	51	216
10429	Hyde Park	hyde-park	51	216
10430	Ilion	ilion	51	224
10431	Indian Lake	indian-lake	51	218
10432	Interlaken	interlaken	51	222
10433	Inwood	inwood	51	216
10434	Irving	irving	51	220
10435	Irvington	irvington	51	216
10436	Island Park	island-park	51	216
10437	Islandia	islandia	51	216
10438	Islip	islip	51	216
10439	Islip Terrace	islip-terrace	51	216
10440	Ithaca	ithaca	51	222
10441	Jamesport	jamesport	51	216
10442	Jamestown	jamestown	51	220
10443	Jamesville	jamesville	51	222
10444	Jefferson Valley-Yorktown	jefferson-valley-yorktown	51	216
10445	Jeffersonville	jeffersonville	51	216
10446	Jericho	jericho	51	216
10447	Johnson	johnson	51	216
10448	Johnson City	johnson-city	51	219
10449	Johnsonville	johnsonville	51	218
10450	Johnstown	johnstown	51	218
10451	Jordan	jordan	51	222
10452	Katonah	katonah	51	216
10453	Kauneonga Lake	kauneonga-lake	51	216
10454	Keene Valley	keene-valley	51	225
10455	Keeseville	keeseville	51	225
10456	Kent	kent	51	220
10457	Keuka Park	keuka-park	51	223
10458	Kinderhook	kinderhook	51	218
10459	Kings Park	kings-park	51	216
10460	Kingston	kingston	51	216
10461	Kirkwood	kirkwood	51	219
10462	LaFayette	lafayette	51	222
10463	Lacona	lacona	51	222
10464	Lagrangeville	lagrangeville	51	216
10465	Lake George	lake-george	51	218
10466	Lake Grove	lake-grove	51	216
10467	Lake Katrine	lake-katrine	51	216
10468	Lake Peekskill	lake-peekskill	51	216
10469	Lake Placid	lake-placid	51	225
10470	Lakemont	lakemont	51	223
10471	Lakewood	lakewood	51	220
10472	Lancaster	lancaster	51	220
10473	Lansing	lansing	51	222
10474	Larchmont	larchmont	51	216
10475	Latham	latham	51	218
10476	Laurel	laurel	51	216
10477	Laurens	laurens	51	224
10478	Lawrence	lawrence	51	216
10479	Le Roy	le-roy	51	220
10480	Leicester	leicester	51	223
10481	Levittown	levittown	51	216
10482	Lewis	lewis	51	225
10483	Lewiston	lewiston	51	220
10484	Liberty	liberty	51	216
10485	Lima	lima	51	223
10486	Limestone	limestone	51	220
10487	Lincolndale	lincolndale	51	216
10488	Lindenhurst	lindenhurst	51	216
10489	Little Falls	little-falls	51	224
10490	Little Valley	little-valley	51	220
10491	Liverpool	liverpool	51	222
10492	Livingston	livingston	51	218
10493	Livingston Manor	livingston-manor	51	216
10494	Livonia	livonia	51	223
10495	Loch Sheldrake	loch-sheldrake	51	216
10496	Lockport	lockport	51	220
10497	Locust Valley	locust-valley	51	216
10498	Lodi	lodi	51	222
10499	Long Beach	long-beach	51	216
10500	Lowville	lowville	51	221
10501	Lynbrook	lynbrook	51	216
10502	Lyons	lyons	51	223
10503	Macedon	macedon	51	223
10504	Madison	madison	51	222
10505	Madrid	madrid	51	221
10506	Mahopac	mahopac	51	216
10507	Mahopac Falls	mahopac-falls	51	216
10508	Malden Bridge	malden-bridge	51	218
10509	Malone	malone	51	225
10510	Malverne	malverne	51	216
10511	Mamaroneck	mamaroneck	51	216
10512	Manhasset	manhasset	51	216
10513	Manlius	manlius	51	222
10514	Manorville	manorville	51	216
10515	Marathon	marathon	51	222
10516	Marcellus	marcellus	51	222
10517	Margaretville	margaretville	51	219
10518	Marlboro	marlboro	51	216
10519	Massapequa	massapequa	51	216
10520	Massapequa Park	massapequa-park	51	216
10521	Massena	massena	51	221
10522	Mastic	mastic	51	216
10523	Mastic Beach	mastic-beach	51	216
10524	Mattituck	mattituck	51	216
10525	Maybrook	maybrook	51	216
10526	Mayville	mayville	51	220
10527	McConnellsville	mcconnellsville	51	222
10528	Mechanicville	mechanicville	51	218
10529	Mecklenburg	mecklenburg	51	217
10530	Medford	medford	51	216
10531	Medina	medina	51	220
10532	Mellenville	mellenville	51	218
10533	Melrose	melrose	51	218
10534	Melville	melville	51	216
10535	Mendon	mendon	51	223
10536	Merrick	merrick	51	216
10537	Mexico	mexico	51	222
10538	Middle Granville	middle-granville	51	218
10539	Middle Island	middle-island	51	216
10540	Middleburgh	middleburgh	51	218
10541	Middleport	middleport	51	220
10542	Middletown	middletown	51	216
10543	Milford	milford	51	224
10544	Mill Neck	mill-neck	51	216
10545	Millbrook	millbrook	51	216
10546	Miller Place	miller-place	51	216
10547	Millerton	millerton	51	216
10548	Millwood	millwood	51	216
10549	Milton	milton	51	216
10550	Mineola	mineola	51	216
10551	Model City	model-city	51	220
10552	Modena	modena	51	216
10553	Mohegan Lake	mohegan-lake	51	216
10554	Monroe	monroe	51	216
10555	Monsey	monsey	51	216
10556	Montauk	montauk	51	216
10557	Montgomery	montgomery	51	216
10558	Monticello	monticello	51	216
10559	Montrose	montrose	51	216
10560	Moravia	moravia	51	222
10561	Moriches	moriches	51	216
10562	Morrisonville	morrisonville	51	225
10563	Morristown	morristown	51	221
10564	Morrisville	morrisville	51	222
10565	Mount Kisco	mount-kisco	51	216
10566	Mount Morris	mount-morris	51	223
10567	Mount Sinai	mount-sinai	51	216
10568	Mount Vernon	mount-vernon	51	216
10569	Mountainville	mountainville	51	216
10570	Nanuet	nanuet	51	216
10571	Naples	naples	51	223
10572	Narrowsburg	narrowsburg	51	216
10573	Nassau	nassau	51	218
10574	Nesconset	nesconset	51	216
10575	New Berlin	new-berlin	51	219
10576	New City	new-city	51	216
10577	New Hartford	new-hartford	51	224
10578	New Hyde Park	new-hyde-park	51	216
10579	New Lebanon	new-lebanon	51	218
10580	New Paltz	new-paltz	51	216
10581	New Rochelle	new-rochelle	51	216
10582	New Windsor	new-windsor	51	216
10583	New York	new-york	51	216
10584	Newark	newark	51	223
10585	Newburgh	newburgh	51	216
10586	Newport	newport	51	224
10587	Newtonville	newtonville	51	218
10588	Niagara Falls	niagara-falls	51	220
10589	Niagara University	niagara-university	51	220
10590	Nichols	nichols	51	219
10591	Nicholville	nicholville	51	221
10592	Niverville	niverville	51	218
10593	North Babylon	north-babylon	51	216
10594	North Chatham	north-chatham	51	218
10595	North Granville	north-granville	51	218
10596	North Greece	north-greece	51	223
10597	North Salem	north-salem	51	216
10598	North Tonawanda	north-tonawanda	51	220
10599	Northport	northport	51	216
10600	Norwich	norwich	51	219
10601	Norwood	norwood	51	221
10602	Nunda	nunda	51	223
10603	Nyack	nyack	51	216
10604	Oak Hill	oak-hill	51	218
10605	Oakdale	oakdale	51	216
10606	Oakfield	oakfield	51	220
10607	Ocean Beach	ocean-beach	51	216
10608	Oceanside	oceanside	51	216
10609	Ogdensburg	ogdensburg	51	221
10610	Old Bethpage	old-bethpage	51	216
10611	Old Chatham	old-chatham	51	218
10612	Old Forge	old-forge	51	224
10613	Old Westbury	old-westbury	51	216
10614	Olean	olean	51	220
10615	Oneida	oneida	51	222
10616	Oneonta	oneonta	51	224
10617	Ontario	ontario	51	223
10618	Ontario Center	ontario-center	51	223
10619	Orangeburg	orangeburg	51	216
10620	Orchard Park	orchard-park	51	220
10621	Orient	orient	51	216
10622	Oriskany	oriskany	51	224
10623	Ossining	ossining	51	216
10624	Oswego	oswego	51	222
10625	Otisville	otisville	51	216
10626	Ovid	ovid	51	222
10627	Owego	owego	51	219
10628	Oyster Bay	oyster-bay	51	216
10629	Painted Post	painted-post	51	217
10630	Palisades	palisades	51	216
10631	Palmyra	palmyra	51	223
10632	Parish	parish	51	222
10633	Parishville	parishville	51	221
10634	Patchogue	patchogue	51	216
10635	Patterson	patterson	51	216
10636	Paul Smiths	paul-smiths	51	225
10637	Pavilion	pavilion	51	220
10638	Pawling	pawling	51	216
10639	Pearl River	pearl-river	51	216
10640	Peconic	peconic	51	216
10641	Peekskill	peekskill	51	216
10642	Village of Pelham	village-of-pelham	51	216
10643	Penn Yan	penn-yan	51	223
10644	Perry	perry	51	220
10645	Petersburg	petersburg	51	218
10646	Phelps	phelps	51	223
10647	Philmont	philmont	51	218
10648	Phoenicia	phoenicia	51	216
10649	Phoenix	phoenix	51	222
10650	Piermont	piermont	51	216
10651	Pine Bush	pine-bush	51	216
10652	Pine Hill	pine-hill	51	216
10653	Pine Plains	pine-plains	51	216
10654	Pittsford	pittsford	51	223
10655	Plainview	plainview	51	216
10656	Plainville	plainville	51	222
10657	Plattsburgh	plattsburgh	51	225
10658	Pleasant Valley	pleasant-valley	51	216
10659	Pleasantville	pleasantville	51	216
10660	Pomona	pomona	51	216
10661	Port Byron	port-byron	51	222
10662	Port Chester	port-chester	51	216
10663	Port Henry	port-henry	51	225
10664	Port Jefferson	port-jefferson	51	216
10665	Port Jefferson Station	port-jefferson-station	51	216
10666	Port Jervis	port-jervis	51	216
10667	Port Washington	port-washington	51	216
10668	Portageville	portageville	51	220
10669	Potsdam	potsdam	51	221
10670	Pottersville	pottersville	51	218
10671	Poughkeepsie	poughkeepsie	51	216
10672	Pound Ridge	pound-ridge	51	216
10673	Pulaski	pulaski	51	222
10674	Purdys	purdys	51	216
10675	Putnam Station	putnam-station	51	218
10676	Putnam Valley	putnam-valley	51	216
10677	Quogue	quogue	51	216
10678	Rainbow Lake	rainbow-lake	51	225
10679	Ransomville	ransomville	51	220
10680	Ray Brook	ray-brook	51	225
10681	Red Creek	red-creek	51	223
10682	Red Hook	red-hook	51	216
10683	Remsen	remsen	51	224
10684	Rensselaer	rensselaer	51	218
10685	Retsof	retsof	51	223
10686	Rexford	rexford	51	218
10687	Rhinebeck	rhinebeck	51	216
10688	Richfield Springs	richfield-springs	51	224
10689	Ridge	ridge	51	216
10690	Rifton	rifton	51	216
10691	Riverhead	riverhead	51	216
10692	Rochester	rochester	51	223
10693	Rock Hill	rock-hill	51	216
10694	Rockville Centre	rockville-centre	51	216
10695	Rocky Point	rocky-point	51	216
10696	Rome	rome	51	222
10697	Romulus	romulus	51	222
10698	Ronkonkoma	ronkonkoma	51	216
10699	Roosevelt	roosevelt	51	216
10700	Roscoe	roscoe	51	216
10701	Rosendale	rosendale	51	216
10702	Roslyn	roslyn	51	216
10703	Roslyn Heights	roslyn-heights	51	216
10704	Rotterdam Junction	rotterdam-junction	51	218
10705	Rouses Point	rouses-point	51	225
10706	Rush	rush	51	223
10707	Rushville	rushville	51	223
10708	Rye	rye	51	216
10709	Sackets Harbor	sackets-harbor	51	221
10710	Sag Harbor	sag-harbor	51	216
10711	Salamanca	salamanca	51	220
10712	Salem	salem	51	218
10713	Salt Point	salt-point	51	216
10714	Sanborn	sanborn	51	220
10715	Sandy Creek	sandy-creek	51	222
10716	Saranac Lake	saranac-lake	51	225
10717	Saratoga Springs	saratoga-springs	51	218
10718	Saugerties	saugerties	51	216
10719	Sauquoit	sauquoit	51	224
10720	Savannah	savannah	51	223
10721	Sayville	sayville	51	216
10722	Scarsdale	scarsdale	51	216
10723	Schenectady	schenectady	51	218
10724	Schoharie	schoharie	51	218
10725	Scipio Center	scipio-center	51	222
10726	Scottsville	scottsville	51	223
10727	Sea Cliff	sea-cliff	51	216
10728	Seaford	seaford	51	216
10729	Selden	selden	51	216
10730	Selkirk	selkirk	51	218
10731	Seneca Falls	seneca-falls	51	222
10732	Shelter Island	shelter-island	51	216
10733	Shenorock	shenorock	51	216
10734	Shirley	shirley	51	216
10735	Shokan	shokan	51	216
10736	Shoreham	shoreham	51	216
10737	Shrub Oak	shrub-oak	51	216
10738	Shushan	shushan	51	218
10739	Sidney	sidney	51	219
10740	Silver Creek	silver-creek	51	220
10741	Silver Springs	silver-springs	51	220
10742	Skaneateles	skaneateles	51	222
10743	Skaneateles Falls	skaneateles-falls	51	222
10744	Sloatsburg	sloatsburg	51	216
10745	Smithtown	smithtown	51	216
10746	Smyrna	smyrna	51	219
10747	Sodus	sodus	51	223
10859	Willsboro	willsboro	51	225
10748	Sodus Point	sodus-point	51	223
10749	Sound Beach	sound-beach	51	216
10750	South Bethlehem	south-bethlehem	51	218
10751	South Dayton	south-dayton	51	220
10752	South Fallsburg	south-fallsburg	51	216
10753	South Salem	south-salem	51	216
10754	South Wales	south-wales	51	220
10755	Southampton	southampton	51	216
10756	Southold	southold	51	216
10757	Sparkill	sparkill	51	216
10758	Spencer	spencer	51	219
10759	Spencerport	spencerport	51	223
10760	Spencertown	spencertown	51	218
10761	Sprakers	sprakers	51	218
10762	Spring Valley	spring-valley	51	216
10763	Springville	springville	51	220
10764	Springwater	springwater	51	223
10765	Saint Bonaventure	saint-bonaventure	51	220
10766	Saint James	saint-james	51	216
10767	Staatsburg	staatsburg	51	216
10768	Stafford	stafford	51	220
10769	Stamford	stamford	51	219
10770	Stanfordville	stanfordville	51	216
10771	Sterling Forest	sterling-forest	51	216
10772	Stillwater	stillwater	51	218
10773	Stone Ridge	stone-ridge	51	216
10774	Stony Brook	stony-brook	51	216
10775	Stony Point	stony-point	51	216
10776	Stottville	stottville	51	218
10777	Stuyvesant Falls	stuyvesant-falls	51	218
10778	Suffern	suffern	51	216
10779	Syosset	syosset	51	216
10780	Syracuse	syracuse	51	222
10781	Tappan	tappan	51	216
10782	Tarrytown	tarrytown	51	216
10783	Thiells	thiells	51	216
10784	Thornwood	thornwood	51	216
10785	Ticonderoga	ticonderoga	51	225
10786	Tioga Center	tioga-center	51	219
10787	Tivoli	tivoli	51	216
10788	Tomkins Cove	tomkins-cove	51	216
10789	Tonawanda	tonawanda	51	220
10790	Troy	troy	51	218
10791	Trumansburg	trumansburg	51	222
10792	Tuckahoe	tuckahoe	51	216
10793	Tully	tully	51	222
10794	Tupper Lake	tupper-lake	51	225
10795	Tuxedo Park	tuxedo-park	51	216
10796	Ulster Park	ulster-park	51	216
10797	Union Springs	union-springs	51	222
10798	Uniondale	uniondale	51	216
10799	Unionville	unionville	51	216
10800	Upton	upton	51	216
10801	Utica	utica	51	224
10802	Valatie	valatie	51	218
10803	Valhalla	valhalla	51	216
10804	Valley Cottage	valley-cottage	51	216
10805	Valley Stream	valley-stream	51	216
10806	Vernon	vernon	51	222
10807	Verona	verona	51	222
10808	Victor	victor	51	223
10809	Voorheesville	voorheesville	51	218
10810	Waccabuc	waccabuc	51	216
10811	Waddington	waddington	51	221
10812	Wading River	wading-river	51	216
10813	Walden	walden	51	216
10814	Wallkill	wallkill	51	216
10815	Walton	walton	51	219
10816	Walworth	walworth	51	223
10817	Wantagh	wantagh	51	216
10818	Wappingers Falls	wappingers-falls	51	216
10819	Warsaw	warsaw	51	220
10820	Warwick	warwick	51	216
10821	Washingtonville	washingtonville	51	216
10822	Water Mill	water-mill	51	216
10823	Waterford	waterford	51	218
10824	Waterloo	waterloo	51	222
10825	Watertown	watertown	51	221
10826	Waterville	waterville	51	222
10827	Watervliet	watervliet	51	218
10828	Watkins Glen	watkins-glen	51	217
10829	Waverly	waverly	51	219
10830	Wayland	wayland	51	217
10831	Webster	webster	51	223
10832	Weedsport	weedsport	51	222
10833	Wellsville	wellsville	51	220
10834	West Babylon	west-babylon	51	216
10835	West Copake	west-copake	51	218
10836	West Falls	west-falls	51	220
10837	West Haverstraw	west-haverstraw	51	216
10838	West Hempstead	west-hempstead	51	216
10839	West Henrietta	west-henrietta	51	223
10840	West Hurley	west-hurley	51	216
10841	West Islip	west-islip	51	216
10842	West Lebanon	west-lebanon	51	218
10843	West Nyack	west-nyack	51	216
10844	West Point	west-point	51	216
10845	West Sayville	west-sayville	51	216
10846	West Shokan	west-shokan	51	216
10847	West Valley	west-valley	51	220
10848	Westbury	westbury	51	216
10849	Westfield	westfield	51	220
10850	Westhampton	westhampton	51	216
10851	Westhampton Beach	westhampton-beach	51	216
10852	Westmoreland	westmoreland	51	224
10853	Westport	westport	51	225
10854	White Lake	white-lake	51	216
10855	White Plains	white-plains	51	216
10856	Whitehall	whitehall	51	218
10857	Williamson	williamson	51	223
10858	Williston Park	williston-park	51	216
10860	Windham	windham	51	218
10861	Windsor	windsor	51	219
10862	Wingdale	wingdale	51	216
10863	Wolcott	wolcott	51	223
10864	Woodbury	woodbury	51	216
10865	Woodmere	woodmere	51	216
10866	Woodstock	woodstock	51	216
10867	Wyandanch	wyandanch	51	216
10868	Wynantskill	wynantskill	51	218
10869	Wyoming	wyoming	51	220
10870	Yaphank	yaphank	51	216
10871	Yonkers	yonkers	51	216
10872	Yorktown Heights	yorktown-heights	51	216
10873	Yorkville	yorkville	51	224
10874	Airmont	airmont	51	216
10875	Arlington	arlington	51	216
10876	Ballston	ballston	51	218
10877	Bay Park	bay-park	51	216
10878	Beaverdam Lake-Salisbury Mills	beaverdam-lake-salisbury-mills	51	216
10879	Blasdell	blasdell	51	220
10880	Bolivar	bolivar	51	220
10881	Bolton	bolton	51	218
10882	Brighton	brighton	51	223
10883	Brinckerhoff	brinckerhoff	51	216
10884	Brookville	brookville	51	216
10885	Canastota	canastota	51	222
10886	Carmel	carmel	51	216
10887	Carthage	carthage	51	221
10888	Central Square	central-square	51	222
10889	Cheektowaga	cheektowaga	51	220
10890	Chestnut Ridge	chestnut-ridge	51	216
10891	Clintondale	clintondale	51	216
10892	Colonie	colonie	51	218
10893	Constantia	constantia	51	222
10894	Country Knolls	country-knolls	51	218
10895	Dix Hills	dix-hills	51	216
10896	East Farmingdale	east-farmingdale	51	216
10897	East Garden City	east-garden-city	51	216
10898	East Glenville	east-glenville	51	218
10899	East Hampton North	east-hampton-north	51	216
10900	East Hills	east-hills	51	216
10901	East Massapequa	east-massapequa	51	216
10902	East Patchogue	east-patchogue	51	216
10903	East Shoreham	east-shoreham	51	216
10904	Elma Center	elma-center	51	220
10905	Fairmount	fairmount	51	222
10906	Fairview	fairview	51	216
10907	Fairview	fairview	51	216
10908	Galeville	galeville	51	222
10909	Gardnertown	gardnertown	51	216
10910	Gates-North Gates	gates-north-gates	51	223
10911	Goldens Bridge	goldens-bridge	51	216
10912	Great Neck Plaza	great-neck-plaza	51	216
10913	Greece	greece	51	223
10914	Greene	greene	51	219
10915	Greenwood Lake	greenwood-lake	51	216
10916	Hampton Manor	hampton-manor	51	218
10917	Harris Hill	harris-hill	51	220
10918	Heritage Hills	heritage-hills	51	216
10919	Hillside Lake	hillside-lake	51	216
10920	Holland Patent	holland-patent	51	222
10921	Irondequoit	irondequoit	51	223
10922	Kenmore	kenmore	51	220
10923	Kerhonkson	kerhonkson	51	216
10924	Kings Point	kings-point	51	216
10925	Lackawanna	lackawanna	51	220
10926	Lake Carmel	lake-carmel	51	216
10927	Lake Ronkonkoma	lake-ronkonkoma	51	216
10928	Laurel Hollow	laurel-hollow	51	216
10929	Marion	marion	51	223
10930	Mattydale	mattydale	51	222
10931	Menands	menands	51	218
10932	Minoa	minoa	51	222
10933	Montebello	montebello	51	216
10934	Myers Corner	myers-corner	51	216
10935	Nedrow	nedrow	51	222
10936	New Cassel	new-cassel	51	216
10937	North Bay Shore	north-bay-shore	51	216
10938	North Bellmore	north-bellmore	51	216
10939	North Massapequa	north-massapequa	51	216
10940	North New Hyde Park	north-new-hyde-park	51	216
10941	North Sea	north-sea	51	216
10942	North Syracuse	north-syracuse	51	222
10943	Northville	northville	51	218
10944	Orange Lake	orange-lake	51	216
10945	Otego	otego	51	224
10946	Oxford	oxford	51	219
10947	Peach Lake	peach-lake	51	216
10948	Plattekill	plattekill	51	216
10949	Port Dickinson	port-dickinson	51	219
10950	Putnam Lake	putnam-lake	51	216
10951	Queensbury	queensbury	51	218
10952	Ravena	ravena	51	218
10953	Red Oaks Mill	red-oaks-mill	51	216
10954	Rotterdam	rotterdam	51	218
10955	Round Lake	round-lake	51	218
10956	Salisbury	salisbury	51	216
10957	Scotchtown	scotchtown	51	216
10958	Scotia	scotia	51	218
10959	Searingtown	searingtown	51	216
10960	Sherrill	sherrill	51	222
10961	Sleepy Hollow	sleepy-hollow	51	216
10962	Solvay	solvay	51	222
10963	South Farmingdale	south-farmingdale	51	216
10964	South Hill	south-hill	51	222
10965	South Huntington	south-huntington	51	216
10966	South Valley Stream	south-valley-stream	51	216
10967	Spackenkill	spackenkill	51	216
11084	Clayton	clayton	7	229
10968	Terryville	terryville	51	216
10969	Tonawanda	tonawanda	51	220
10970	Tuckahoe	tuckahoe	51	216
10971	Warrensburg	warrensburg	51	218
10972	Wesley Hills	wesley-hills	51	216
10973	West Seneca	west-seneca	51	220
10974	Westmere	westmere	51	218
10975	Whitesboro	whitesboro	51	224
10976	Williamsville	williamsville	51	220
10977	Woodbury	woodbury	51	216
10978	Wurtsboro	wurtsboro	51	216
10979	Ada	ada	7	226
10980	Akron	akron	7	227
10981	Albany	albany	7	226
10982	Alexandria	alexandria	7	226
10983	Alger	alger	7	226
10984	Alliance	alliance	7	227
10985	Amanda	amanda	7	226
10986	Amelia	amelia	7	228
10987	Amherst	amherst	7	227
10988	Andover	andover	7	227
10989	Anna	anna	7	229
10990	Ansonia	ansonia	7	229
10991	Apple Creek	apple-creek	7	227
10992	Arcadia	arcadia	7	230
10993	Arcanum	arcanum	7	229
10994	Archbold	archbold	7	230
10995	Arlington	arlington	7	230
10996	Ashland	ashland	7	227
10997	Ashley	ashley	7	226
10998	Ashtabula	ashtabula	7	227
10999	Ashville	ashville	7	226
11000	Athens	athens	7	226
11001	Attica	attica	7	230
11002	Aurora	aurora	7	227
11003	Austinburg	austinburg	7	227
11004	Avon	avon	7	227
11005	Avon Lake	avon-lake	7	227
11006	Bainbridge	bainbridge	7	226
11007	Baltimore	baltimore	7	226
11008	Barberton	barberton	7	227
11009	Barnesville	barnesville	7	231
11010	Bascom	bascom	7	230
11011	Batavia	batavia	7	228
11012	Bath	bath	7	227
11013	Bay Village	bay-village	7	227
11014	Beach City	beach-city	7	227
11015	Beachwood	beachwood	7	227
11016	Beaver	beaver	7	226
11017	Bedford	bedford	7	227
11018	Bellaire	bellaire	7	231
11019	Bellbrook	bellbrook	7	229
11020	Bellefontaine	bellefontaine	7	229
11021	Bellevue	bellevue	7	230
11022	Bellville	bellville	7	227
11023	Beloit	beloit	7	232
11024	Bentonville	bentonville	7	228
11025	Berea	berea	7	227
11026	Berlin Center	berlin-center	7	232
11027	Berlin Heights	berlin-heights	7	227
11028	Bethel	bethel	7	228
11029	Bettsville	bettsville	7	230
11030	Beverly	beverly	7	233
11031	Blacklick	blacklick	7	226
11032	Blaine	blaine	7	231
11033	Blanchester	blanchester	7	228
11034	Bloomdale	bloomdale	7	230
11035	Bluffton	bluffton	7	234
11036	Bolivar	bolivar	7	227
11037	Botkins	botkins	7	229
11038	Bowerston	bowerston	7	231
11039	Bowling Green	bowling-green	7	230
11040	Bradford	bradford	7	229
11041	Brecksville	brecksville	7	227
11042	Bremen	bremen	7	226
11043	Bridgeport	bridgeport	7	231
11044	Bristolville	bristolville	7	232
11045	Broadview Heights	broadview-heights	7	227
11046	Brook Park	brook-park	7	227
11047	Brookville	brookville	7	229
11048	Brunswick	brunswick	7	227
11049	Bryan	bryan	7	230
11050	Buckeye Lake	buckeye-lake	7	226
11051	Bucyrus	bucyrus	7	226
11052	Burbank	burbank	7	227
11053	Burton	burton	7	227
11054	Byesville	byesville	7	226
11055	Cadiz	cadiz	7	231
11056	Caldwell	caldwell	7	231
11057	Cambridge	cambridge	7	226
11058	Camden	camden	7	229
11059	Campbell	campbell	7	232
11060	Canal Fulton	canal-fulton	7	227
11061	Canal Winchester	canal-winchester	7	226
11062	Canfield	canfield	7	232
11063	Canton	canton	7	227
11064	Cardington	cardington	7	226
11065	Carey	carey	7	230
11066	Carroll	carroll	7	226
11067	Carrollton	carrollton	7	227
11068	Casstown	casstown	7	229
11069	Castalia	castalia	7	227
11070	Cedarville	cedarville	7	229
11071	Celina	celina	7	229
11072	Centerburg	centerburg	7	226
11073	Chagrin Falls	chagrin-falls	7	227
11074	Chardon	chardon	7	227
11075	Chesapeake	chesapeake	7	235
11076	Cheshire	cheshire	7	235
11077	Chesterland	chesterland	7	227
11078	Chesterville	chesterville	7	226
11079	Chillicothe	chillicothe	7	226
11080	Cincinnati	cincinnati	7	228
11081	Circleville	circleville	7	226
11082	Clarksville	clarksville	7	228
11083	Clay Center	clay-center	7	230
11085	Cleveland	cleveland	7	227
11086	Cleves	cleves	7	228
11087	Clinton	clinton	7	227
11088	Clyde	clyde	7	230
11089	Coalton	coalton	7	235
11090	Coldwater	coldwater	7	229
11091	Collinsville	collinsville	7	228
11092	Columbia Station	columbia-station	7	227
11093	Columbiana	columbiana	7	232
11094	Columbus	columbus	7	226
11095	Columbus Grove	columbus-grove	7	230
11096	Conesville	conesville	7	226
11097	Conneaut	conneaut	7	227
11098	Conover	conover	7	229
11099	Continental	continental	7	230
11100	Corning	corning	7	226
11101	Cortland	cortland	7	232
11102	Coshocton	coshocton	7	226
11103	Covington	covington	7	229
11104	Crestline	crestline	7	226
11105	Creston	creston	7	227
11106	Crooksville	crooksville	7	226
11107	Cuyahoga Falls	cuyahoga-falls	7	227
11108	Dalton	dalton	7	227
11109	Danville	danville	7	226
11110	Dayton	dayton	7	229
11111	De Graff	de-graff	7	229
11112	Defiance	defiance	7	230
11113	Delaware	delaware	7	226
11114	Delphos	delphos	7	236
11115	Delta	delta	7	230
11116	Dennison	dennison	7	227
11117	Derwent	derwent	7	226
11118	Dexter City	dexter-city	7	231
11119	Diamond	diamond	7	227
11120	Dola	dola	7	226
11121	Dover	dover	7	227
11122	Doylestown	doylestown	7	227
11123	Dresden	dresden	7	237
11124	Dublin	dublin	7	226
11125	Duncan Falls	duncan-falls	7	237
11126	Dundee	dundee	7	227
11127	Dunkirk	dunkirk	7	226
11128	East Liberty	east-liberty	7	229
11129	East Liverpool	east-liverpool	7	232
11130	East Palestine	east-palestine	7	232
11131	East Sparta	east-sparta	7	227
11132	Eastlake	eastlake	7	227
11133	Eaton	eaton	7	229
11134	Edgerton	edgerton	7	230
11135	Edon	edon	7	230
11136	Elmore	elmore	7	230
11137	Elyria	elyria	7	227
11138	Englewood	englewood	7	229
11139	Enon	enon	7	229
11140	Etna	etna	7	226
11141	Euclid	euclid	7	227
11142	Evansport	evansport	7	230
11143	Fairborn	fairborn	7	229
11144	Fairfield	fairfield	7	228
11145	Fairview	fairview	7	226
11146	Fayette	fayette	7	230
11147	Fayetteville	fayetteville	7	228
11148	Felicity	felicity	7	228
11149	Findlay	findlay	7	230
11150	Fletcher	fletcher	7	229
11151	Forest	forest	7	226
11152	Fostoria	fostoria	7	230
11153	Frankfort	frankfort	7	226
11154	Franklin	franklin	7	228
11155	Fredericktown	fredericktown	7	226
11156	Fremont	fremont	7	230
11157	Fort Jennings	fort-jennings	7	230
11158	Fort Loramie	fort-loramie	7	229
11159	Galena	galena	7	226
11160	Galion	galion	7	226
11161	Gallipolis	gallipolis	7	235
11162	Galloway	galloway	7	226
11163	Gambier	gambier	7	226
11164	Garrettsville	garrettsville	7	227
11165	Gates Mills	gates-mills	7	227
11166	Geneva	geneva	7	227
11167	Georgetown	georgetown	7	228
11168	Germantown	germantown	7	229
11169	Gettysburg	gettysburg	7	229
11170	Gibsonburg	gibsonburg	7	230
11171	Girard	girard	7	232
11172	Glandorf	glandorf	7	230
11173	Gnadenhutten	gnadenhutten	7	227
11174	Grafton	grafton	7	227
11175	Grand Rapids	grand-rapids	7	230
11176	Granville	granville	7	226
11177	Gratis	gratis	7	229
11178	Green	green	7	227
11179	Greenfield	greenfield	7	228
11180	Greenville	greenville	7	229
11181	Greenwich	greenwich	7	227
11182	Grove City	grove-city	7	226
11183	Groveport	groveport	7	226
11184	Hamilton	hamilton	7	228
11185	Hamler	hamler	7	230
11186	Hammondsville	hammondsville	7	231
11187	Hannibal	hannibal	7	231
11188	Hanoverton	hanoverton	7	232
11189	Harrison	harrison	7	228
11190	Hartville	hartville	7	227
11191	Hayesville	hayesville	7	227
11192	Heath	heath	7	226
11193	Hebron	hebron	7	226
11194	Helena	helena	7	230
11195	Hicksville	hicksville	7	230
11196	Hilliard	hilliard	7	226
11197	Hillsboro	hillsboro	7	228
11198	Hiram	hiram	7	227
11199	Holgate	holgate	7	230
11200	Holland	holland	7	230
11201	Hollansburg	hollansburg	7	229
11202	Homer	homer	7	226
11203	Homerville	homerville	7	227
11204	Hopedale	hopedale	7	231
11205	Houston	houston	7	229
11206	Hubbard	hubbard	7	232
11207	Hudson	hudson	7	227
11208	Huron	huron	7	227
11209	Independence	independence	7	227
11210	Irondale	irondale	7	231
11211	Ironton	ironton	7	235
11212	Irwin	irwin	7	226
11213	Jackson	jackson	7	235
11214	Jackson Center	jackson-center	7	229
11215	Jamestown	jamestown	7	229
11216	Jefferson	jefferson	7	227
11217	Jeromesville	jeromesville	7	227
11218	Johnstown	johnstown	7	226
11219	Kalida	kalida	7	230
11220	Kent	kent	7	227
11221	Kenton	kenton	7	226
11222	Kidron	kidron	7	227
11223	Killbuck	killbuck	7	227
11224	Kings Mills	kings-mills	7	228
11225	LaGrange	lagrange	7	227
11226	Lakeside Marblehead	lakeside-marblehead	7	230
11227	Lakewood	lakewood	7	227
11228	Lancaster	lancaster	7	226
11229	Laurelville	laurelville	7	226
11230	Leavittsburg	leavittsburg	7	232
11231	Lebanon	lebanon	7	228
11232	Lees Creek	lees-creek	7	228
11233	Leesburg	leesburg	7	228
11234	Leetonia	leetonia	7	232
11235	Lewis Center	lewis-center	7	226
11236	Lewisburg	lewisburg	7	229
11237	Lewistown	lewistown	7	229
11238	Liberty Center	liberty-center	7	230
11239	Lima	lima	7	234
11240	Lisbon	lisbon	7	232
11241	Lithopolis	lithopolis	7	226
11242	Lockbourne	lockbourne	7	226
11243	Lodi	lodi	7	227
11244	Logan	logan	7	226
11245	London	london	7	226
11246	Lorain	lorain	7	227
11247	Loudonville	loudonville	7	227
11248	Louisville	louisville	7	227
11249	Loveland	loveland	7	228
11250	Lowellville	lowellville	7	232
11251	Lucas	lucas	7	227
11252	Lucasville	lucasville	7	235
11253	Lynchburg	lynchburg	7	228
11254	Macedonia	macedonia	7	227
11255	Madison	madison	7	227
11256	Maineville	maineville	7	228
11257	Malinta	malinta	7	230
11258	Mansfield	mansfield	7	227
11259	Mantua	mantua	7	227
11260	Maple Heights	maple-heights	7	227
11261	Marathon	marathon	7	228
11262	Marietta	marietta	7	233
11263	Marion	marion	7	226
11264	Martins Ferry	martins-ferry	7	231
11265	Marysville	marysville	7	226
11266	Mason	mason	7	228
11267	Massillon	massillon	7	227
11268	Maumee	maumee	7	230
11269	Maximo	maximo	7	227
11270	McArthur	mcarthur	7	235
11271	McComb	mccomb	7	230
11272	McConnelsville	mcconnelsville	7	226
11273	McDermott	mcdermott	7	235
11274	McDonald	mcdonald	7	232
11275	McGuffey	mcguffey	7	226
11276	Mechanicsburg	mechanicsburg	7	229
11277	Medina	medina	7	227
11278	Mendon	mendon	7	229
11279	Mentor	mentor	7	227
11280	Metamora	metamora	7	230
11281	Miamisburg	miamisburg	7	229
11282	Miamitown	miamitown	7	228
11283	Miamiville	miamiville	7	228
11284	Middleburg	middleburg	7	229
11285	Middlefield	middlefield	7	227
11286	Middletown	middletown	7	228
11287	Milan	milan	7	227
11288	Milford	milford	7	228
11289	Milford Center	milford-center	7	226
11290	Millbury	millbury	7	230
11291	Millersburg	millersburg	7	227
11292	Millersport	millersport	7	226
11293	Mineral City	mineral-city	7	227
11294	Mineral Ridge	mineral-ridge	7	232
11295	Minerva	minerva	7	227
11296	Minford	minford	7	235
11297	Minster	minster	7	234
11298	Monroe	monroe	7	228
11299	Monroeville	monroeville	7	227
11300	Montpelier	montpelier	7	230
11301	Morristown	morristown	7	231
11302	Morrow	morrow	7	228
11303	Mount Blanchard	mount-blanchard	7	230
11304	Mount Gilead	mount-gilead	7	226
11305	Mount Hope	mount-hope	7	227
11306	Mount Orab	mount-orab	7	228
11307	Mount Perry	mount-perry	7	226
11308	Mount Sterling	mount-sterling	7	226
11309	Mount Vernon	mount-vernon	7	226
11310	Mount Victory	mount-victory	7	226
11311	Munroe Falls	munroe-falls	7	227
11312	Napoleon	napoleon	7	230
11313	Nelsonville	nelsonville	7	226
11314	New Albany	new-albany	7	226
11315	New Bremen	new-bremen	7	234
11316	New Carlisle	new-carlisle	7	229
11317	New Concord	new-concord	7	237
11318	New Knoxville	new-knoxville	7	234
11319	New Lebanon	new-lebanon	7	229
11320	New Lexington	new-lexington	7	226
11321	New London	new-london	7	227
11322	New Madison	new-madison	7	229
11323	New Middletown	new-middletown	7	232
11324	New Philadelphia	new-philadelphia	7	227
11325	New Richmond	new-richmond	7	228
11326	New Riegel	new-riegel	7	230
11327	New Rumley	new-rumley	7	231
11328	New Springfield	new-springfield	7	232
11329	New Straitsville	new-straitsville	7	226
11330	New Vienna	new-vienna	7	228
11331	New Washington	new-washington	7	226
11332	New Waterford	new-waterford	7	232
11333	Newark	newark	7	226
11334	Newcomerstown	newcomerstown	7	227
11335	Newton Falls	newton-falls	7	232
11336	Newtonsville	newtonsville	7	228
11337	Niles	niles	7	232
11338	North Baltimore	north-baltimore	7	230
11339	North Bloomfield	north-bloomfield	7	232
11340	North Fairfield	north-fairfield	7	227
11341	North Jackson	north-jackson	7	232
11342	North Kingsville	north-kingsville	7	227
11343	North Lewisburg	north-lewisburg	7	229
11344	North Lima	north-lima	7	232
11345	North Olmsted	north-olmsted	7	227
11346	North Ridgeville	north-ridgeville	7	227
11347	North Robinson	north-robinson	7	226
11348	North Royalton	north-royalton	7	227
11349	Northfield	northfield	7	227
11350	Northwood	northwood	7	230
11351	Norwalk	norwalk	7	227
11352	Nova	nova	7	227
11353	Novelty	novelty	7	227
11354	Oak Harbor	oak-harbor	7	230
11355	Oak Hill	oak-hill	7	235
11356	Oakwood	oakwood	7	236
11357	Oberlin	oberlin	7	227
11358	Old Fort	old-fort	7	230
11359	Old Washington	old-washington	7	226
11360	Olmsted Falls	olmsted-falls	7	227
11361	Oregon	oregon	7	230
11362	Orient	orient	7	226
11363	Orrville	orrville	7	227
11364	Orwell	orwell	7	227
11365	Ostrander	ostrander	7	226
11366	Ottawa	ottawa	7	230
11367	Owensville	owensville	7	228
11368	Oxford	oxford	7	228
11369	Painesville	painesville	7	227
11370	Pataskala	pataskala	7	226
11371	Patriot	patriot	7	235
11372	Paulding	paulding	7	236
11373	Pemberville	pemberville	7	230
11374	Peninsula	peninsula	7	227
11375	Perry	perry	7	227
11376	Perrysburg	perrysburg	7	230
11377	Perrysville	perrysville	7	227
11378	Pettisville	pettisville	7	230
11379	Philo	philo	7	237
11380	Pickerington	pickerington	7	226
11381	Piketon	piketon	7	226
11382	Pioneer	pioneer	7	230
11383	Piqua	piqua	7	229
11384	Pitsburg	pitsburg	7	229
11385	Plain City	plain-city	7	226
11386	Pleasant Hill	pleasant-hill	7	229
11387	Pleasant Plain	pleasant-plain	7	228
11388	Pomeroy	pomeroy	7	235
11389	Port Clinton	port-clinton	7	230
11390	Portage	portage	7	230
11391	Portsmouth	portsmouth	7	235
11392	Powell	powell	7	226
11393	Powhatan Point	powhatan-point	7	231
11394	Proctorville	proctorville	7	235
11395	Prospect	prospect	7	226
11396	Put-in-Bay	put-in-bay	7	230
11397	Ravenna	ravenna	7	227
11398	Rawson	rawson	7	230
11399	Raymond	raymond	7	226
11400	Reedsville	reedsville	7	235
11401	Reno	reno	7	233
11402	Reynoldsburg	reynoldsburg	7	226
11403	Richfield	richfield	7	227
11404	Richwood	richwood	7	226
11405	Ridgeville Corners	ridgeville-corners	7	230
11406	Rio Grande	rio-grande	7	235
11407	Ripley	ripley	7	228
11408	Risingsun	risingsun	7	230
11409	Rittman	rittman	7	227
11410	Rock Creek	rock-creek	7	227
11411	Rockbridge	rockbridge	7	226
11412	Rockford	rockford	7	229
11413	Rocky River	rocky-river	7	227
11414	Rogers	rogers	7	232
11415	Rootstown	rootstown	7	227
11416	Roseville	roseville	7	237
11417	Ross	ross	7	228
11418	Rossford	rossford	7	230
11419	Russia	russia	7	229
11420	Sabina	sabina	7	228
11421	Salem	salem	7	232
11422	Salineville	salineville	7	232
11423	Sandusky	sandusky	7	227
11424	Sarahsville	sarahsville	7	231
11425	Sardinia	sardinia	7	228
11426	Scott	scott	7	236
11427	Sebring	sebring	7	232
11428	Senecaville	senecaville	7	226
11429	Seven Mile	seven-mile	7	228
11430	Shadyside	shadyside	7	231
11431	Shandon	shandon	7	228
11432	Sharon Center	sharon-center	7	227
11433	Sheffield Lake	sheffield-lake	7	227
11434	Shelby	shelby	7	227
11435	Sherwood	sherwood	7	230
11436	Sidney	sidney	7	229
11437	Smithville	smithville	7	227
11438	Solon	solon	7	227
11439	Somerset	somerset	7	226
11440	Somerville	somerville	7	228
11441	South Charleston	south-charleston	7	229
11442	South Lebanon	south-lebanon	7	228
11443	South Point	south-point	7	235
11444	South Webster	south-webster	7	235
11445	Sparta	sparta	7	226
11446	Spencer	spencer	7	227
11447	Spring Valley	spring-valley	7	229
11448	Springboro	springboro	7	228
11449	Springfield	springfield	7	229
11450	Saint Clairsville	saint-clairsville	7	231
11451	Saint Marys	saint-marys	7	234
11452	Saint Paris	saint-paris	7	229
11453	Stafford	stafford	7	231
11454	Steubenville	steubenville	7	231
11455	Stewart	stewart	7	226
11456	Stockdale	stockdale	7	226
11457	Stony Ridge	stony-ridge	7	230
11458	Stow	stow	7	227
11459	Streetsboro	streetsboro	7	227
11460	Strongsville	strongsville	7	227
11461	Struthers	struthers	7	232
11462	Sugar Grove	sugar-grove	7	226
11463	Sugarcreek	sugarcreek	7	227
11464	Summitville	summitville	7	232
11465	Sunbury	sunbury	7	226
11466	Swanton	swanton	7	230
11467	Sycamore	sycamore	7	230
11468	Sylvania	sylvania	7	230
11469	Tallmadge	tallmadge	7	227
11470	Terrace Park	terrace-park	7	228
11471	The Plains	the-plains	7	226
11472	Thompson	thompson	7	227
11473	Thornville	thornville	7	226
11474	Tiffin	tiffin	7	230
11475	Tipp City	tipp-city	7	229
11476	Tiro	tiro	7	226
11477	Toledo	toledo	7	230
11478	Tontogany	tontogany	7	230
11479	Toronto	toronto	7	231
11480	Trenton	trenton	7	228
11481	Troy	troy	7	229
11482	Twinsburg	twinsburg	7	227
11483	Uhrichsville	uhrichsville	7	227
11484	Union City	union-city	7	229
11485	Uniontown	uniontown	7	227
11486	Upper Sandusky	upper-sandusky	7	230
11487	Urbana	urbana	7	229
11488	Valley City	valley-city	7	227
11489	Van Buren	van-buren	7	230
11490	Van Wert	van-wert	7	236
11491	Vandalia	vandalia	7	229
11492	Vaughnsville	vaughnsville	7	230
11493	Vermilion	vermilion	7	227
11494	Versailles	versailles	7	229
11495	Wadsworth	wadsworth	7	227
11496	Wakeman	wakeman	7	227
11497	Walbridge	walbridge	7	230
11498	Wapakoneta	wapakoneta	7	234
11499	Warnock	warnock	7	231
11500	Warren	warren	7	232
11501	Warsaw	warsaw	7	226
11502	Washington Court House	washington-court-house	7	226
11503	Washingtonville	washingtonville	7	232
11504	Waterville	waterville	7	230
11505	Wauseon	wauseon	7	230
11506	Waverly	waverly	7	226
11507	Wayland	wayland	7	227
11508	Wayne	wayne	7	230
11509	Waynesfield	waynesfield	7	234
11510	Waynesville	waynesville	7	228
11511	Wellington	wellington	7	227
11512	Wellston	wellston	7	235
11513	Wellsville	wellsville	7	232
11514	West Alexandria	west-alexandria	7	229
11515	Olde West Chester	olde-west-chester	7	228
11516	West Jefferson	west-jefferson	7	226
11517	West Lafayette	west-lafayette	7	226
11518	West Liberty	west-liberty	7	229
11519	West Manchester	west-manchester	7	229
11520	West Milton	west-milton	7	229
11521	West Portsmouth	west-portsmouth	7	235
11522	West Rushville	west-rushville	7	226
11523	West Salem	west-salem	7	227
11524	West Union	west-union	7	228
11525	West Unity	west-unity	7	230
11526	Westerville	westerville	7	226
11527	Westfield Center	westfield-center	7	227
11528	Westlake	westlake	7	227
11529	Weston	weston	7	230
11530	Westville	westville	7	229
11531	Wheelersburg	wheelersburg	7	235
11532	Whitehouse	whitehouse	7	230
11533	Wickliffe	wickliffe	7	227
11534	Wilberforce	wilberforce	7	229
11535	Willard	willard	7	227
11536	Williamsburg	williamsburg	7	228
11537	Williamsport	williamsport	7	226
11538	Willoughby	willoughby	7	227
11539	Willow Wood	willow-wood	7	235
11540	Wilmington	wilmington	7	228
11541	Windham	windham	7	227
11542	Woodsfield	woodsfield	7	231
11543	Woodville	woodville	7	230
11544	Wooster	wooster	7	227
11545	Xenia	xenia	7	229
11546	Yellow Springs	yellow-springs	7	229
11547	Youngstown	youngstown	7	232
11548	Zanesville	zanesville	7	237
11549	Zoar	zoar	7	227
11550	Austintown	austintown	7	232
11551	Bainbridge	bainbridge	7	227
11552	Beavercreek	beavercreek	7	229
11553	Beckett Ridge	beckett-ridge	7	228
11554	Belpre	belpre	7	233
11555	Bexley	bexley	7	226
11556	Blue Ash	blue-ash	7	228
11557	Boardman	boardman	7	232
11558	Bridgetown North	bridgetown-north	7	228
11559	Brooklyn	brooklyn	7	227
11560	Brooklyn Heights	brooklyn-heights	7	227
11561	Calcutta	calcutta	7	232
11562	Centerville	centerville	7	229
11563	Cleveland Heights	cleveland-heights	7	227
11564	Cuyahoga Heights	cuyahoga-heights	7	227
11565	Delhi	delhi	7	228
11566	Dent	dent	7	228
11567	Dry Run	dry-run	7	228
11568	East Cleveland	east-cleveland	7	227
11569	Evendale	evendale	7	228
11570	Fairlawn	fairlawn	7	227
11571	Fairview Park	fairview-park	7	227
11572	Finneytown	finneytown	7	228
11573	Forest Park	forest-park	7	228
11574	Gahanna	gahanna	7	226
11575	Garfield Heights	garfield-heights	7	227
11576	Grandview	grandview	7	228
11577	Highland Heights	highland-heights	7	227
11578	Howland Center	howland-center	7	232
11579	Huber Heights	huber-heights	7	229
11580	Indian Hill	indian-hill	7	228
11581	Kenwood	kenwood	7	228
11582	Kettering	kettering	7	229
11583	Kirtland	kirtland	7	227
11584	Lakemore	lakemore	7	227
11585	Landen	landen	7	228
11586	Leipsic	leipsic	7	230
11587	Lexington	lexington	7	227
11588	Lincoln Village	lincoln-village	7	226
11589	Lordstown	lordstown	7	232
11590	Lyndhurst	lyndhurst	7	227
11591	Madeira	madeira	7	228
11592	Malvern	malvern	7	227
11593	Mariemont	mariemont	7	228
11594	Mayfield	mayfield	7	227
11595	Mayfield Heights	mayfield-heights	7	227
11596	Middleburg Heights	middleburg-heights	7	227
11597	Montgomery	montgomery	7	228
11598	Montrose-Ghent	montrose-ghent	7	227
11599	Moraine	moraine	7	229
11600	Moreland Hills	moreland-hills	7	227
11601	Mount Carmel	mount-carmel	7	228
11602	Mount Healthy	mount-healthy	7	228
11603	Mount Repose	mount-repose	7	228
11604	New Franklin	new-franklin	7	227
11605	North Canton	north-canton	7	227
11606	Northgate	northgate	7	228
11607	Norton	norton	7	227
11608	Norwood	norwood	7	228
11609	Oakwood	oakwood	7	229
11610	Ontario	ontario	7	227
11611	Parma	parma	7	227
11612	Parma Heights	parma-heights	7	227
11613	Pepper Pike	pepper-pike	7	227
11614	Perry Heights	perry-heights	7	227
11615	Poland	poland	7	232
11616	Portage Lakes	portage-lakes	7	227
11617	Reading	reading	7	228
11618	Richmond Heights	richmond-heights	7	227
11619	Riverside	riverside	7	229
11620	Sandusky South	sandusky-south	7	227
11621	Sciotodale	sciotodale	7	235
11622	Seven Hills	seven-hills	7	227
11623	Seville	seville	7	227
11624	Shaker Heights	shaker-heights	7	227
11625	Sharonville	sharonville	7	228
11626	South Euclid	south-euclid	7	227
11627	South Russell	south-russell	7	227
11628	Springdale	springdale	7	228
11629	Saint Henry	saint-henry	7	229
11630	Trotwood	trotwood	7	229
11631	University Heights	university-heights	7	227
11632	Upper Arlington	upper-arlington	7	226
11633	Valley View	valley-view	7	227
11634	Warrensville Heights	warrensville-heights	7	227
11635	West Carrollton	west-carrollton	7	229
11636	Wetherington	wetherington	7	228
11637	White Oak	white-oak	7	228
11638	Whitehall	whitehall	7	226
11639	Willowick	willowick	7	227
11640	Wintersville	wintersville	7	231
11641	Withamsville	withamsville	7	228
11642	Woodbourne-Hyde Park	woodbourne-hyde-park	7	229
11643	Worthington	worthington	7	226
11644	Wyoming	wyoming	7	228
11645	Ada	ada	32	238
11646	Adair	adair	32	239
11647	Afton	afton	32	240
11648	Agra	agra	32	241
11649	Alex	alex	32	241
11650	Altus	altus	32	242
11651	Alva	alva	32	241
11652	Anadarko	anadarko	32	241
11653	Antlers	antlers	32	238
11654	Apache	apache	32	241
11655	Ardmore	ardmore	32	238
11656	Arnett	arnett	32	241
11657	Asher	asher	32	241
11658	Atoka	atoka	32	238
11659	Barnsdall	barnsdall	32	239
11660	Bartlesville	bartlesville	32	239
11661	Beaver	beaver	32	243
11662	Beggs	beggs	32	239
11663	Bessie	bessie	32	241
11664	Bethany	bethany	32	241
11665	Billings	billings	32	241
11666	Binger	binger	32	241
11667	Bixby	bixby	32	239
11668	Blackwell	blackwell	32	241
11669	Blanchard	blanchard	32	241
11670	Bluejacket	bluejacket	32	239
11671	Boise City	boise-city	32	243
11672	Bokoshe	bokoshe	32	244
11673	Bray	bray	32	242
11674	Bristow	bristow	32	239
11675	Broken Arrow	broken-arrow	32	239
11676	Broken Bow	broken-bow	32	245
11677	Buffalo	buffalo	32	241
11678	Bunch	bunch	32	239
11679	Burns Flat	burns-flat	32	241
11680	Calera	calera	32	238
11681	Calumet	calumet	32	241
11682	Calvin	calvin	32	241
11683	Carnegie	carnegie	32	241
11684	Cashion	cashion	32	241
11685	Catoosa	catoosa	32	239
11686	Chandler	chandler	32	241
11687	Checotah	checotah	32	239
11688	Chelsea	chelsea	32	239
11689	Cherokee	cherokee	32	241
11690	Cheyenne	cheyenne	32	241
11691	Chickasha	chickasha	32	241
11692	Choctaw	choctaw	32	241
11693	Chouteau	chouteau	32	239
11694	Claremore	claremore	32	239
11695	Clarita	clarita	32	238
11696	Clayton	clayton	32	238
11697	Cleveland	cleveland	32	239
11698	Clinton	clinton	32	241
11699	Coalgate	coalgate	32	238
11700	Colcord	colcord	32	239
11701	Coleman	coleman	32	238
11702	Collinsville	collinsville	32	239
11703	Commerce	commerce	32	240
11704	Copan	copan	32	239
11705	New Cordell	new-cordell	32	241
11706	Covington	covington	32	241
11707	Coweta	coweta	32	239
11708	Crescent	crescent	32	241
11709	Cromwell	cromwell	32	241
11710	Crowder	crowder	32	239
11711	Cushing	cushing	32	241
11712	Cyril	cyril	32	241
11713	Dacoma	dacoma	32	241
11714	Davenport	davenport	32	241
11715	Dewar	dewar	32	239
11716	Dewey	dewey	32	239
11717	Drumright	drumright	32	239
11718	Duncan	duncan	32	242
11719	Durant	durant	32	238
11720	Eakly	eakly	32	241
11721	Earlsboro	earlsboro	32	241
11722	Edmond	edmond	32	241
11723	El Reno	el-reno	32	241
11724	Eldorado	eldorado	32	242
11725	Elk City	elk-city	32	241
11726	Enid	enid	32	241
11727	Eufaula	eufaula	32	239
11728	Fairfax	fairfax	32	239
11729	Fairland	fairland	32	240
11730	Fairview	fairview	32	241
11731	Fletcher	fletcher	32	242
11732	Forgan	forgan	32	243
11733	Foyil	foyil	32	239
11734	Frederick	frederick	32	242
11735	Freedom	freedom	32	241
11736	Fort Cobb	fort-cobb	32	241
11737	Fort Gibson	fort-gibson	32	239
11738	Fort Sill	fort-sill	32	242
11739	Gans	gans	32	244
11740	Garber	garber	32	241
11741	Geronimo	geronimo	32	242
11742	Glencoe	glencoe	32	241
11743	Glenpool	glenpool	32	239
11744	Goodwell	goodwell	32	243
11745	Gore	gore	32	244
11746	Gracemont	gracemont	32	241
11747	Grant	grant	32	238
11748	Grove	grove	32	239
11749	Guthrie	guthrie	32	241
11750	Guymon	guymon	32	243
11751	Haileyville	haileyville	32	239
11752	Hammon	hammon	32	241
11753	Hanna	hanna	32	239
11754	Harrah	harrah	32	241
11755	Hartshorne	hartshorne	32	239
11756	Haskell	haskell	32	239
11757	Haworth	haworth	32	245
11758	Healdton	healdton	32	238
11759	Heavener	heavener	32	244
11760	Hennessey	hennessey	32	241
11761	Henryetta	henryetta	32	239
11762	Hinton	hinton	32	241
11763	Hobart	hobart	32	241
11764	Holdenville	holdenville	32	241
11765	Hollis	hollis	32	241
11766	Hominy	hominy	32	239
11767	Hugo	hugo	32	238
11768	Hulbert	hulbert	32	239
11769	Idabel	idabel	32	245
11770	Indiahoma	indiahoma	32	242
11771	Indianola	indianola	32	239
11772	Inola	inola	32	239
11773	Jay	jay	32	239
11774	Jenks	jenks	32	239
11775	Kaw City	kaw-city	32	241
11776	Kellyville	kellyville	32	239
11777	Keota	keota	32	239
11778	Ketchum	ketchum	32	239
11779	Kingfisher	kingfisher	32	241
11780	Kingston	kingston	32	238
11781	Kinta	kinta	32	239
11782	Konawa	konawa	32	241
11783	Kremlin	kremlin	32	241
11784	Lamont	lamont	32	241
11785	Langley	langley	32	239
11786	Langston	langston	32	241
11787	Laverne	laverne	32	241
11788	Lawton	lawton	32	242
11789	Le Flore	le-flore	32	244
11790	Leonard	leonard	32	239
11791	Lexington	lexington	32	241
11792	Lindsay	lindsay	32	241
11793	Locust Grove	locust-grove	32	239
11794	Lone Wolf	lone-wolf	32	241
11795	Lookeba	lookeba	32	241
11796	Madill	madill	32	238
11797	Mangum	mangum	32	241
11798	Mannford	mannford	32	239
11799	Marietta	marietta	32	238
11800	Marlow	marlow	32	242
11801	Maud	maud	32	241
11802	McAlester	mcalester	32	239
11803	McLoud	mcloud	32	241
11804	Medford	medford	32	241
11805	Miami	miami	32	240
11806	Milfay	milfay	32	239
11807	Moodys	moodys	32	239
11808	Mooreland	mooreland	32	241
11809	Morrison	morrison	32	241
11810	Mounds	mounds	32	239
11811	Mountain View	mountain-view	32	241
11812	Muskogee	muskogee	32	239
11813	Mustang	mustang	32	241
11814	Newcastle	newcastle	32	241
11815	Newkirk	newkirk	32	241
11816	Noble	noble	32	241
11817	Norman	norman	32	241
11818	Nowata	nowata	32	239
11819	Oaks	oaks	32	239
11820	Oilton	oilton	32	239
11821	Okarche	okarche	32	241
11822	Okeene	okeene	32	241
11823	Okemah	okemah	32	241
11824	Oklahoma City	oklahoma-city	32	241
11825	Okmulgee	okmulgee	32	239
11826	Omega	omega	32	241
11827	Oologah	oologah	32	239
11828	Owasso	owasso	32	239
11829	Panama	panama	32	244
11830	Paoli	paoli	32	241
11831	Park Hill	park-hill	32	239
11832	Pauls Valley	pauls-valley	32	241
11833	Pawhuska	pawhuska	32	239
11834	Pawnee	pawnee	32	239
11835	Perkins	perkins	32	241
11836	Perry	perry	32	241
11837	Picher	picher	32	240
11838	Piedmont	piedmont	32	241
11839	Pocola	pocola	32	244
11840	Ponca City	ponca-city	32	241
11841	Pond Creek	pond-creek	32	241
11842	Porum	porum	32	239
11843	Poteau	poteau	32	244
11844	Prue	prue	32	239
11845	Pryor Creek	pryor-creek	32	239
11846	Purcell	purcell	32	241
11847	Quapaw	quapaw	32	240
11848	Quinton	quinton	32	239
11849	Ramona	ramona	32	239
11850	Rattan	rattan	32	238
11851	Red Oak	red-oak	32	239
11852	Red Rock	red-rock	32	241
11853	Ripley	ripley	32	241
11854	Roland	roland	32	244
11855	Salina	salina	32	239
11856	Sallisaw	sallisaw	32	244
11857	Sand Springs	sand-springs	32	239
11858	Sapulpa	sapulpa	32	239
11859	Sayre	sayre	32	241
11860	Schulter	schulter	32	239
11861	Seminole	seminole	32	241
11862	Sentinel	sentinel	32	241
11863	Shattuck	shattuck	32	241
11864	Shawnee	shawnee	32	241
11865	Shidler	shidler	32	239
11866	Skiatook	skiatook	32	239
11867	Smithville	smithville	32	245
11868	South Coffeyville	south-coffeyville	32	239
11869	Sperry	sperry	32	239
11870	Spiro	spiro	32	244
11871	Stidham	stidham	32	239
11872	Stigler	stigler	32	239
11873	Stillwater	stillwater	32	241
11874	Stilwell	stilwell	32	239
11875	Stonewall	stonewall	32	238
11876	Stringtown	stringtown	32	238
11877	Stroud	stroud	32	241
11878	Stuart	stuart	32	241
11879	Sulphur	sulphur	32	241
11880	Tahlequah	tahlequah	32	239
11881	Talihina	talihina	32	244
11882	Taloga	taloga	32	241
11883	Terral	terral	32	242
11884	Tishomingo	tishomingo	32	238
11885	Tonkawa	tonkawa	32	241
11886	Tulsa	tulsa	32	239
11887	Tupelo	tupelo	32	238
11888	Valliant	valliant	32	245
11889	Velma	velma	32	242
11890	Vian	vian	32	244
11891	Vici	vici	32	241
11892	Vinita	vinita	32	239
11893	Wagoner	wagoner	32	239
11894	Wakita	wakita	32	241
11895	Walters	walters	32	242
11896	Wanette	wanette	32	241
11897	Warner	warner	32	239
11898	Watonga	watonga	32	241
11899	Watts	watts	32	239
11900	Waukomis	waukomis	32	241
11901	Waurika	waurika	32	242
11902	Wayne	wayne	32	241
11903	Weatherford	weatherford	32	241
11904	Webbers Falls	webbers-falls	32	239
11905	Weleetka	weleetka	32	241
11906	Wellston	wellston	32	241
11907	Westville	westville	32	239
11908	Wetumka	wetumka	32	241
11909	Wewoka	wewoka	32	241
11910	Wilburton	wilburton	32	239
11911	Woodward	woodward	32	241
11912	Wright City	wright-city	32	245
11913	Wyandotte	wyandotte	32	240
11914	Wynona	wynona	32	239
11915	Yale	yale	32	241
11916	Yukon	yukon	32	241
11917	Colbert	colbert	32	238
11918	Del City	del-city	32	241
11919	Elgin	elgin	32	242
11920	Midwest City	midwest-city	32	241
11921	Moore	moore	32	241
11922	Prague	prague	32	241
11923	Snyder	snyder	32	241
11924	Tuttle	tuttle	32	241
11925	Adams	adams	47	246
11926	Adrian	adrian	47	247
11927	Agness	agness	47	248
11928	Albany	albany	47	249
11929	Alsea	alsea	47	250
11930	Amity	amity	47	249
11931	Arlington	arlington	47	249
11932	Ashland	ashland	47	248
11933	Astoria	astoria	47	249
11934	Athena	athena	47	246
11935	Aumsville	aumsville	47	249
11936	Aurora	aurora	47	249
11937	Baker City	baker-city	47	249
11938	Bandon	bandon	47	250
11939	Banks	banks	47	249
11940	Beavercreek	beavercreek	47	249
11941	Beaverton	beaverton	47	249
11942	Bend	bend	47	251
11943	Blachly	blachly	47	250
11944	Bly	bly	47	248
11945	Boardman	boardman	47	249
11946	Boring	boring	47	249
11947	Brookings	brookings	47	248
11948	Brothers	brothers	47	251
11949	Brownsville	brownsville	47	249
11950	Burns	burns	47	249
11951	Butte Falls	butte-falls	47	248
11952	Camas Valley	camas-valley	47	250
11953	Camp Sherman	camp-sherman	47	249
11954	Canby	canby	47	249
11955	Cannon Beach	cannon-beach	47	249
11956	Canyonville	canyonville	47	250
11957	Cascade Locks	cascade-locks	47	249
11958	Cave Junction	cave-junction	47	248
11959	Central Point	central-point	47	248
11960	Chemult	chemult	47	248
11961	Chiloquin	chiloquin	47	248
11962	Christmas Valley	christmas-valley	47	248
11963	Clackamas	clackamas	47	249
11964	Clatskanie	clatskanie	47	249
11965	Colton	colton	47	249
11966	Condon	condon	47	249
11967	Coos Bay	coos-bay	47	250
11968	Coquille	coquille	47	250
11969	Corbett	corbett	47	249
11970	Cornelius	cornelius	47	249
11971	Corvallis	corvallis	47	250
11972	Cottage Grove	cottage-grove	47	250
11973	Cove	cove	47	249
11974	Crabtree	crabtree	47	249
11975	Crane	crane	47	249
11976	Creswell	creswell	47	250
11977	Culver	culver	47	249
11978	Dallas	dallas	47	249
11979	Days Creek	days-creek	47	250
11980	Dayton	dayton	47	249
11981	Deer Island	deer-island	47	249
11982	Depoe Bay	depoe-bay	47	249
11983	Diamond	diamond	47	249
11984	Drain	drain	47	250
11985	Dufur	dufur	47	249
11986	Dundee	dundee	47	249
11987	Eagle Creek	eagle-creek	47	249
11988	Eagle Point	eagle-point	47	248
11989	Echo	echo	47	246
11990	Elgin	elgin	47	249
11991	Elkton	elkton	47	250
11992	Elmira	elmira	47	250
11993	Enterprise	enterprise	47	252
11994	Estacada	estacada	47	249
11995	Eugene	eugene	47	250
11996	Fairview	fairview	47	249
11997	Falls City	falls-city	47	249
11998	Fields	fields	47	249
11999	Florence	florence	47	250
12000	Forest Grove	forest-grove	47	249
12001	Fossil	fossil	47	249
12002	Gardiner	gardiner	47	250
12003	Gaston	gaston	47	249
12004	Gervais	gervais	47	249
12005	Gladstone	gladstone	47	249
12006	Glendale	glendale	47	250
12007	Gleneden Beach	gleneden-beach	47	249
12008	Glide	glide	47	250
12009	Gold Beach	gold-beach	47	248
12010	Grand Ronde	grand-ronde	47	249
12011	Grants Pass	grants-pass	47	248
12012	Grass Valley	grass-valley	47	249
12013	Gresham	gresham	47	249
12014	Halfway	halfway	47	249
12015	Halsey	halsey	47	249
12016	Harrisburg	harrisburg	47	249
12017	Hebo	hebo	47	249
12018	Helix	helix	47	246
12019	Heppner	heppner	47	249
12020	Hermiston	hermiston	47	246
12021	Hillsboro	hillsboro	47	249
12022	Hines	hines	47	249
12023	Hood River	hood-river	47	249
12024	Hubbard	hubbard	47	249
12025	Imbler	imbler	47	249
12026	Independence	independence	47	249
12027	Jacksonville	jacksonville	47	248
12028	Jefferson	jefferson	47	249
12029	John Day	john-day	47	249
12030	Joseph	joseph	47	252
12031	Junction City	junction-city	47	250
12032	Keizer	keizer	47	249
12033	Keno	keno	47	248
12034	Klamath Falls	klamath-falls	47	248
12035	La Grande	la-grande	47	249
12036	La Pine	la-pine	47	251
12037	Lake Oswego	lake-oswego	47	249
12038	Lakeside	lakeside	47	250
12039	Lakeview	lakeview	47	248
12040	Langlois	langlois	47	248
12041	Lebanon	lebanon	47	249
12042	Lexington	lexington	47	249
12043	Lincoln City	lincoln-city	47	249
12044	Lowell	lowell	47	250
12045	Lyons	lyons	47	249
12046	Madras	madras	47	249
12047	Mapleton	mapleton	47	250
12048	Marcola	marcola	47	250
12049	Marion	marion	47	249
12050	Marylhurst	marylhurst	47	249
12051	McMinnville	mcminnville	47	249
12052	Medford	medford	47	248
12053	Merlin	merlin	47	248
12054	Mill City	mill-city	47	249
12055	Milton-Freewater	milton-freewater	47	246
12056	Mitchell	mitchell	47	249
12057	Molalla	molalla	47	249
12058	Monroe	monroe	47	250
12059	Mosier	mosier	47	249
12060	Mount Angel	mount-angel	47	249
12061	Parkdale	parkdale	47	249
12062	Mount Vernon	mount-vernon	47	249
12063	Murphy	murphy	47	248
12064	Myrtle Creek	myrtle-creek	47	250
12065	Myrtle Point	myrtle-point	47	250
12066	Newberg	newberg	47	249
12067	Newport	newport	47	249
12068	North Bend	north-bend	47	250
12069	North Plains	north-plains	47	249
12070	North Powder	north-powder	47	249
12071	Nyssa	nyssa	47	247
12072	Oakland	oakland	47	250
12073	Oakridge	oakridge	47	250
12074	Ontario	ontario	47	247
12075	Oregon City	oregon-city	47	249
12076	Paisley	paisley	47	248
12077	Pendleton	pendleton	47	246
12078	Philomath	philomath	47	250
12079	Phoenix	phoenix	47	248
12080	Pilot Rock	pilot-rock	47	246
12081	Pleasant Hill	pleasant-hill	47	250
12082	Port Orford	port-orford	47	248
12083	Portland	portland	47	249
12084	Powers	powers	47	250
12085	Prineville	prineville	47	249
12086	Prospect	prospect	47	248
12087	Rainier	rainier	47	249
12088	Redmond	redmond	47	251
12089	Reedsport	reedsport	47	250
12090	Riddle	riddle	47	250
12091	Rockaway Beach	rockaway-beach	47	249
12092	Rogue River	rogue-river	47	248
12093	Roseburg	roseburg	47	250
12094	Rufus	rufus	47	249
12095	Salem	salem	47	249
12096	Sandy	sandy	47	249
12097	Scappoose	scappoose	47	249
12098	Scio	scio	47	249
12099	Seal Rock	seal-rock	47	249
12100	Seaside	seaside	47	249
12101	Selma	selma	47	248
12102	Sheridan	sheridan	47	249
12103	Sherwood	sherwood	47	249
12104	Silver Lake	silver-lake	47	248
12105	Silverton	silverton	47	249
12106	Sisters	sisters	47	251
12107	South Beach	south-beach	47	249
12108	Spray	spray	47	249
12109	Springfield	springfield	47	250
12110	Saint Benedict	saint-benedict	47	249
12111	Saint Helens	saint-helens	47	249
12112	Saint Paul	saint-paul	47	249
12113	Stanfield	stanfield	47	246
12114	Stayton	stayton	47	249
12115	Sutherlin	sutherlin	47	250
12116	Sweet Home	sweet-home	47	249
12117	Talent	talent	47	248
12118	Tangent	tangent	47	249
12119	The Dalles	the-dalles	47	249
12120	Tillamook	tillamook	47	249
12121	Troutdale	troutdale	47	249
12122	Tualatin	tualatin	47	249
12123	Turner	turner	47	249
12124	Ukiah	ukiah	47	246
12125	Umatilla	umatilla	47	246
12126	Union	union	47	249
12127	Vale	vale	47	247
12128	Veneta	veneta	47	250
12129	Vernonia	vernonia	47	249
12130	Vida	vida	47	250
12131	Wallowa	wallowa	47	252
12132	Warm Springs	warm-springs	47	249
12133	Warrenton	warrenton	47	249
12134	Wasco	wasco	47	249
12135	West Linn	west-linn	47	249
12136	Weston	weston	47	246
12137	Wheeler	wheeler	47	249
12138	White City	white-city	47	248
12139	Willamina	willamina	47	249
12140	Williams	williams	47	248
12141	Wilsonville	wilsonville	47	249
12142	Winston	winston	47	250
12143	Woodburn	woodburn	47	249
12144	Yachats	yachats	47	249
12145	Yamhill	yamhill	47	249
12146	Yoncalla	yoncalla	47	250
12147	Aloha	aloha	47	249
12148	Damascus	damascus	47	249
12149	Happy Valley	happy-valley	47	249
12150	Manzanita	manzanita	47	249
12151	Milwaukie	milwaukie	47	249
12152	Monmouth	monmouth	47	249
12153	Mulino	mulino	47	249
12154	Oak Grove	oak-grove	47	249
12155	Oatfield	oatfield	47	249
12156	Sunnyside	sunnyside	47	249
12157	Three Rivers	three-rivers	47	251
12158	Tigard	tigard	47	249
12159	Waldport	waldport	47	249
12160	West Haven-Sylvan	west-haven-sylvan	47	249
12161	Aaronsburg	aaronsburg	45	253
12162	Abington	abington	45	254
12163	Acme	acme	45	255
12164	Adamsburg	adamsburg	45	255
12165	Adamstown	adamstown	45	256
12166	Addison	addison	45	253
12167	Akron	akron	45	256
12168	Albion	albion	45	257
12169	Aleppo	aleppo	45	255
12170	Aliquippa	aliquippa	45	255
12171	Allentown	allentown	45	254
12172	Altoona	altoona	45	253
12173	Ambler	ambler	45	254
12174	Ambridge	ambridge	45	255
12175	Anita	anita	45	253
12176	Annville	annville	45	256
12177	Apollo	apollo	45	255
12178	Archbald	archbald	45	258
12179	Arcola	arcola	45	254
12180	Ardmore	ardmore	45	254
12181	Ashland	ashland	45	258
12182	Atglen	atglen	45	254
12183	Athens	athens	45	258
12184	Auburn	auburn	45	258
12185	Audubon	audubon	45	254
12186	Aultman	aultman	45	255
12187	Avondale	avondale	45	254
12188	Baden	baden	45	255
12189	Bala Cynwyd	bala-cynwyd	45	254
12190	Bangor	bangor	45	254
12191	Barnesville	barnesville	45	258
12192	Barto	barto	45	254
12193	Bartonsville	bartonsville	45	258
12194	Bath	bath	45	254
12195	Beaver	beaver	45	255
12196	Beaver Falls	beaver-falls	45	255
12197	Beavertown	beavertown	45	258
12198	Bechtelsville	bechtelsville	45	254
12199	Bedford	bedford	45	253
12200	Bedminster	bedminster	45	254
12201	North Belle Vernon	north-belle-vernon	45	255
12202	Bellefonte	bellefonte	45	253
12203	Belleville	belleville	45	256
12204	Bellwood	bellwood	45	253
12205	Bendersville	bendersville	45	256
12206	Bensalem	bensalem	45	254
12207	Bentleyville	bentleyville	45	255
12208	Benton	benton	45	258
12209	Berlin	berlin	45	253
12210	Bernville	bernville	45	254
12211	Berwick	berwick	45	258
12212	Berwyn	berwyn	45	254
12213	Bessemer	bessemer	45	255
12214	Bethel	bethel	45	254
12215	Bethel Park	bethel-park	45	255
12216	Bethlehem	bethlehem	45	254
12217	Bigler	bigler	45	253
12218	Biglerville	biglerville	45	256
12219	Birdsboro	birdsboro	45	254
12220	Blain	blain	45	256
12221	Blairsville	blairsville	45	255
12222	Blandon	blandon	45	254
12223	Blooming Glen	blooming-glen	45	254
12224	Bloomsburg	bloomsburg	45	258
12225	Blue Ball	blue-ball	45	256
12226	Blue Bell	blue-bell	45	254
12227	Boalsburg	boalsburg	45	253
12228	Bobtown	bobtown	45	255
12229	Boiling Springs	boiling-springs	45	256
12230	Boswell	boswell	45	253
12231	Bovard	bovard	45	255
12232	Boyertown	boyertown	45	254
12233	Brackenridge	brackenridge	45	255
12234	Braddock	braddock	45	255
12235	Bradford	bradford	45	259
12236	Branchton	branchton	45	255
12237	Breezewood	breezewood	45	253
12238	Breinigsville	breinigsville	45	254
12239	Bridgeport	bridgeport	45	254
12240	Bridgeville	bridgeville	45	255
12241	Bristol	bristol	45	254
12242	Broad Top City	broad-top-city	45	253
12243	Brockport	brockport	45	253
12244	Brockway	brockway	45	253
12245	Brodheadsville	brodheadsville	45	258
12246	Brookhaven	brookhaven	45	254
12247	Brookville	brookville	45	253
12248	Broomall	broomall	45	254
12249	Brownsville	brownsville	45	255
12250	Bryn Athyn	bryn-athyn	45	254
12251	Bryn Mawr	bryn-mawr	45	254
12252	Buffalo Mills	buffalo-mills	45	253
12253	Burgettstown	burgettstown	45	255
12254	Burnham	burnham	45	256
12255	Butler	butler	45	255
12256	Byrnedale	byrnedale	45	253
12257	Cairnbrook	cairnbrook	45	253
12258	California	california	45	255
12259	Cambridge Springs	cambridge-springs	45	257
12260	Camp Hill	camp-hill	45	256
12261	Campbelltown	campbelltown	45	256
12262	Canadensis	canadensis	45	258
12263	Canonsburg	canonsburg	45	255
12264	Canton	canton	45	258
12265	Carbondale	carbondale	45	258
12266	Carlisle	carlisle	45	256
12267	Carmichaels	carmichaels	45	255
12268	Carnegie	carnegie	45	255
12269	Carrolltown	carrolltown	45	253
12270	Carversville	carversville	45	254
12271	Catasauqua	catasauqua	45	254
12272	Catawissa	catawissa	45	258
12273	Center Valley	center-valley	45	254
12274	Central City	central-city	45	253
12275	Centre Hall	centre-hall	45	253
12276	Chadds Ford	chadds-ford	45	254
12277	Chalfont	chalfont	45	254
12278	Chambersburg	chambersburg	45	256
12279	Champion	champion	45	255
12280	Cheltenham	cheltenham	45	254
12281	Chester	chester	45	254
12282	Chester Heights	chester-heights	45	254
12283	Chester Springs	chester-springs	45	254
12284	Cheswick	cheswick	45	255
12285	Cheyney	cheyney	45	254
12286	Christiana	christiana	45	256
12287	Clairton	clairton	45	255
12288	Clarion	clarion	45	255
12289	Clarks Summit	clarks-summit	45	258
12290	Claysburg	claysburg	45	253
12291	Claysville	claysville	45	255
12292	Clearfield	clearfield	45	253
12293	Clifton Heights	clifton-heights	45	254
12294	Clinton	clinton	45	255
12295	Clymer	clymer	45	255
12296	Coal Center	coal-center	45	255
12297	Coatesville	coatesville	45	254
12298	Cocolamus	cocolamus	45	256
12299	Collegeville	collegeville	45	254
12300	Colmar	colmar	45	254
12301	Columbia	columbia	45	256
12302	Commodore	commodore	45	255
12303	Concordville	concordville	45	254
12304	Conestoga	conestoga	45	256
12305	Confluence	confluence	45	253
12306	Connellsville	connellsville	45	255
12307	Connoquenessing	connoquenessing	45	255
12308	Conshohocken	conshohocken	45	254
12309	Conyngham	conyngham	45	258
12310	Coopersburg	coopersburg	45	254
12311	Cooperstown	cooperstown	45	255
12312	Coplay	coplay	45	254
12313	Coraopolis	coraopolis	45	255
12314	Cornwall	cornwall	45	256
12315	Corry	corry	45	257
12316	Coudersport	coudersport	45	259
12317	Cranberry Township	cranberry-township	45	255
12318	Cranesville	cranesville	45	257
12319	Cresco	cresco	45	258
12320	Cressona	cressona	45	258
12321	Crown	crown	45	255
12322	Croydon	croydon	45	254
12323	Crucible	crucible	45	255
12324	Crum Lynne	crum-lynne	45	254
12325	Curllsville	curllsville	45	255
12326	Curtisville	curtisville	45	255
12327	Curwensville	curwensville	45	253
12328	Custer City	custer-city	45	259
12329	Dallas	dallas	45	258
12330	Dallastown	dallastown	45	256
12331	Danboro	danboro	45	254
12332	Danielsville	danielsville	45	254
12333	Danville	danville	45	258
12334	Darby	darby	45	254
12335	Darlington	darlington	45	255
12336	Dauphin	dauphin	45	256
12337	Davidsville	davidsville	45	253
12338	Delaware Water Gap	delaware-water-gap	45	258
12339	Denver	denver	45	256
12340	Derry	derry	45	255
12341	Devault	devault	45	254
12342	Devon	devon	45	254
12343	Dickson City	dickson-city	45	258
12344	Dillsburg	dillsburg	45	256
12345	Donora	donora	45	255
12346	Douglassville	douglassville	45	254
12347	Dover	dover	45	256
12348	Downingtown	downingtown	45	254
12349	Doylestown	doylestown	45	254
12350	Dravosburg	dravosburg	45	255
12351	Dresher	dresher	45	254
12352	DuBois	dubois	45	253
12353	Dublin	dublin	45	254
12354	Duke Center	duke-center	45	259
12355	Duncannon	duncannon	45	256
12356	Duncansville	duncansville	45	253
12357	Duquesne	duquesne	45	255
12358	Duryea	duryea	45	258
12359	Dushore	dushore	45	258
12360	Eagleville	eagleville	45	254
12361	East Freedom	east-freedom	45	253
12362	East Greenville	east-greenville	45	254
12363	East Petersburg	east-petersburg	45	256
12364	East Pittsburgh	east-pittsburgh	45	255
12365	East Stroudsburg	east-stroudsburg	45	258
12366	Easton	easton	45	254
12367	Ebensburg	ebensburg	45	253
12368	Edinboro	edinboro	45	257
12369	Eighty Four	eighty-four	45	255
12370	Eldred	eldred	45	259
12371	Elizabeth	elizabeth	45	255
12372	Elizabethtown	elizabethtown	45	256
12373	Elizabethville	elizabethville	45	256
12374	Elkland	elkland	45	260
12375	Ellsworth	ellsworth	45	255
12376	Ellwood City	ellwood-city	45	255
12377	Elverson	elverson	45	254
12378	Elysburg	elysburg	45	258
12379	Emigsville	emigsville	45	256
12380	Emmaus	emmaus	45	254
12381	Emporium	emporium	45	253
12382	Enola	enola	45	256
12383	Ephrata	ephrata	45	256
12384	Erie	erie	45	257
12385	Erwinna	erwinna	45	254
12386	Goldsboro	goldsboro	45	256
12387	Everett	everett	45	253
12388	Export	export	45	255
12389	Exton	exton	45	254
12390	Factoryville	factoryville	45	258
12391	Fairfield	fairfield	45	256
12392	Fairless Hills	fairless-hills	45	254
12393	Fairview	fairview	45	257
12394	Fairview Village	fairview-village	45	254
12395	Farrell	farrell	45	261
12396	Fawn Grove	fawn-grove	45	256
12397	Fayette City	fayette-city	45	255
12398	Feasterville-Trevose	feasterville-trevose	45	254
12399	Ferndale	ferndale	45	253
12400	Fishertown	fishertown	45	253
12401	Fleetwood	fleetwood	45	254
12402	Flourtown	flourtown	45	254
12403	Fogelsville	fogelsville	45	254
12404	Folcroft	folcroft	45	254
12405	Folsom	folsom	45	254
12406	Fombell	fombell	45	255
12407	Ford City	ford-city	45	255
12408	Forest City	forest-city	45	258
12409	Fountainville	fountainville	45	254
12410	Foxburg	foxburg	45	255
12411	Frackville	frackville	45	258
12412	Franconia	franconia	45	254
12413	Franklin	franklin	45	255
12414	Frederick	frederick	45	254
12415	Fredericksburg	fredericksburg	45	256
12416	Fredericktown	fredericktown	45	255
12417	Freedom	freedom	45	255
12418	Freeland	freeland	45	258
12419	Freeport	freeport	45	255
12420	Friedens	friedens	45	253
12421	Fort Loudon	fort-loudon	45	256
12422	Fort Washington	fort-washington	45	254
12423	Galeton	galeton	45	259
12424	Gap	gap	45	256
12425	Gardners	gardners	45	256
12426	Gastonville	gastonville	45	255
12427	Germansville	germansville	45	254
12428	Gettysburg	gettysburg	45	256
12429	Gibsonia	gibsonia	45	255
12430	Gilbertsville	gilbertsville	45	254
12431	Gillett	gillett	45	258
12432	Girard	girard	45	257
12433	Gladwyne	gladwyne	45	254
12434	Glassport	glassport	45	255
12435	Glen Mills	glen-mills	45	254
12436	Glen Riddle Lima	glen-riddle-lima	45	254
12437	Glen Rock	glen-rock	45	256
12438	Glenmoore	glenmoore	45	254
12439	Glenolden	glenolden	45	254
12440	Glenshaw	glenshaw	45	255
12441	Glenside	glenside	45	254
12442	Goodville	goodville	45	256
12443	Gowen City	gowen-city	45	258
12444	Gradyville	gradyville	45	254
12445	Grand Valley	grand-valley	45	257
12446	Grantham	grantham	45	256
12447	Grantville	grantville	45	256
12448	Gratz	gratz	45	256
12449	Greencastle	greencastle	45	256
12450	Greensboro	greensboro	45	255
12451	Greensburg	greensburg	45	255
12452	Greenville	greenville	45	261
12453	Grindstone	grindstone	45	255
12454	Grove City	grove-city	45	261
12455	Gwynedd	gwynedd	45	254
12456	Gwynedd Valley	gwynedd-valley	45	254
12457	Hadley	hadley	45	261
12458	Halifax	halifax	45	256
12459	Hamburg	hamburg	45	254
12460	Hanover	hanover	45	256
12461	Harleysville	harleysville	45	254
12462	Harmony	harmony	45	255
12463	Harrisburg	harrisburg	45	256
12464	Harrison Valley	harrison-valley	45	259
12465	Harveys Lake	harveys-lake	45	258
12466	Hastings	hastings	45	253
12467	Hatboro	hatboro	45	254
12468	Hatfield	hatfield	45	254
12469	Havertown	havertown	45	254
12470	Hawley	hawley	45	258
12471	Hazleton	hazleton	45	258
12472	Hegins	hegins	45	258
12473	Hellertown	hellertown	45	254
12474	Herminie	herminie	45	255
12475	Hermitage	hermitage	45	261
12476	Herndon	herndon	45	258
12477	Hershey	hershey	45	256
12478	Hickory	hickory	45	255
12479	Holicong	holicong	45	254
12480	Hollidaysburg	hollidaysburg	45	253
12481	Hollsopple	hollsopple	45	253
12482	Holmes	holmes	45	254
12483	Homer City	homer-city	45	255
12484	Homestead	homestead	45	255
12485	Honesdale	honesdale	45	258
12486	Hookstown	hookstown	45	255
12487	Hop Bottom	hop-bottom	45	258
12488	Horsham	horsham	45	254
12489	Houston	houston	45	255
12490	Houtzdale	houtzdale	45	253
12491	Howard	howard	45	253
12492	Hummelstown	hummelstown	45	256
12493	Hunker	hunker	45	255
12494	Huntingdon	huntingdon	45	253
12495	Huntington Mills	huntington-mills	45	258
12496	Hyde Park	hyde-park	45	255
12497	Imperial	imperial	45	255
12498	Indiana	indiana	45	255
12499	Indianola	indianola	45	255
12500	Industry	industry	45	255
12501	Intercourse	intercourse	45	256
12502	Irvine	irvine	45	257
12503	Irwin	irwin	45	255
12504	James City	james-city	45	253
12505	Jamestown	jamestown	45	261
12506	Jamison	jamison	45	254
12507	Jeannette	jeannette	45	255
12508	Jefferson	jefferson	45	255
12509	Jenkintown	jenkintown	45	254
12510	Jermyn	jermyn	45	258
12511	Jerome	jerome	45	253
12512	Jersey Shore	jersey-shore	45	258
12513	Jessup	jessup	45	258
12514	Jim Thorpe	jim-thorpe	45	258
12515	Johnstown	johnstown	45	253
12516	Jones Mills	jones-mills	45	255
12517	Jonestown	jonestown	45	256
12518	Kane	kane	45	259
12519	Karns City	karns-city	45	255
12520	Kemblesville	kemblesville	45	254
12521	Kennett Square	kennett-square	45	254
12522	Kimberton	kimberton	45	254
12523	King of Prussia	king-of-prussia	45	254
12524	Kingston	kingston	45	258
12525	Kintnersville	kintnersville	45	254
12526	Kinzers	kinzers	45	256
12527	Kittanning	kittanning	45	255
12528	Klingerstown	klingerstown	45	258
12529	Knox	knox	45	255
12530	Kresgeville	kresgeville	45	258
12531	Kulpsville	kulpsville	45	254
12532	Kutztown	kutztown	45	254
12533	La Plume	la-plume	45	258
12534	Lafayette Hill	lafayette-hill	45	254
12535	Lairdsville	lairdsville	45	258
12536	Lake Ariel	lake-ariel	45	258
12537	Lake City	lake-city	45	257
12538	Lampeter	lampeter	45	256
12539	Lancaster	lancaster	45	256
12540	Landenberg	landenberg	45	254
12541	Langhorne	langhorne	45	254
12542	Lansdale	lansdale	45	254
12543	Lansdowne	lansdowne	45	254
12544	Lansford	lansford	45	258
12545	Laporte	laporte	45	258
12546	Latrobe	latrobe	45	255
12547	Lawrence	lawrence	45	255
12548	Lebanon	lebanon	45	256
12549	Leechburg	leechburg	45	255
12550	Leesport	leesport	45	254
12551	Leetsdale	leetsdale	45	255
12552	Lehighton	lehighton	45	258
12553	Lehman	lehman	45	258
12554	Lemont	lemont	45	253
12555	Lemont Furnace	lemont-furnace	45	255
12556	Lemoyne	lemoyne	45	256
12557	Lenni	lenni	45	254
12558	Levittown	levittown	45	254
12559	Lewis Run	lewis-run	45	259
12560	Lewisberry	lewisberry	45	256
12561	Lewisburg	lewisburg	45	258
12562	Lewistown	lewistown	45	256
12563	Ligonier	ligonier	45	255
12564	Lincoln University	lincoln-university	45	254
12565	Line Lexington	line-lexington	45	254
12566	Lititz	lititz	45	256
12567	Littlestown	littlestown	45	256
12568	Lock Haven	lock-haven	45	258
12569	Loretto	loretto	45	253
12570	Loysburg	loysburg	45	253
12571	Loysville	loysville	45	256
12572	Lykens	lykens	45	256
12573	Lyndell	lyndell	45	254
12574	Macungie	macungie	45	254
12575	Mahaffey	mahaffey	45	253
12576	Mahanoy City	mahanoy-city	45	258
12577	Mainesburg	mainesburg	45	260
12578	Mainland	mainland	45	254
12579	Malvern	malvern	45	254
12580	Mammoth	mammoth	45	255
12581	Manchester	manchester	45	256
12582	Manheim	manheim	45	256
12583	Mansfield	mansfield	45	260
12584	Marlin	marlin	45	258
12585	Marcus Hook	marcus-hook	45	254
12586	Marianna	marianna	45	255
12587	Marienville	marienville	45	255
12588	Marietta	marietta	45	256
12589	Markleysburg	markleysburg	45	255
12590	Mars	mars	45	255
12591	Marysville	marysville	45	256
12592	Masontown	masontown	45	255
12593	Matamoras	matamoras	45	262
12594	McConnellsburg	mcconnellsburg	45	263
12595	McDonald	mcdonald	45	255
12596	McKean	mckean	45	257
12597	McKees Rocks	mckees-rocks	45	255
12598	McKeesport	mckeesport	45	255
12599	McSherrystown	mcsherrystown	45	256
12600	McVeytown	mcveytown	45	256
12601	Meadowlands	meadowlands	45	255
12602	Meadville	meadville	45	257
12603	Mechanicsburg	mechanicsburg	45	256
12604	Media	media	45	254
12605	Mendenhall	mendenhall	45	254
12606	Mercer	mercer	45	261
12607	Mercersburg	mercersburg	45	256
12608	Merion Station	merion-station	45	254
12609	Mertztown	mertztown	45	254
12610	Meshoppen	meshoppen	45	258
12611	Meyersdale	meyersdale	45	253
12612	Middleburg	middleburg	45	258
12613	Middletown	middletown	45	256
12614	Midland	midland	45	255
12615	Mifflin	mifflin	45	256
12616	Mifflinburg	mifflinburg	45	258
12617	Mifflintown	mifflintown	45	256
12618	Milanville	milanville	45	258
12619	Milesburg	milesburg	45	253
12620	Milford	milford	45	262
12621	Mill Hall	mill-hall	45	258
12622	Millersburg	millersburg	45	256
12623	Millersville	millersville	45	256
12624	Millheim	millheim	45	253
12625	Millville	millville	45	258
12626	Milroy	milroy	45	256
12627	Milton	milton	45	258
12628	Minisink Hills	minisink-hills	45	258
12629	Mohnton	mohnton	45	254
12630	Monaca	monaca	45	255
12631	Monessen	monessen	45	255
12632	Monongahela	monongahela	45	255
12633	Monroe	monroe	45	258
12634	Monroeville	monroeville	45	255
12635	Mont Alto	mont-alto	45	256
12636	Montgomery	montgomery	45	258
12637	Montgomeryville	montgomeryville	45	254
12638	Montoursville	montoursville	45	258
12639	Montrose	montrose	45	258
12640	Moosic	moosic	45	258
12641	Morgan	morgan	45	255
12642	Morgantown	morgantown	45	254
12643	Morrisville	morrisville	45	254
12644	Moscow	moscow	45	258
12645	Mount Carmel	mount-carmel	45	258
12646	Mount Holly Springs	mount-holly-springs	45	256
12647	Mount Joy	mount-joy	45	256
12648	Mount Pleasant	mount-pleasant	45	255
12649	Mount Pocono	mount-pocono	45	258
12650	Mount Union	mount-union	45	253
12651	Mountain Top	mountain-top	45	258
12652	Mountainhome	mountainhome	45	258
12653	Mountville	mountville	45	256
12654	Muncy	muncy	45	258
12655	Murrysville	murrysville	45	255
12656	Myerstown	myerstown	45	256
12657	Nanticoke	nanticoke	45	258
12658	Nanty-Glo	nanty-glo	45	253
12659	Narberth	narberth	45	254
12660	Natrona Heights	natrona-heights	45	255
12661	Nazareth	nazareth	45	254
12662	Nesquehoning	nesquehoning	45	258
12663	New Bedford	new-bedford	45	255
12664	New Berlin	new-berlin	45	258
12665	New Bethlehem	new-bethlehem	45	255
12666	New Bloomfield	new-bloomfield	45	256
12667	New Brighton	new-brighton	45	255
12668	New Castle	new-castle	45	255
12669	New Cumberland	new-cumberland	45	256
12670	New Enterprise	new-enterprise	45	253
12671	New Freedom	new-freedom	45	256
12672	New Holland	new-holland	45	256
12673	New Hope	new-hope	45	254
12674	New Kensington	new-kensington	45	255
12675	New Kingstown	new-kingstown	45	256
12676	New Oxford	new-oxford	45	256
12677	New Philadelphia	new-philadelphia	45	258
12678	New Tripoli	new-tripoli	45	254
12679	New Wilmington	new-wilmington	45	255
12680	Newmanstown	newmanstown	45	256
12681	Newport	newport	45	256
12682	Newtown	newtown	45	254
12683	Newtown Square	newtown-square	45	254
12684	Newville	newville	45	256
12685	Nicholson	nicholson	45	258
12686	Norristown	norristown	45	254
12687	North East	north-east	45	257
12688	North Versailles	north-versailles	45	255
12689	North Wales	north-wales	45	254
12690	Northampton	northampton	45	254
12691	Northern Cambria	northern-cambria	45	253
12692	Northumberland	northumberland	45	258
12693	Norwood	norwood	45	254
12694	Nottingham	nottingham	45	254
12695	Oak Ridge	oak-ridge	45	255
12696	Oakdale	oakdale	45	255
12697	Oakmont	oakmont	45	255
12698	Oaks	oaks	45	254
12699	Oil City	oil-city	45	255
12700	Oley	oley	45	254
12701	Olyphant	olyphant	45	258
12702	Orangeville	orangeville	45	258
12703	Orbisonia	orbisonia	45	253
12704	Orefield	orefield	45	254
12705	Oreland	oreland	45	254
12706	Orrstown	orrstown	45	256
12707	Orrtanna	orrtanna	45	256
12708	Orwigsburg	orwigsburg	45	258
12709	Osceola Mills	osceola-mills	45	253
12710	Oxford	oxford	45	254
12711	Palm	palm	45	254
12712	Palmerton	palmerton	45	258
12713	Palmyra	palmyra	45	256
12714	Paoli	paoli	45	254
12715	Paradise	paradise	45	256
12716	Parker	parker	45	255
12717	Parkesburg	parkesburg	45	254
12718	Patton	patton	45	253
12719	Paxinos	paxinos	45	258
12720	Peach Bottom	peach-bottom	45	256
12721	Peach Glen	peach-glen	45	256
12722	Pen Argyl	pen-argyl	45	254
12723	Penn Run	penn-run	45	255
12724	Penns Park	penns-park	45	254
12725	Pennsburg	pennsburg	45	254
12726	Perkasie	perkasie	45	254
12727	Perryopolis	perryopolis	45	255
12728	Petersburg	petersburg	45	253
12729	Philadelphia	philadelphia	45	254
12730	Philipsburg	philipsburg	45	253
12731	Phoenixville	phoenixville	45	254
12732	Pine Grove	pine-grove	45	258
12733	Pipersville	pipersville	45	254
12734	Pittsburgh	pittsburgh	45	255
12735	Pittston	pittston	45	258
12736	Pleasantville	pleasantville	45	255
12737	Plumsteadville	plumsteadville	45	254
12738	Plymouth	plymouth	45	258
12739	Plymouth Meeting	plymouth-meeting	45	254
12740	Pocono Manor	pocono-manor	45	258
12741	Pocopson	pocopson	45	254
12742	Port Allegany	port-allegany	45	259
12743	Portersville	portersville	45	255
12744	Pottersdale	pottersdale	45	253
12745	Pottstown	pottstown	45	254
12746	Pottsville	pottsville	45	258
12747	Prospect Park	prospect-park	45	254
12748	Punxsutawney	punxsutawney	45	253
12749	Quakertown	quakertown	45	254
12750	Quarryville	quarryville	45	256
12751	Railroad	railroad	45	256
12752	Ralston	ralston	45	258
12753	Reading	reading	45	254
12754	Rebuck	rebuck	45	258
12755	Rector	rector	45	255
12756	Red Hill	red-hill	45	254
12757	Red Lion	red-lion	45	256
12758	Reinholds	reinholds	45	256
12759	Reynoldsville	reynoldsville	45	253
12760	Rheems	rheems	45	256
12761	Richboro	richboro	45	254
12762	Richfield	richfield	45	256
12763	Richland	richland	45	256
12764	Ridgway	ridgway	45	253
12765	Ridley Park	ridley-park	45	254
12766	Riegelsville	riegelsville	45	254
12767	Rimersburg	rimersburg	45	255
12768	Roaring Spring	roaring-spring	45	253
12769	Robesonia	robesonia	45	254
12770	Robinson Township	robinson-township	45	255
12771	Rochester	rochester	45	255
12772	Rockhill	rockhill	45	253
12773	Rockwood	rockwood	45	253
12774	Rome	rome	45	258
12775	Rowland	rowland	45	262
12776	Royersford	royersford	45	254
12777	Russellton	russellton	45	255
12778	Sabinsville	sabinsville	45	260
12779	Sacramento	sacramento	45	258
12780	Saegertown	saegertown	45	257
12781	Salford	salford	45	254
12782	Sarver	sarver	45	255
12783	Sassamansville	sassamansville	45	254
12784	Saxonburg	saxonburg	45	255
12785	Saxton	saxton	45	253
12786	Sayre	sayre	45	258
12787	Schnecksville	schnecksville	45	254
12788	Schuylkill Haven	schuylkill-haven	45	258
12789	Schwenksville	schwenksville	45	254
12790	Scotland	scotland	45	256
12791	Scotrun	scotrun	45	258
12792	Scottdale	scottdale	45	255
12793	Scranton	scranton	45	258
12794	Selinsgrove	selinsgrove	45	258
12795	Sellersville	sellersville	45	254
12796	Seneca	seneca	45	255
12797	Seven Valleys	seven-valleys	45	256
12798	Sewickley	sewickley	45	255
12799	Shady Grove	shady-grove	45	256
12800	Shamokin	shamokin	45	258
12801	Shamokin Dam	shamokin-dam	45	258
12802	Shanksville	shanksville	45	253
12803	Sharon	sharon	45	261
12804	Sharon Hill	sharon-hill	45	254
13027	Nixon	nixon	45	255
12805	Sharpsville	sharpsville	45	261
12806	Shavertown	shavertown	45	258
12807	Shenandoah	shenandoah	45	258
12808	Shickshinny	shickshinny	45	258
12809	Shinglehouse	shinglehouse	45	259
12810	Shippensburg	shippensburg	45	256
12811	Shippenville	shippenville	45	255
12812	Shrewsbury	shrewsbury	45	256
12813	Sidman	sidman	45	253
12814	Skippack	skippack	45	254
12815	Slatington	slatington	45	254
12816	Slickville	slickville	45	255
12817	Sligo	sligo	45	255
12818	Slippery Rock	slippery-rock	45	255
12819	Slovan	slovan	45	255
12820	Smethport	smethport	45	259
12821	Smoketown	smoketown	45	256
12822	Snow Shoe	snow-shoe	45	253
12823	Somerset	somerset	45	253
12824	Souderton	souderton	45	254
12825	South Canaan	south-canaan	45	258
12826	South Mountain	south-mountain	45	256
12827	Southampton	southampton	45	254
12828	Southeastern	southeastern	45	254
12829	Spartansburg	spartansburg	45	257
12830	Spring Church	spring-church	45	255
12831	Spring City	spring-city	45	254
12832	Spring Grove	spring-grove	45	256
12833	Spring House	spring-house	45	254
12834	Spring Mills	spring-mills	45	253
12835	Springdale	springdale	45	255
12836	Springfield	springfield	45	254
12837	Springtown	springtown	45	254
12838	Saint Clair	saint-clair	45	258
12839	Saint Marys	saint-marys	45	253
12840	Saint Michael	saint-michael	45	253
12841	Stahlstown	stahlstown	45	255
12842	State College	state-college	45	253
12843	Stewartstown	stewartstown	45	256
12844	Stoneboro	stoneboro	45	261
12845	Stony Run	stony-run	45	254
12846	Strasburg	strasburg	45	256
12847	Strattanville	strattanville	45	255
12848	Stroudsburg	stroudsburg	45	258
12849	Summerdale	summerdale	45	256
12850	Summit Hill	summit-hill	45	258
12851	Sunbury	sunbury	45	258
12852	Susquehanna	susquehanna	45	258
12853	Swarthmore	swarthmore	45	254
12854	Swiftwater	swiftwater	45	258
12855	Tamaqua	tamaqua	45	258
12856	Tannersville	tannersville	45	258
12857	Tarentum	tarentum	45	255
12858	Telford	telford	45	254
12859	Temple	temple	45	254
12860	Thorndale	thorndale	45	254
12861	Thornton	thornton	45	254
12862	Tioga	tioga	45	260
12863	Tionesta	tionesta	45	255
12864	Tipton	tipton	45	253
12865	Titusville	titusville	45	257
12866	Tobyhanna	tobyhanna	45	258
12867	Topton	topton	45	254
12868	Towanda	towanda	45	258
12869	Tower City	tower-city	45	258
12870	Trafford	trafford	45	255
12871	Transfer	transfer	45	261
12872	Trevorton	trevorton	45	258
12873	Trexlertown	trexlertown	45	254
12874	Trout Run	trout-run	45	258
12875	Troy	troy	45	258
12876	Tunkhannock	tunkhannock	45	258
12877	Turtle Creek	turtle-creek	45	255
12878	Tyrone	tyrone	45	253
12879	Union City	union-city	45	257
12880	Uniontown	uniontown	45	255
12881	Unionville	unionville	45	254
12882	Upper Black Eddy	upper-black-eddy	45	254
12883	Upper Darby	upper-darby	45	254
12884	Valencia	valencia	45	255
12885	Valley Forge	valley-forge	45	254
12886	Valley View	valley-view	45	258
12887	Vandergrift	vandergrift	45	255
12888	Venango	venango	45	257
12889	Venetia	venetia	45	255
12890	Venus	venus	45	255
12891	Verona	verona	45	255
12892	Vintondale	vintondale	45	253
12893	Wagontown	wagontown	45	254
12894	Wallaceton	wallaceton	45	253
12895	Walnut Bottom	walnut-bottom	45	256
12896	Wapwallopen	wapwallopen	45	258
12897	Warfordsburg	warfordsburg	45	263
12898	Warminster	warminster	45	254
12899	Warren	warren	45	257
12900	Warrendale	warrendale	45	255
12901	Warriors Mark	warriors-mark	45	253
12902	Washington	washington	45	255
12903	Washington Crossing	washington-crossing	45	254
12904	Waterfall	waterfall	45	263
12905	Waterford	waterford	45	257
12906	Watsontown	watsontown	45	258
12907	Waymart	waymart	45	258
12908	Wayne	wayne	45	254
12909	Waynesboro	waynesboro	45	256
12910	Waynesburg	waynesburg	45	255
12911	Weatherly	weatherly	45	258
12912	Webster	webster	45	255
12913	Wellsboro	wellsboro	45	260
12914	Wernersville	wernersville	45	254
12915	West Chester	west-chester	45	254
12916	West Decatur	west-decatur	45	253
12917	West Grove	west-grove	45	254
12918	West Middlesex	west-middlesex	45	261
12919	West Mifflin	west-mifflin	45	255
12920	West Newton	west-newton	45	255
12921	West Point	west-point	45	254
12922	West Sunbury	west-sunbury	45	255
12923	Westfield	westfield	45	260
12924	Westover	westover	45	253
12925	Wexford	wexford	45	255
12926	Whitehall	whitehall	45	255
12927	Whitney	whitney	45	255
12928	Wilkes-Barre	wilkes-barre	45	258
12929	Williamsburg	williamsburg	45	253
12930	Williamsport	williamsport	45	258
12931	Williamstown	williamstown	45	256
12932	Willow Grove	willow-grove	45	254
12933	Willow Hill	willow-hill	45	256
12934	Willow Street	willow-street	45	256
12935	Wilmerding	wilmerding	45	255
12936	Wilmore	wilmore	45	253
12937	Wind Gap	wind-gap	45	254
12938	Wind Ridge	wind-ridge	45	255
12939	Womelsdorf	womelsdorf	45	254
12940	Wrightsville	wrightsville	45	256
12941	Wyalusing	wyalusing	45	258
12942	Wycombe	wycombe	45	254
12943	Wyncote	wyncote	45	254
12944	Wyoming	wyoming	45	258
12945	York	york	45	256
12946	York Haven	york-haven	45	256
12947	York Springs	york-springs	45	256
12948	Youngstown	youngstown	45	255
12949	Youngsville	youngsville	45	257
12950	Youngwood	youngwood	45	255
12951	Yukon	yukon	45	255
12952	Zelienople	zelienople	45	255
12953	Zieglerville	zieglerville	45	254
12954	Aldan	aldan	45	254
12955	Amity Gardens	amity-gardens	45	254
12956	Arlington Heights	arlington-heights	45	258
12957	Aston	aston	45	254
12958	Baidland	baidland	45	255
12959	Baldwin	baldwin	45	255
12960	Bellevue	bellevue	45	255
12961	Big Beaver	big-beaver	45	255
12962	Boothwyn	boothwyn	45	254
12963	Brentwood	brentwood	45	255
12964	Bressler-Enhaut-Oberlin	bressler-enhaut-oberlin	45	256
12965	Brittany Farms-Highlands	brittany-farms-highlands	45	254
12966	Cecil-Bishop	cecil-bishop	45	255
12967	Charleroi	charleroi	45	255
12968	Chesterbrook	chesterbrook	45	254
12969	Chicora	chicora	45	255
12970	Churchville	churchville	45	254
12971	Colonial Park	colonial-park	45	256
12972	Conneaut Lakeshore	conneaut-lakeshore	45	257
12973	Cornwells Heights-Eddington	cornwells-heights-eddington	45	254
12974	Crafton	crafton	45	255
12975	Delmont	delmont	45	255
12976	Dunmore	dunmore	45	258
12977	East Berlin	east-berlin	45	256
12978	East Norriton	east-norriton	45	254
12979	East York	east-york	45	256
12980	Economy	economy	45	255
12981	Ephrata Township	ephrata-township	45	256
12982	Exeter	exeter	45	258
12983	Flying Hills	flying-hills	45	254
12984	Forest Hills	forest-hills	45	255
12985	Fort Indiantown Gap	fort-indiantown-gap	45	256
12986	Fountain Hill	fountain-hill	45	254
12987	Fox Chapel	fox-chapel	45	255
12988	Franklin Park	franklin-park	45	255
12989	Grantley	grantley	45	256
12990	Hallam	hallam	45	256
12991	Hampton Township	hampton-township	45	255
12992	Haverford	haverford	45	254
12993	Highspire	highspire	45	256
12994	Homeacre	homeacre	45	255
12995	Honey Brook	honey-brook	45	254
12996	Jefferson Hills	jefferson-hills	45	255
12997	Kenilworth	kenilworth	45	254
12998	Lake Meade	lake-meade	45	256
12999	Laureldale	laureldale	45	254
13000	Lawnton	lawnton	45	256
13001	Lawson Heights	lawson-heights	45	255
13002	Leacock-Leola-Bareville	leacock-leola-bareville	45	256
13003	Lima	lima	45	254
13004	Lincoln	lincoln	45	255
13005	Linglestown	linglestown	45	256
13006	Lionville	lionville	45	254
13007	Lower Allen	lower-allen	45	256
13008	Lower Burrell	lower-burrell	45	255
13009	Manor	manor	45	255
13010	Maple Glen	maple-glen	45	254
13011	McCandless	mccandless	45	255
13012	McGovern	mcgovern	45	255
13013	McMurray	mcmurray	45	255
13014	Meridian	meridian	45	255
13015	Middletown	middletown	45	254
13016	Millerton	millerton	45	260
13017	Moon	moon	45	255
13018	Mount Cobb	mount-cobb	45	258
13019	Mount Lebanon	mount-lebanon	45	255
13020	Mount Wolf	mount-wolf	45	256
13021	Munhall	munhall	45	255
13022	Nether Providence Township	nether-providence-township	45	254
13023	New Britain	new-britain	45	254
13024	New Milford	new-milford	45	258
13025	New Salem Borough	new-salem-borough	45	256
13026	Newtown Grant	newtown-grant	45	254
13028	Northwest Harborcreek	northwest-harborcreek	45	257
13029	O Hara Township	o-hara-township	45	255
13030	Palmer Heights	palmer-heights	45	254
13031	Park Forest Village	park-forest-village	45	253
13032	Parkville	parkville	45	256
13033	Paxtonia	paxtonia	45	256
13034	Penn Hills	penn-hills	45	255
13035	Penn Wynne	penn-wynne	45	254
13036	Penndel	penndel	45	254
13037	Pleasant Hills	pleasant-hills	45	255
13038	Plum	plum	45	255
13039	Pocono Pines	pocono-pines	45	258
13040	Port Royal	port-royal	45	256
13041	Portage	portage	45	253
13042	Pottsgrove	pottsgrove	45	254
13043	Progress	progress	45	256
13044	Renovo	renovo	45	258
13045	Ross Township	ross-township	45	255
13046	Rutherford	rutherford	45	256
13047	Salunga-Landisville	salunga-landisville	45	256
13048	Sanatoga	sanatoga	45	254
13049	Schlusser	schlusser	45	256
13050	Scott Township	scott-township	45	255
13051	Shanor-Northvue	shanor-northvue	45	255
13052	Shillington	shillington	45	254
13053	Shiloh	shiloh	45	256
13054	Shiremanstown	shiremanstown	45	256
13055	Sinking Spring	sinking-spring	45	254
13056	Skyline View	skyline-view	45	256
13057	South Park Township	south-park-township	45	255
13058	Spry	spry	45	256
13059	Saint Lawrence	saint-lawrence	45	254
13060	Stockertown	stockertown	45	254
13061	Stonybrook	stonybrook	45	256
13062	Susquehanna Trails	susquehanna-trails	45	256
13063	Swissvale	swissvale	45	255
13064	Thompsonville	thompsonville	45	255
13065	Tinicum Township	tinicum-township	45	254
13066	Trappe	trappe	45	254
13067	Trooper	trooper	45	254
13068	Trumbauersville	trumbauersville	45	254
13069	Upper Providence Township	upper-providence-township	45	254
13070	Upper Saint Clair	upper-saint-clair	45	255
13071	Valley Green	valley-green	45	256
13072	Weigelstown	weigelstown	45	256
13073	West Conshohocken	west-conshohocken	45	254
13074	West Goshen	west-goshen	45	254
13075	West Norriton	west-norriton	45	254
13076	Westmont	westmont	45	253
13077	White Haven	white-haven	45	258
13078	White Oak	white-oak	45	255
13079	Wilkinsburg	wilkinsburg	45	255
13080	Windber	windber	45	253
13081	Woodbourne	woodbourne	45	254
13082	Woodside	woodside	45	254
13083	Wormleysburg	wormleysburg	45	256
13084	Wyndmoor	wyndmoor	45	254
13085	Wyomissing	wyomissing	45	254
13086	Yardley	yardley	45	254
13087	Yorklyn	yorklyn	45	256
13088	Zion	zion	45	253
13089	Barrington	barrington	42	264
13090	Bristol	bristol	42	264
13091	Central Falls	central-falls	42	264
13092	Charlestown	charlestown	42	264
13093	Clayville	clayville	42	264
13094	Coventry	coventry	42	264
13095	Cranston	cranston	42	264
13096	Cumberland	cumberland	42	264
13097	East Greenwich	east-greenwich	42	264
13098	East Providence	east-providence	42	264
13099	Exeter	exeter	42	264
13100	Foster	foster	42	264
13101	Jamestown	jamestown	42	264
13102	Johnston	johnston	42	264
13103	Lincoln	lincoln	42	264
13104	Little Compton	little-compton	42	264
13105	Middletown	middletown	42	264
13106	Narragansett	narragansett	42	264
13107	Newport	newport	42	264
13108	North Kingstown	north-kingstown	42	264
13109	North Providence	north-providence	42	264
13110	North Smithfield	north-smithfield	42	264
13111	Pawtucket	pawtucket	42	264
13112	Portsmouth	portsmouth	42	264
13113	Providence	providence	42	264
13114	Smithfield	smithfield	42	264
13115	Warren	warren	42	264
13116	Warwick	warwick	42	264
13117	West Greenwich	west-greenwich	42	264
13118	West Warwick	west-warwick	42	264
13119	Woonsocket	woonsocket	42	264
13120	Burrillville	burrillville	42	264
13121	Glocester	glocester	42	264
13122	Hopkinton	hopkinton	42	264
13123	Richmond	richmond	42	264
13124	Scituate	scituate	42	264
13125	South Kingstown	south-kingstown	42	264
13126	Tiverton	tiverton	42	264
13127	Westerly	westerly	42	264
13128	Abbeville	abbeville	39	265
13129	Aiken	aiken	39	266
13130	Allendale	allendale	39	266
13131	Anderson	anderson	39	265
13132	Andrews	andrews	39	267
13133	Arcadia	arcadia	39	265
13134	Ballentine	ballentine	39	268
13135	Bamberg	bamberg	39	266
13136	Barnwell	barnwell	39	266
13137	Batesburg-Leesville	batesburg-leesville	39	268
13138	Bath	bath	39	266
13139	Beaufort	beaufort	39	269
13140	Belton	belton	39	265
13141	Bennettsville	bennettsville	39	270
13142	Bishopville	bishopville	39	268
13143	Blacksburg	blacksburg	39	265
13144	Blackville	blackville	39	266
13145	Bluffton	bluffton	39	269
13146	Blythewood	blythewood	39	268
13147	Branchville	branchville	39	268
13148	Calhoun Falls	calhoun-falls	39	265
13149	Camden	camden	39	268
13150	Campobello	campobello	39	265
13151	Cayce	cayce	39	268
13152	Central	central	39	265
13153	Chapin	chapin	39	268
13154	Charleston	charleston	39	267
13155	Joint Base Charleston	joint-base-charleston	39	267
13156	Cheraw	cheraw	39	271
13157	Chesnee	chesnee	39	265
13158	Chester	chester	39	271
13159	Chesterfield	chesterfield	39	271
13160	Clemson	clemson	39	265
13161	Clinton	clinton	39	265
13162	Clover	clover	39	271
13163	Columbia	columbia	39	268
13164	Conway	conway	39	270
13165	Cottageville	cottageville	39	267
13166	Dalzell	dalzell	39	268
13167	Darlington	darlington	39	270
13168	Denmark	denmark	39	266
13169	Dillon	dillon	39	270
13170	Dorchester	dorchester	39	267
13171	Due West	due-west	39	265
13172	Duncan	duncan	39	265
13173	Early Branch	early-branch	39	269
13174	Easley	easley	39	265
13175	Eastover	eastover	39	268
13176	Edgefield	edgefield	39	266
13177	Seabrook Island	seabrook-island	39	267
13178	Effingham	effingham	39	270
13179	Elgin	elgin	39	268
13180	Estill	estill	39	269
13181	Fair Play	fair-play	39	265
13182	Fairfax	fairfax	39	266
13183	Fairforest	fairforest	39	265
13184	Florence	florence	39	270
13185	Folly Beach	folly-beach	39	267
13186	Fountain Inn	fountain-inn	39	265
13187	Fort Lawn	fort-lawn	39	271
13188	Fort Mill	fort-mill	39	271
13189	Gaffney	gaffney	39	265
13190	Gaston	gaston	39	268
13191	Georgetown	georgetown	39	267
13192	Gilbert	gilbert	39	268
13193	Glendale	glendale	39	265
13194	Goose Creek	goose-creek	39	267
13195	Graniteville	graniteville	39	266
13196	Gray Court	gray-court	39	265
13197	Green Sea	green-sea	39	270
13198	Greenville	greenville	39	265
13199	Greenwood	greenwood	39	265
13200	Greer	greer	39	265
13201	Hamer	hamer	39	270
13202	Hampton	hampton	39	269
13203	Hardeeville	hardeeville	39	269
13204	Hartsville	hartsville	39	270
13205	Heath Springs	heath-springs	39	271
13206	Hilton Head Island	hilton-head-island	39	269
13207	Hodges	hodges	39	265
13208	Holly Hill	holly-hill	39	268
13209	Hollywood	hollywood	39	267
13210	Honea Path	honea-path	39	265
13211	Huger	huger	39	267
13212	Inman	inman	39	265
13213	Irmo	irmo	39	268
13214	Isle of Palms	isle-of-palms	39	267
13215	Iva	iva	39	265
13216	Jackson	jackson	39	266
13217	Jefferson	jefferson	39	271
13218	Jenkinsville	jenkinsville	39	268
13219	Joanna	joanna	39	265
13220	Johns Island	johns-island	39	267
13221	Johnsonville	johnsonville	39	270
13222	Johnston	johnston	39	266
13223	Jonesville	jonesville	39	265
13224	Kershaw	kershaw	39	271
13225	Kingstree	kingstree	39	267
13226	La France	la-france	39	265
13227	Ladson	ladson	39	267
13228	Lake City	lake-city	39	270
13229	Lamar	lamar	39	270
13230	Lancaster	lancaster	39	271
13231	Landrum	landrum	39	265
13232	Latta	latta	39	270
13233	Laurens	laurens	39	265
13234	Lexington	lexington	39	268
13235	Liberty	liberty	39	265
13236	Little River	little-river	39	270
13237	Loris	loris	39	270
13238	Lugoff	lugoff	39	268
13239	Lyman	lyman	39	265
13240	Lynchburg	lynchburg	39	268
13241	Manning	manning	39	268
13242	Marion	marion	39	270
13243	Mauldin	mauldin	39	265
13244	Mayesville	mayesville	39	268
13245	McClellanville	mcclellanville	39	267
13246	McColl	mccoll	39	270
13247	McCormick	mccormick	39	266
13248	Moncks Corner	moncks-corner	39	267
13249	Moore	moore	39	265
13250	Mount Pleasant	mount-pleasant	39	267
13251	Mountville	mountville	39	265
13252	Mullins	mullins	39	270
13253	Murrells Inlet	murrells-inlet	39	267
13254	Myrtle Beach	myrtle-beach	39	270
13255	New Ellenton	new-ellenton	39	266
13256	Newberry	newberry	39	268
13257	Ninety Six	ninety-six	39	265
13258	North	north	39	268
13259	North Augusta	north-augusta	39	266
13260	North Charleston	north-charleston	39	267
13261	North Myrtle Beach	north-myrtle-beach	39	270
13262	Orangeburg	orangeburg	39	268
13263	Pageland	pageland	39	271
13264	Pamplico	pamplico	39	270
13265	Pauline	pauline	39	265
13266	Pawleys Island	pawleys-island	39	267
13267	Pelion	pelion	39	268
13268	Pendleton	pendleton	39	265
13269	Pickens	pickens	39	265
13270	Piedmont	piedmont	39	265
13271	Pineland	pineland	39	269
13272	Port Royal	port-royal	39	269
13273	Prosperity	prosperity	39	268
13274	Rains	rains	39	270
13275	Ravenel	ravenel	39	267
13276	Richburg	richburg	39	271
13277	Richland	richland	39	268
13278	Ridgeland	ridgeland	39	269
13279	Ridgeville	ridgeville	39	267
13280	Ridgeway	ridgeway	39	268
13281	Rock Hill	rock-hill	39	271
13282	Roebuck	roebuck	39	265
13283	Salem	salem	39	265
13284	Saluda	saluda	39	268
13285	Santee	santee	39	268
13286	Scranton	scranton	39	270
13287	Seneca	seneca	39	265
13288	Shaw Air Force Base	shaw-air-force-base	39	268
13289	Simpsonville	simpsonville	39	265
13290	Spartanburg	spartanburg	39	265
13291	Springfield	springfield	39	268
13292	Saint George	saint-george	39	267
13293	Saint Matthews	saint-matthews	39	268
13294	Saint Stephen	saint-stephen	39	267
13295	Summerton	summerton	39	268
13296	Summerville	summerville	39	267
13297	Sumter	sumter	39	268
13298	Swansea	swansea	39	268
13299	Taylors	taylors	39	265
13300	Timmonsville	timmonsville	39	270
13301	Travelers Rest	travelers-rest	39	265
13302	Trenton	trenton	39	266
13303	Turbeville	turbeville	39	268
13304	Union	union	39	265
13305	Varnville	varnville	39	269
13306	Walhalla	walhalla	39	265
13307	Wallace	wallace	39	270
13308	Walterboro	walterboro	39	267
13309	Ware Shoals	ware-shoals	39	265
13310	West Columbia	west-columbia	39	268
13311	Westminster	westminster	39	265
13312	Whitmire	whitmire	39	268
13313	Williamston	williamston	39	265
13314	Williston	williston	39	266
13315	Winnsboro	winnsboro	39	268
13316	Woodruff	woodruff	39	265
13317	York	york	39	271
13318	Aynor	aynor	39	270
13319	Berea	berea	39	265
13320	Boiling Springs	boiling-springs	39	265
13321	Carolina Forest	carolina-forest	39	270
13322	Dentsville	dentsville	39	268
13323	Five Forks	five-forks	39	265
13324	Forest Acres	forest-acres	39	268
13325	Gantt	gantt	39	265
13326	Garden City	garden-city	39	270
13327	Golden Grove	golden-grove	39	265
13328	Hanahan	hanahan	39	267
13329	Kiawah Island	kiawah-island	39	267
13330	Lake Wylie	lake-wylie	39	271
13331	Powdersville	powdersville	39	265
13332	Red Bank	red-bank	39	268
13333	Reidville	reidville	39	265
13334	Ridge Spring	ridge-spring	39	268
13335	Sans Souci	sans-souci	39	265
13336	Seven Oaks	seven-oaks	39	268
13337	Socastee	socastee	39	270
13338	Southern Shops	southern-shops	39	265
13339	Springdale	springdale	39	268
13340	Saint Andrews	saint-andrews	39	268
13341	Starr	starr	39	265
13342	Surfside Beach	surfside-beach	39	270
13343	Tega Cay	tega-cay	39	271
13344	Valley Falls	valley-falls	39	265
13345	Wade Hampton	wade-hampton	39	265
13346	Wagener	wagener	39	266
13347	Welcome	welcome	39	265
13348	Woodfield	woodfield	39	268
13349	Aberdeen	aberdeen	33	272
13350	Agar	agar	33	272
13351	Alcester	alcester	33	273
13352	Alexandria	alexandria	33	272
13353	Alpena	alpena	33	272
13354	Arlington	arlington	33	272
13355	Armour	armour	33	272
13356	Artesian	artesian	33	272
13357	Astoria	astoria	33	272
13358	Avon	avon	33	272
13359	Baltic	baltic	33	272
13360	Barnard	barnard	33	272
13361	Batesland	batesland	33	274
13362	Bath	bath	33	272
13363	Belle Fourche	belle-fourche	33	274
13364	Beresford	beresford	33	273
13365	Big Stone City	big-stone-city	33	272
13366	Bison	bison	33	274
13367	Blunt	blunt	33	272
13368	Bonesteel	bonesteel	33	272
13369	Bowdle	bowdle	33	272
13370	Box Elder	box-elder	33	274
13371	Brandon	brandon	33	272
13372	Bridgewater	bridgewater	33	272
13373	Bristol	bristol	33	272
13374	Britton	britton	33	272
13375	Brookings	brookings	33	272
13376	Buffalo	buffalo	33	274
13377	Burke	burke	33	272
13378	Canistota	canistota	33	272
13379	Canton	canton	33	272
13380	Carthage	carthage	33	272
13381	Castlewood	castlewood	33	272
13382	Cavour	cavour	33	272
13383	Centerville	centerville	33	272
13384	Chamberlain	chamberlain	33	272
13385	Chancellor	chancellor	33	272
13386	Clark	clark	33	272
13387	Clear Lake	clear-lake	33	272
13388	Colman	colman	33	272
13389	Colome	colome	33	272
13390	Colton	colton	33	272
13391	Conde	conde	33	272
13392	Corsica	corsica	33	272
13393	Cresbard	cresbard	33	272
13394	Custer	custer	33	274
13395	De Smet	de-smet	33	272
13396	Deadwood	deadwood	33	274
13397	Dell Rapids	dell-rapids	33	272
13398	Delmont	delmont	33	272
13399	Doland	doland	33	272
13400	Dupree	dupree	33	274
13401	Eagle Butte	eagle-butte	33	274
13402	Edgemont	edgemont	33	274
13403	Egan	egan	33	272
13404	Elk Point	elk-point	33	273
13405	Elkton	elkton	33	272
13406	Ellsworth Air Force Base	ellsworth-air-force-base	33	274
13407	Emery	emery	33	272
13408	Estelline	estelline	33	272
13409	Ethan	ethan	33	272
13410	Eureka	eureka	33	272
13411	Faith	faith	33	274
13412	Faulkton	faulkton	33	272
13413	Flandreau	flandreau	33	272
13414	Florence	florence	33	272
13415	Frederick	frederick	33	272
13416	Freeman	freeman	33	272
13417	Fort Pierre	fort-pierre	33	272
13418	Fort Thompson	fort-thompson	33	272
13419	Garretson	garretson	33	272
13420	Gayville	gayville	33	272
13421	Geddes	geddes	33	272
13422	Gettysburg	gettysburg	33	272
13423	Gregory	gregory	33	272
13424	Groton	groton	33	272
13425	Harrisburg	harrisburg	33	272
13426	Harrold	harrold	33	272
13427	Hartford	hartford	33	272
13428	Hayti	hayti	33	272
13429	Hecla	hecla	33	272
13430	Henry	henry	33	272
13431	Hermosa	hermosa	33	274
13432	Herreid	herreid	33	272
13433	Highmore	highmore	33	272
13434	Hill City	hill-city	33	274
13435	Hitchcock	hitchcock	33	272
13436	Hosmer	hosmer	33	272
13437	Hot Springs	hot-springs	33	274
13438	Hoven	hoven	33	272
13439	Howard	howard	33	272
13440	Howes	howes	33	274
13441	Humboldt	humboldt	33	272
13442	Hurley	hurley	33	272
13443	Huron	huron	33	272
13444	Interior	interior	33	274
13445	Ipswich	ipswich	33	272
13446	Irene	irene	33	272
13447	Iroquois	iroquois	33	272
13448	Isabel	isabel	33	272
13449	Jefferson	jefferson	33	273
13450	Kadoka	kadoka	33	274
13451	Kennebec	kennebec	33	272
13452	Kimball	kimball	33	272
13453	Kyle	kyle	33	274
13454	LaBolt	labolt	33	272
13455	Lake Andes	lake-andes	33	272
13456	Lake Preston	lake-preston	33	272
13457	Langford	langford	33	272
13458	Lead	lead	33	274
13459	Lemmon	lemmon	33	274
13460	Lennox	lennox	33	272
13461	Leola	leola	33	272
13462	Lesterville	lesterville	33	272
13463	Letcher	letcher	33	272
13464	Long Valley	long-valley	33	274
13465	Madison	madison	33	272
13466	Marion	marion	33	272
13467	Martin	martin	33	274
13468	Marty	marty	33	272
13469	McIntosh	mcintosh	33	275
13470	McLaughlin	mclaughlin	33	275
13471	Mellette	mellette	33	272
13472	Menno	menno	33	272
13473	Midland	midland	33	274
13474	Milbank	milbank	33	272
13475	Miller	miller	33	272
13476	Mission	mission	33	272
13477	Mitchell	mitchell	33	272
13478	Mobridge	mobridge	33	272
13479	Montrose	montrose	33	272
13480	Mound City	mound-city	33	272
13481	Mount Vernon	mount-vernon	33	272
13482	Murdo	murdo	33	272
13483	New Effington	new-effington	33	272
13484	New Underwood	new-underwood	33	274
13485	Newell	newell	33	274
13486	North Sioux City	north-sioux-city	33	273
13487	Oelrichs	oelrichs	33	274
13488	Okreek	okreek	33	272
13489	Oldham	oldham	33	272
13490	Onida	onida	33	272
13491	Orient	orient	33	272
13492	Parker	parker	33	272
13493	Parkston	parkston	33	272
13494	Parmelee	parmelee	33	272
13495	Philip	philip	33	274
13496	Pierre	pierre	33	272
13497	Pine Ridge	pine-ridge	33	274
13498	Plankinton	plankinton	33	272
13499	Platte	platte	33	272
13500	Pollock	pollock	33	272
13501	Porcupine	porcupine	33	274
13502	Presho	presho	33	272
13503	Ramona	ramona	33	272
13504	Rapid City	rapid-city	33	274
13505	Redfield	redfield	33	272
13506	Renner	renner	33	272
13507	Revillo	revillo	33	272
13508	Roscoe	roscoe	33	272
13509	Rosebud	rosebud	33	272
13510	Rosholt	rosholt	33	272
13511	Roslyn	roslyn	33	272
13512	Rutland	rutland	33	272
13513	Salem	salem	33	272
13514	Scotland	scotland	33	272
13515	Selby	selby	33	272
13516	Sioux Falls	sioux-falls	33	272
13517	Sisseton	sisseton	33	272
13518	South Shore	south-shore	33	272
13519	Spearfish	spearfish	33	274
13520	Springfield	springfield	33	272
13521	Saint Francis	saint-francis	33	272
13522	Stickney	stickney	33	272
13523	Stockholm	stockholm	33	272
13524	Sturgis	sturgis	33	274
13525	Summit	summit	33	272
13526	Tabor	tabor	33	272
13527	Tea	tea	33	272
13528	Timber Lake	timber-lake	33	272
13529	Tolstoy	tolstoy	33	272
13530	Toronto	toronto	33	272
13531	Tripp	tripp	33	272
13532	Tulare	tulare	33	272
13533	Tyndall	tyndall	33	272
13534	Valley Springs	valley-springs	33	272
13535	Veblen	veblen	33	272
13536	Vermillion	vermillion	33	272
13537	Viborg	viborg	33	272
13538	Volga	volga	33	272
13539	Wagner	wagner	33	272
13540	Wakonda	wakonda	33	272
13541	Wall	wall	33	274
13542	Warner	warner	33	272
13543	Watertown	watertown	33	272
13544	Waubay	waubay	33	272
13545	Waverly	waverly	33	272
13546	Webster	webster	33	272
13547	Wessington	wessington	33	272
13548	Wessington Springs	wessington-springs	33	272
13549	White	white	33	272
13550	White Lake	white-lake	33	272
13551	White River	white-river	33	272
13552	Whitewood	whitewood	33	274
13553	Willow Lake	willow-lake	33	272
13554	Wilmot	wilmot	33	272
13555	Winner	winner	33	272
13556	Wolsey	wolsey	33	272
13557	Wood	wood	33	272
13558	Woonsocket	woonsocket	33	272
13559	Worthing	worthing	33	272
13560	Yankton	yankton	33	272
13561	Keystone	keystone	33	274
13562	Adamsville	adamsville	37	276
13563	Alamo	alamo	37	276
13564	Alcoa	alcoa	37	277
13565	Alexandria	alexandria	37	278
13566	Altamont	altamont	37	279
13567	Andersonville	andersonville	37	277
13568	Arlington	arlington	37	276
13569	Arnold Air Force Base	arnold-air-force-base	37	278
13570	Ashland City	ashland-city	37	278
13571	Athens	athens	37	279
13572	Atwood	atwood	37	280
13573	Baxter	baxter	37	278
13574	Belfast	belfast	37	278
13575	Bells	bells	37	276
13576	Benton	benton	37	279
13577	Bethpage	bethpage	37	278
13578	Big Sandy	big-sandy	37	278
13579	Blountville	blountville	37	281
13580	Bluff City	bluff-city	37	281
13581	Bolivar	bolivar	37	276
13582	Bon Aqua	bon-aqua	37	278
13583	Bradford	bradford	37	280
13584	Brentwood	brentwood	37	278
13585	Brighton	brighton	37	276
13586	Bristol	bristol	37	281
13587	Brownsville	brownsville	37	276
13588	Bruceton	bruceton	37	280
13589	Bulls Gap	bulls-gap	37	281
13590	Burns	burns	37	278
13591	Butler	butler	37	281
13592	Byrdstown	byrdstown	37	278
13593	Camden	camden	37	278
13594	Carthage	carthage	37	278
13595	Celina	celina	37	278
13596	Centerville	centerville	37	278
13597	Chapel Hill	chapel-hill	37	278
13598	Chapmansboro	chapmansboro	37	278
13599	Chattanooga	chattanooga	37	279
13600	Church Hill	church-hill	37	281
13601	Clarksburg	clarksburg	37	280
13602	Clarksville	clarksville	37	278
13603	Cleveland	cleveland	37	279
13604	Clinton	clinton	37	277
13605	Coalfield	coalfield	37	277
13606	Coalmont	coalmont	37	279
13607	Collegedale	collegedale	37	279
13608	Collierville	collierville	37	276
13609	Columbia	columbia	37	278
13610	Cookeville	cookeville	37	278
13611	Copperhill	copperhill	37	279
13612	Cornersville	cornersville	37	278
13613	Corryton	corryton	37	277
13614	Cosby	cosby	37	277
13615	Cottontown	cottontown	37	278
13616	Counce	counce	37	280
13617	Covington	covington	37	276
13618	Cowan	cowan	37	278
13619	Crab Orchard	crab-orchard	37	277
13620	Crossville	crossville	37	277
13621	Crump	crump	37	280
13622	Dandridge	dandridge	37	277
13623	Dayton	dayton	37	279
13624	Decatur	decatur	37	279
13625	Decherd	decherd	37	278
13626	Dickson	dickson	37	278
13627	Dover	dover	37	278
13628	Doyle	doyle	37	278
13629	Dresden	dresden	37	282
13630	Drummonds	drummonds	37	276
13631	Ducktown	ducktown	37	279
13632	Dunlap	dunlap	37	279
13633	Dyer	dyer	37	280
13634	Dyersburg	dyersburg	37	276
13635	Elizabethton	elizabethton	37	281
13636	Elkton	elkton	37	278
13637	Erwin	erwin	37	281
13638	Estill Springs	estill-springs	37	278
13639	Evensville	evensville	37	279
13640	Fairview	fairview	37	278
13641	Fayetteville	fayetteville	37	283
13642	Finger	finger	37	276
13643	Franklin	franklin	37	278
13644	Friendship	friendship	37	276
13645	Friendsville	friendsville	37	277
13646	Gadsden	gadsden	37	276
13647	Gainesboro	gainesboro	37	278
13648	Gallatin	gallatin	37	278
13649	Gallaway	gallaway	37	276
13650	Gatlinburg	gatlinburg	37	277
13651	Georgetown	georgetown	37	279
13652	Germantown	germantown	37	276
13653	Gibson	gibson	37	280
13654	Gleason	gleason	37	282
13655	Goodlettsville	goodlettsville	37	278
13656	Graysville	graysville	37	279
13657	Greenback	greenback	37	277
13658	Greeneville	greeneville	37	281
13659	Hampton	hampton	37	281
13660	Harriman	harriman	37	277
13661	Harrogate	harrogate	37	277
13662	Hartsville	hartsville	37	278
13663	Heiskell	heiskell	37	277
13664	Helenwood	helenwood	37	277
13665	Henderson	henderson	37	280
13666	Hendersonville	hendersonville	37	278
13667	Henning	henning	37	276
13668	Henry	henry	37	278
13669	Hillsboro	hillsboro	37	278
13670	Hohenwald	hohenwald	37	278
13671	Holladay	holladay	37	278
13672	Hornbeak	hornbeak	37	282
13673	Humboldt	humboldt	37	280
13674	Huntingdon	huntingdon	37	280
13675	Huntland	huntland	37	278
13676	Huntsville	huntsville	37	277
13677	Jacksboro	jacksboro	37	277
13678	Jackson	jackson	37	280
13679	Jamestown	jamestown	37	277
13680	Jasper	jasper	37	279
13681	Jefferson City	jefferson-city	37	277
13682	Jellico	jellico	37	277
13683	Johnson City	johnson-city	37	281
13684	Jonesborough	jonesborough	37	281
13685	Kingsport	kingsport	37	281
13686	Kingston	kingston	37	277
13687	Knoxville	knoxville	37	277
13688	Kodak	kodak	37	277
13689	Kyles Ford	kyles-ford	37	277
13690	La Follette	la-follette	37	277
13691	La Vergne	la-vergne	37	278
13692	Lafayette	lafayette	37	278
13693	Lancaster	lancaster	37	278
13694	Lawrenceburg	lawrenceburg	37	278
13695	Lebanon	lebanon	37	278
13696	Lenoir City	lenoir-city	37	277
13697	Lewisburg	lewisburg	37	278
13698	Lexington	lexington	37	280
13699	Limestone	limestone	37	281
13700	Linden	linden	37	278
13701	Livingston	livingston	37	278
13702	Loretto	loretto	37	278
13703	Loudon	loudon	37	277
13704	Louisville	louisville	37	277
13705	Lowland	lowland	37	277
13706	Lyles	lyles	37	278
13707	Lynchburg	lynchburg	37	278
13708	Lynnville	lynnville	37	278
13709	Madisonville	madisonville	37	277
13710	Manchester	manchester	37	278
13711	Martin	martin	37	282
13712	Maryville	maryville	37	277
13713	Mascot	mascot	37	277
13714	Maury City	maury-city	37	276
13715	Maynardville	maynardville	37	277
13716	McEwen	mcewen	37	278
13717	McKenzie	mckenzie	37	280
13718	McMinnville	mcminnville	37	278
13719	Memphis	memphis	37	276
13720	Midway	midway	37	281
13721	Milan	milan	37	280
13722	Millington	millington	37	276
13723	Minor Hill	minor-hill	37	278
13724	Monterey	monterey	37	278
13725	Morrison	morrison	37	278
13726	Morristown	morristown	37	277
13727	Moss	moss	37	278
13728	Mount Juliet	mount-juliet	37	278
13729	Mount Pleasant	mount-pleasant	37	278
13730	Mountain City	mountain-city	37	281
13731	Munford	munford	37	276
13732	Murfreesboro	murfreesboro	37	278
13733	Nashville	nashville	37	278
13734	New Johnsonville	new-johnsonville	37	278
13735	New Market	new-market	37	277
13736	Newbern	newbern	37	276
13737	Newport	newport	37	277
13738	Norris	norris	37	277
13739	Oak Ridge	oak-ridge	37	277
13740	Oakdale	oakdale	37	277
13741	Oakland	oakland	37	276
13742	Old Fort	old-fort	37	279
13743	Oliver Springs	oliver-springs	37	277
13744	Oneida	oneida	37	277
13745	Ooltewah	ooltewah	37	279
13746	Orlinda	orlinda	37	278
13747	Palmer	palmer	37	279
13748	Palmyra	palmyra	37	278
13749	Paris	paris	37	278
13750	Parsons	parsons	37	278
13751	Pelham	pelham	37	279
13752	Petersburg	petersburg	37	283
13753	Pickwick Landing Dam	pickwick-landing-dam	37	280
13754	Pigeon Forge	pigeon-forge	37	277
13755	Pikeville	pikeville	37	279
13756	Piney Flats	piney-flats	37	281
13757	Pleasant Hill	pleasant-hill	37	277
13758	Pleasant View	pleasant-view	37	278
13759	Portland	portland	37	278
13760	Powell	powell	37	277
13761	Pulaski	pulaski	37	278
13762	Red Boiling Springs	red-boiling-springs	37	278
13763	Ripley	ripley	37	276
13764	Rock Island	rock-island	37	278
13765	Rockford	rockford	37	277
13766	Rockvale	rockvale	37	278
13767	Rockwood	rockwood	37	277
13768	Rogersville	rogersville	37	281
13769	Rutherford	rutherford	37	280
13770	Rutledge	rutledge	37	277
13771	Sale Creek	sale-creek	37	279
13772	Savannah	savannah	37	280
13773	Selmer	selmer	37	276
13774	Sevierville	sevierville	37	277
13775	Sewanee	sewanee	37	278
13776	Seymour	seymour	37	277
13777	Shelbyville	shelbyville	37	278
13778	Signal Mountain	signal-mountain	37	279
13779	Smithville	smithville	37	278
13780	Smyrna	smyrna	37	278
13781	Soddy-Daisy	soddy-daisy	37	279
13782	Somerville	somerville	37	276
13783	South Fulton	south-fulton	37	282
13784	Sparta	sparta	37	278
13785	Springfield	springfield	37	278
13786	Summertown	summertown	37	278
13787	Summitville	summitville	37	278
13788	Sunbright	sunbright	37	277
13789	Surgoinsville	surgoinsville	37	281
13790	Sweetwater	sweetwater	37	277
13791	Talbott	talbott	37	277
13792	Tazewell	tazewell	37	277
13793	Tellico Plains	tellico-plains	37	277
13794	Tennessee Ridge	tennessee-ridge	37	278
13795	Tiptonville	tiptonville	37	282
13796	Townsend	townsend	37	277
13797	Tracy City	tracy-city	37	279
13798	Trenton	trenton	37	280
13799	Troy	troy	37	282
13800	Tullahoma	tullahoma	37	278
13801	Turtletown	turtletown	37	279
13802	Unicoi	unicoi	37	281
13803	Union City	union-city	37	282
13804	Vonore	vonore	37	277
13805	Walling	walling	37	278
13806	Wartburg	wartburg	37	277
13807	Waverly	waverly	37	278
13808	Waynesboro	waynesboro	37	278
13809	Westmoreland	westmoreland	37	278
13810	White House	white-house	37	278
13811	Whiteville	whiteville	37	276
13812	Winchester	winchester	37	278
13813	Winfield	winfield	37	277
13814	Woodbury	woodbury	37	278
13815	Atoka	atoka	37	276
13816	Bartlett	bartlett	37	276
13817	East Ridge	east-ridge	37	279
13818	Erin	erin	37	278
13819	Farragut	farragut	37	277
13820	Greenbrier	greenbrier	37	278
13821	Kingston Springs	kingston-springs	37	278
13822	Rocky Top	rocky-top	37	277
13823	Lakeland	lakeland	37	276
13824	Medina	medina	37	280
13825	Monteagle	monteagle	37	279
13826	Nolensville	nolensville	37	278
13827	Oak Hill	oak-hill	37	278
13828	Red Bank	red-bank	37	279
13829	South Pittsburg	south-pittsburg	37	279
13830	Spring Hill	spring-hill	37	278
13831	Abernathy	abernathy	12	284
13832	Abilene	abilene	12	285
13833	Addison	addison	12	286
13834	Alamo	alamo	12	287
13835	Alba	alba	12	288
13836	Albany	albany	12	285
13837	Aledo	aledo	12	286
13838	Alice	alice	12	289
13839	Allen	allen	12	286
13840	Alpine	alpine	12	290
13841	Alvarado	alvarado	12	286
13842	Alvin	alvin	12	291
13843	Amarillo	amarillo	12	292
13844	Anahuac	anahuac	12	291
13845	Anderson	anderson	12	291
13846	Andrews	andrews	12	290
13847	Angleton	angleton	12	291
13848	Anna	anna	12	286
13849	Anson	anson	12	285
13850	Anthony	anthony	12	293
13851	Apple Springs	apple-springs	12	291
13852	Aransas Pass	aransas-pass	12	289
13853	Archer City	archer-city	12	294
13854	Argyle	argyle	12	286
13855	Arlington	arlington	12	286
13856	Armstrong	armstrong	12	289
13857	Aspermont	aspermont	12	285
13858	Atascosa	atascosa	12	295
13859	Athens	athens	12	286
13860	Atlanta	atlanta	12	296
13861	Aubrey	aubrey	12	286
13862	Austin	austin	12	297
13863	Avalon	avalon	12	286
13864	Avery	avery	12	286
13865	Azle	azle	12	286
13866	Bailey	bailey	12	286
13867	Baird	baird	12	285
13868	Ballinger	ballinger	12	285
13869	Bandera	bandera	12	295
13870	Bartlett	bartlett	12	298
13871	Bastrop	bastrop	12	297
13872	Bay City	bay-city	12	291
13873	Baytown	baytown	12	291
13874	Beaumont	beaumont	12	299
13875	Bedford	bedford	12	286
13876	Beeville	beeville	12	289
13877	Bellaire	bellaire	12	291
13878	Bells	bells	12	300
13879	Bellville	bellville	12	291
13880	Belton	belton	12	298
13881	Benavides	benavides	12	289
13882	Benjamin	benjamin	12	285
13883	Big Lake	big-lake	12	290
13884	Big Sandy	big-sandy	12	288
13885	Big Spring	big-spring	12	290
13886	Bishop	bishop	12	289
13887	Blanco	blanco	12	297
13888	Bloomington	bloomington	12	301
13889	Blue Ridge	blue-ridge	12	286
13890	Boerne	boerne	12	295
13891	Boling-Iago	boling-iago	12	291
13892	Bonham	bonham	12	286
13893	Borger	borger	12	292
13894	Bowie	bowie	12	294
13895	Brackettville	brackettville	12	295
13896	Brady	brady	12	302
13897	Brashear	brashear	12	286
13898	Brazoria	brazoria	12	291
13899	Breckenridge	breckenridge	12	285
13900	Brenham	brenham	12	291
13901	Bridge City	bridge-city	12	299
13902	Bridgeport	bridgeport	12	286
13903	Briggs	briggs	12	297
13904	Briscoe	briscoe	12	292
13905	Brookshire	brookshire	12	291
13906	Brownfield	brownfield	12	284
13907	Brownsboro	brownsboro	12	286
13908	Brownsville	brownsville	12	287
13909	Brownwood	brownwood	12	285
13910	Bryan	bryan	12	298
13911	Buda	buda	12	297
13912	Buffalo	buffalo	12	298
13913	Bullard	bullard	12	288
13914	Bulverde	bulverde	12	295
13915	Buna	buna	12	299
13916	Burkburnett	burkburnett	12	294
13917	Burleson	burleson	12	286
13918	Burnet	burnet	12	297
13919	Bushland	bushland	12	292
13920	Byers	byers	12	294
13921	Caddo Mills	caddo-mills	12	286
13922	Caldwell	caldwell	12	298
13923	Calvert	calvert	12	298
13924	Cameron	cameron	12	298
13925	Campbell	campbell	12	286
13926	Canadian	canadian	12	292
13927	Canton	canton	12	286
13928	Canutillo	canutillo	12	293
13929	Canyon	canyon	12	292
13930	Carrizo Springs	carrizo-springs	12	295
13931	Carrollton	carrollton	12	286
13932	Carthage	carthage	12	296
13933	Castroville	castroville	12	295
13934	Cedar Creek	cedar-creek	12	297
13935	Cedar Hill	cedar-hill	12	286
13936	Cedar Park	cedar-park	12	297
13937	Celeste	celeste	12	286
13938	Celina	celina	12	286
13939	Center	center	12	296
13940	Center Point	center-point	12	295
13941	Centerville	centerville	12	298
13942	Chandler	chandler	12	286
13943	Channelview	channelview	12	291
13944	Chappell Hill	chappell-hill	12	291
13945	Charlotte	charlotte	12	295
13946	Chatfield	chatfield	12	286
13947	Cherokee	cherokee	12	298
13948	Chester	chester	12	299
13949	Childress	childress	12	292
13950	Chilton	chilton	12	298
13951	China Spring	china-spring	12	298
13952	Cibolo	cibolo	12	295
13953	Cisco	cisco	12	285
13954	Clarendon	clarendon	12	292
13955	Clarksville	clarksville	12	286
13956	Clay	clay	12	298
13957	Cleburne	cleburne	12	286
13958	Cleveland	cleveland	12	291
13959	Clifton	clifton	12	286
13960	Clint	clint	12	293
13961	Clute	clute	12	291
13962	Clyde	clyde	12	285
13963	Coldspring	coldspring	12	291
13964	Coleman	coleman	12	285
13965	College Station	college-station	12	298
13966	Colleyville	colleyville	12	286
13967	Collinsville	collinsville	12	300
13968	Colorado City	colorado-city	12	285
13969	Columbus	columbus	12	291
13970	Comanche	comanche	12	286
13971	Comfort	comfort	12	295
13972	Commerce	commerce	12	286
13973	Conroe	conroe	12	291
13974	Converse	converse	12	295
13975	Coolidge	coolidge	12	298
13976	Cooper	cooper	12	286
13977	Coppell	coppell	12	286
13978	Copperas Cove	copperas-cove	12	298
13979	Corpus Christi	corpus-christi	12	289
13980	Corsicana	corsicana	12	286
13981	Cotulla	cotulla	12	295
13982	Crandall	crandall	12	286
13983	Crane	crane	12	290
13984	Crawford	crawford	12	298
13985	Crockett	crockett	12	288
13986	Crosby	crosby	12	291
13987	Crosbyton	crosbyton	12	284
13988	Crowell	crowell	12	294
13989	Crowley	crowley	12	286
13990	Crystal City	crystal-city	12	295
13991	Cuero	cuero	12	295
13992	Cumby	cumby	12	286
13993	Cushing	cushing	12	288
13994	Cypress	cypress	12	291
13995	D Hanis	d-hanis	12	295
13996	Daingerfield	daingerfield	12	296
13997	Dale	dale	12	297
13998	Dalhart	dalhart	12	292
13999	Dallas	dallas	12	286
14000	Damon	damon	12	291
14001	Dawson	dawson	12	286
14002	Dayton	dayton	12	291
14003	De Leon	de-leon	12	286
14004	Decatur	decatur	12	286
14005	Deer Park	deer-park	12	291
14006	Del Rio	del-rio	12	295
14007	Dell City	dell-city	12	293
14008	Denison	denison	12	300
14009	Denton	denton	12	286
14010	Denver City	denver-city	12	284
14011	DeSoto	desoto	12	286
14012	Devine	devine	12	295
14013	Diboll	diboll	12	288
14014	Dickens	dickens	12	284
14015	Dickinson	dickinson	12	291
14016	Dilley	dilley	12	295
14017	Dimmitt	dimmitt	12	292
14018	Dodd City	dodd-city	12	286
14019	Donna	donna	12	287
14020	Driftwood	driftwood	12	297
14021	Dripping Springs	dripping-springs	12	297
14022	Dumas	dumas	12	292
14023	Duncanville	duncanville	12	286
14024	Dyess Air Force Base	dyess-air-force-base	12	285
14025	Eagle Lake	eagle-lake	12	291
14026	Eagle Pass	eagle-pass	12	295
14027	East Bernard	east-bernard	12	291
14028	Eastland	eastland	12	285
14029	Ector	ector	12	286
14030	Edcouch	edcouch	12	287
14031	Eden	eden	12	302
14032	Edinburg	edinburg	12	287
14033	Edna	edna	12	291
14034	El Campo	el-campo	12	291
14035	El Paso	el-paso	12	293
14036	Eldorado	eldorado	12	302
14037	Electra	electra	12	294
14038	Elgin	elgin	12	297
14039	Elm Mott	elm-mott	12	298
14040	Elmendorf	elmendorf	12	295
14041	Elsa	elsa	12	287
14042	Emory	emory	12	286
14043	Ennis	ennis	12	286
14044	Euless	euless	12	286
14045	Fabens	fabens	12	293
14046	Fairfield	fairfield	12	286
14047	Falfurrias	falfurrias	12	289
14048	Falls City	falls-city	12	295
14049	Fannin	fannin	12	295
14050	Farmersville	farmersville	12	286
14051	Farwell	farwell	12	292
14052	Fayetteville	fayetteville	12	297
14053	Ferris	ferris	12	286
14054	Flatonia	flatonia	12	297
14055	Florence	florence	12	297
14056	Floresville	floresville	12	295
14057	Flower Mound	flower-mound	12	286
14058	Floydada	floydada	12	284
14059	Follett	follett	12	292
14060	Forney	forney	12	286
14061	Franklin	franklin	12	298
14062	Fredericksburg	fredericksburg	12	297
14063	Freeport	freeport	12	291
14064	Fresno	fresno	12	291
14065	Friendswood	friendswood	12	291
14066	Frisco	frisco	12	286
14067	Fort Davis	fort-davis	12	290
14068	Fort Hancock	fort-hancock	12	293
14069	Fort Stockton	fort-stockton	12	290
14070	Fort Worth	fort-worth	12	286
14071	Gail	gail	12	284
14072	Gainesville	gainesville	12	286
14073	Galena Park	galena-park	12	291
14074	Galveston	galveston	12	291
14075	Ganado	ganado	12	291
14076	Garden City	garden-city	12	290
14077	Gardendale	gardendale	12	290
14078	Garland	garland	12	286
14079	Garrison	garrison	12	288
14080	Garwood	garwood	12	291
14081	Gatesville	gatesville	12	298
14082	George West	george-west	12	289
14083	Georgetown	georgetown	12	297
14084	Geronimo	geronimo	12	295
14085	Giddings	giddings	12	297
14086	Gillett	gillett	12	295
14087	Gilmer	gilmer	12	288
14088	Gladewater	gladewater	12	288
14089	Glen Rose	glen-rose	12	286
14090	Goldthwaite	goldthwaite	12	298
14091	Goliad	goliad	12	295
14092	Gonzales	gonzales	12	295
14093	Goodfellow Air Force Base	goodfellow-air-force-base	12	302
14094	Gordon	gordon	12	286
14095	Gorman	gorman	12	285
14096	Graham	graham	12	294
14097	Granbury	granbury	12	286
14098	Grand Prairie	grand-prairie	12	286
14099	Grapeland	grapeland	12	288
14100	Grapevine	grapevine	12	286
14101	Greenville	greenville	12	286
14102	Groesbeck	groesbeck	12	298
14103	Groves	groves	12	299
14104	Gruver	gruver	12	292
14105	Gunter	gunter	12	300
14106	Guthrie	guthrie	12	294
14107	Hale Center	hale-center	12	284
14108	Hallettsville	hallettsville	12	295
14109	Hallsville	hallsville	12	296
14110	Haltom City	haltom-city	12	286
14111	Hamilton	hamilton	12	286
14112	Hamshire	hamshire	12	299
14113	Hardin	hardin	12	291
14114	Harker Heights	harker-heights	12	298
14115	Harlingen	harlingen	12	287
14116	Harper	harper	12	297
14117	Harrold	harrold	12	294
14118	Hartley	hartley	12	292
14119	Haskell	haskell	12	285
14120	Haslet	haslet	12	286
14121	Hawkins	hawkins	12	288
14122	Hearne	hearne	12	298
14123	Hebbronville	hebbronville	12	289
14124	Helotes	helotes	12	295
14125	Hemphill	hemphill	12	288
14126	Hempstead	hempstead	12	291
14127	Henderson	henderson	12	288
14128	Henrietta	henrietta	12	294
14129	Hereford	hereford	12	292
14130	Hico	hico	12	286
14131	Hidalgo	hidalgo	12	287
14132	Highlands	highlands	12	291
14133	Hillsboro	hillsboro	12	286
14134	Hitchcock	hitchcock	12	291
14135	Hockley	hockley	12	291
14136	Holland	holland	12	298
14137	Hondo	hondo	12	295
14138	Honey Grove	honey-grove	12	286
14139	Hooks	hooks	12	296
14140	Houston	houston	12	291
14141	Howe	howe	12	300
14142	Hubbard	hubbard	12	286
14143	Huffman	huffman	12	291
14144	Hughes Springs	hughes-springs	12	296
14145	Humble	humble	12	291
14146	Hunt	hunt	12	295
14147	Huntington	huntington	12	288
14148	Huntsville	huntsville	12	291
14149	Hurst	hurst	12	286
14150	Hutchins	hutchins	12	286
14151	Hutto	hutto	12	297
14152	Industry	industry	12	291
14153	Ingleside	ingleside	12	289
14154	Ingram	ingram	12	295
14155	Iowa Park	iowa-park	12	294
14156	Irving	irving	12	286
14157	Italy	italy	12	286
14158	Itasca	itasca	12	286
14159	Ivanhoe	ivanhoe	12	286
14160	Jacksboro	jacksboro	12	286
14161	Jacksonville	jacksonville	12	288
14162	Jasper	jasper	12	299
14163	Jayton	jayton	12	284
14164	Jefferson	jefferson	12	296
14165	Joaquin	joaquin	12	296
14166	Johnson City	johnson-city	12	297
14167	Jonesboro	jonesboro	12	298
14168	Joshua	joshua	12	286
14169	Jourdanton	jourdanton	12	295
14170	Junction	junction	12	302
14171	Justin	justin	12	286
14172	Karnack	karnack	12	296
14173	Karnes City	karnes-city	12	295
14174	Katy	katy	12	291
14175	Kaufman	kaufman	12	286
14176	Keene	keene	12	286
14177	Keller	keller	12	286
14178	Kemah	kemah	12	291
14179	Kemp	kemp	12	286
14180	Kendleton	kendleton	12	291
14181	Kenedy	kenedy	12	295
14182	Kennedale	kennedale	12	286
14183	Kerens	kerens	12	286
14184	Kermit	kermit	12	290
14185	Kerrville	kerrville	12	295
14186	Kilgore	kilgore	12	288
14187	Killeen	killeen	12	298
14188	Kingsville	kingsville	12	289
14189	Knippa	knippa	12	295
14190	Knox City	knox-city	12	285
14191	Krum	krum	12	286
14192	Kyle	kyle	12	297
14193	La Grange	la-grange	12	297
14194	La Joya	la-joya	12	287
14195	La Marque	la-marque	12	291
14196	La Porte	la-porte	12	291
14197	La Pryor	la-pryor	12	295
14198	La Salle	la-salle	12	291
14199	La Vernia	la-vernia	12	295
14200	La Villa	la-villa	12	287
14201	Ladonia	ladonia	12	286
14202	Lake Dallas	lake-dallas	12	286
14203	Lake Jackson	lake-jackson	12	291
14204	Lamesa	lamesa	12	284
14205	Lampasas	lampasas	12	298
14206	Lancaster	lancaster	12	286
14207	Laredo	laredo	12	303
14208	Lasara	lasara	12	287
14209	Laughlin Air Force Base	laughlin-air-force-base	12	295
14210	League City	league-city	12	291
14211	Leakey	leakey	12	295
14212	Leander	leander	12	297
14213	Leonard	leonard	12	286
14214	Levelland	levelland	12	284
14215	Lewisville	lewisville	12	286
14216	Liberty	liberty	12	291
14217	Lindale	lindale	12	288
14218	Linden	linden	12	296
14219	Lipan	lipan	12	286
14220	Lipscomb	lipscomb	12	292
14221	Little Elm	little-elm	12	286
14222	Little River-Academy	little-river-academy	12	298
14223	Littlefield	littlefield	12	284
14224	Liverpool	liverpool	12	291
14225	Livingston	livingston	12	291
14226	Llano	llano	12	297
14227	Lockhart	lockhart	12	297
14228	Lometa	lometa	12	298
14229	Lone Oak	lone-oak	12	286
14230	Lone Star	lone-star	12	296
14231	Longview	longview	12	288
14232	Los Fresnos	los-fresnos	12	287
14233	Lott	lott	12	298
14234	Louise	louise	12	291
14235	Lovelady	lovelady	12	288
14236	Loving	loving	12	294
14237	Lubbock	lubbock	12	284
14238	Lufkin	lufkin	12	288
14239	Luling	luling	12	297
14240	Lumberton	lumberton	12	299
14241	Lyford	lyford	12	287
14242	Lytle	lytle	12	295
14243	Mabank	mabank	12	286
14244	Madisonville	madisonville	12	298
14245	Magnolia	magnolia	12	291
14246	Malakoff	malakoff	12	286
14247	Malone	malone	12	286
14248	Manchaca	manchaca	12	297
14249	Manor	manor	12	297
14250	Mansfield	mansfield	12	286
14251	Marble Falls	marble-falls	12	297
14252	Marfa	marfa	12	290
14253	Marion	marion	12	295
14254	Marlin	marlin	12	298
14255	Marquez	marquez	12	298
14256	Marshall	marshall	12	296
14257	Mart	mart	12	298
14258	Mason	mason	12	297
14259	Matador	matador	12	284
14260	Matagorda	matagorda	12	291
14261	Mathis	mathis	12	289
14262	Mauriceville	mauriceville	12	299
14263	Maypearl	maypearl	12	286
14264	McCamey	mccamey	12	290
14265	McGregor	mcgregor	12	298
14266	McKinney	mckinney	12	286
14267	McNeil	mcneil	12	297
14268	McAllen	mcallen	12	287
14269	Medina	medina	12	295
14270	Melissa	melissa	12	286
14271	Memphis	memphis	12	292
14272	Menard	menard	12	302
14273	Mercedes	mercedes	12	287
14274	Meridian	meridian	12	286
14275	Merit	merit	12	286
14276	Merkel	merkel	12	285
14277	Mertzon	mertzon	12	302
14278	Mesquite	mesquite	12	286
14279	Mexia	mexia	12	298
14280	Miami	miami	12	292
14281	Midland	midland	12	290
14282	Midlothian	midlothian	12	286
14283	Milam	milam	12	288
14284	Milano	milano	12	298
14285	Milford	milford	12	286
14286	Mineola	mineola	12	288
14287	Mineral Wells	mineral-wells	12	286
14288	Mission	mission	12	287
14289	Missouri City	missouri-city	12	291
14290	Monahans	monahans	12	290
14291	Mont Belvieu	mont-belvieu	12	291
14292	Montague	montague	12	294
14293	Montgomery	montgomery	12	291
14294	Moody	moody	12	298
14295	Moore	moore	12	295
14296	Morse	morse	12	292
14297	Morton	morton	12	284
14298	Mount Pleasant	mount-pleasant	12	296
14299	Mount Vernon	mount-vernon	12	288
14300	Muenster	muenster	12	286
14301	Muleshoe	muleshoe	12	284
14302	Mumford	mumford	12	298
14303	Nacogdoches	nacogdoches	12	288
14304	Natalia	natalia	12	295
14305	Navasota	navasota	12	291
14306	Nederland	nederland	12	299
14307	Needville	needville	12	291
14308	Nevada	nevada	12	286
14309	New Boston	new-boston	12	296
14310	New Braunfels	new-braunfels	12	295
14311	New Caney	new-caney	12	291
14312	New Waverly	new-waverly	12	291
14313	Newark	newark	12	286
14314	Newton	newton	12	299
14315	Nixon	nixon	12	295
14316	Nolan	nolan	12	285
14317	North Richland Hills	north-richland-hills	12	286
14318	Nursery	nursery	12	301
14319	Odem	odem	12	289
14320	Odessa	odessa	12	290
14321	Olney	olney	12	294
14322	Onalaska	onalaska	12	291
14323	Orange	orange	12	299
14324	Orange Grove	orange-grove	12	289
14325	Orangefield	orangefield	12	299
14326	Overton	overton	12	288
14327	Ozona	ozona	12	302
14328	Paducah	paducah	12	292
14329	Paint Rock	paint-rock	12	302
14330	Palacios	palacios	12	291
14331	Palestine	palestine	12	286
14332	Palmer	palmer	12	286
14333	Palo Pinto	palo-pinto	12	286
14334	Pampa	pampa	12	292
14335	Panhandle	panhandle	12	292
14336	Panola	panola	12	296
14337	Paris	paris	12	286
14338	Pasadena	pasadena	12	291
14339	Pearland	pearland	12	291
14340	Pearsall	pearsall	12	295
14341	Pecos	pecos	12	290
14342	Penwell	penwell	12	290
14343	Perryton	perryton	12	292
14344	Petersburg	petersburg	12	284
14345	Pflugerville	pflugerville	12	297
14346	Pharr	pharr	12	287
14347	Pilot Point	pilot-point	12	286
14348	Pinehurst	pinehurst	12	291
14349	Pipe Creek	pipe-creek	12	295
14350	Pittsburg	pittsburg	12	288
14351	Plains	plains	12	284
14352	Plainview	plainview	12	284
14353	Plano	plano	12	286
14354	Pleasanton	pleasanton	12	295
14355	Point	point	12	286
14356	Point Comfort	point-comfort	12	291
14357	Ponder	ponder	12	286
14358	Port Aransas	port-aransas	12	289
14359	Port Arthur	port-arthur	12	299
14360	Port Lavaca	port-lavaca	12	291
14361	Port Neches	port-neches	12	299
14362	Porter	porter	12	291
14363	Portland	portland	12	289
14364	Post	post	12	284
14365	Poteet	poteet	12	295
14366	Poth	poth	12	295
14367	Pottsboro	pottsboro	12	300
14368	Prairie View	prairie-view	12	291
14369	Premont	premont	12	289
14370	Presidio	presidio	12	290
14371	Princeton	princeton	12	286
14372	Progreso	progreso	12	287
14373	Prosper	prosper	12	286
14374	Quanah	quanah	12	294
14375	Queen City	queen-city	12	296
14376	Quemado	quemado	12	295
14377	Quinlan	quinlan	12	286
14378	Quitman	quitman	12	288
14379	Ranger	ranger	12	285
14380	Rankin	rankin	12	290
14381	Raymondville	raymondville	12	287
14382	Reagan	reagan	12	298
14383	Red Oak	red-oak	12	286
14384	Refugio	refugio	12	289
14385	Rice	rice	12	286
14386	Richardson	richardson	12	286
14387	Richmond	richmond	12	291
14388	Rio Grande City	rio-grande-city	12	287
14389	Rio Hondo	rio-hondo	12	287
14390	Riviera	riviera	12	289
14391	Roanoke	roanoke	12	286
14392	Robert Lee	robert-lee	12	302
14393	Robstown	robstown	12	289
14394	Roby	roby	12	285
14395	Rockdale	rockdale	12	298
14396	Rockport	rockport	12	289
14397	Rocksprings	rocksprings	12	295
14398	Rockwall	rockwall	12	286
14399	Rogers	rogers	12	298
14400	Roma	roma	12	287
14401	Rosenberg	rosenberg	12	291
14402	Rosharon	rosharon	12	291
14403	Ross	ross	12	298
14404	Round Mountain	round-mountain	12	297
14405	Round Rock	round-rock	12	297
14406	Round Top	round-top	12	297
14407	Rowlett	rowlett	12	286
14408	Royse City	royse-city	12	286
14409	Runge	runge	12	295
14410	Rusk	rusk	12	288
14411	Sabinal	sabinal	12	295
14412	Sachse	sachse	12	286
14413	Sadler	sadler	12	300
14414	Salado	salado	12	298
14415	San Angelo	san-angelo	12	302
14416	San Antonio	san-antonio	12	295
14417	San Augustine	san-augustine	12	288
14418	San Benito	san-benito	12	287
14419	San Diego	san-diego	12	289
14420	San Elizario	san-elizario	12	293
14421	San Juan	san-juan	12	287
14422	San Marcos	san-marcos	12	297
14423	San Saba	san-saba	12	298
14424	Sanderson	sanderson	12	290
14425	Sandia	sandia	12	289
14426	Santa Anna	santa-anna	12	285
14427	Santa Fe	santa-fe	12	291
14428	Saratoga	saratoga	12	299
14429	Savoy	savoy	12	286
14430	Schertz	schertz	12	295
14431	Schulenburg	schulenburg	12	297
14432	Scottsville	scottsville	12	296
14433	Scurry	scurry	12	286
14434	Seabrook	seabrook	12	291
14435	Seagoville	seagoville	12	286
14436	Seagraves	seagraves	12	284
14437	Sealy	sealy	12	291
14438	Sebastian	sebastian	12	287
14439	Seguin	seguin	12	295
14440	Seminole	seminole	12	284
14441	Seymour	seymour	12	294
14442	Shamrock	shamrock	12	292
14443	Shelbyville	shelbyville	12	296
14444	Sheppard Air Force Base	sheppard-air-force-base	12	294
14445	Sherman	sherman	12	300
14446	Shiner	shiner	12	295
14447	Shiro	shiro	12	291
14448	Sierra Blanca	sierra-blanca	12	293
14449	Silsbee	silsbee	12	299
14450	Silverton	silverton	12	292
14451	Sinton	sinton	12	289
14452	Slaton	slaton	12	284
14453	Smithville	smithville	12	297
14454	Snook	snook	12	298
14455	Snyder	snyder	12	285
14456	Somerset	somerset	12	295
14457	Sonora	sonora	12	302
14458	Sour Lake	sour-lake	12	299
14459	South Houston	south-houston	12	291
14460	South Padre Island	south-padre-island	12	287
14461	Southlake	southlake	12	286
14462	Spearman	spearman	12	292
14463	Spicewood	spicewood	12	297
14464	Splendora	splendora	12	291
14465	Spring	spring	12	291
14466	Spring Branch	spring-branch	12	295
14467	Springtown	springtown	12	286
14468	Spur	spur	12	284
14469	Spurger	spurger	12	299
14470	Stafford	stafford	12	291
14471	Stamford	stamford	12	285
14472	Stanton	stanton	12	290
14473	Stephenville	stephenville	12	286
14474	Sterling City	sterling-city	12	302
14475	Stinnett	stinnett	12	292
14476	Stockdale	stockdale	12	295
14477	Stonewall	stonewall	12	297
14478	Stratford	stratford	12	292
14479	Strawn	strawn	12	286
14480	Streetman	streetman	12	286
14481	Sudan	sudan	12	284
14482	Sugar Land	sugar-land	12	291
14483	Sulphur Springs	sulphur-springs	12	286
14484	Sunnyvale	sunnyvale	12	286
14485	Sweetwater	sweetwater	12	285
14486	Tahoka	tahoka	12	284
14487	Taylor	taylor	12	297
14488	Temple	temple	12	298
14489	Tenaha	tenaha	12	296
14490	Terrell	terrell	12	286
14491	Texarkana	texarkana	12	296
14492	Texas City	texas-city	12	291
14493	The Colony	the-colony	12	286
14494	Thompsons	thompsons	12	291
14495	Thorndale	thorndale	12	298
14496	Thornton	thornton	12	298
14497	Three Rivers	three-rivers	12	289
14498	Throckmorton	throckmorton	12	294
14499	Tilden	tilden	12	295
14500	Timpson	timpson	12	296
14501	Tioga	tioga	12	300
14502	Tom Bean	tom-bean	12	300
14503	Tomball	tomball	12	291
14504	Tornillo	tornillo	12	293
14505	Trenton	trenton	12	286
14506	Trinidad	trinidad	12	286
14507	Trinity	trinity	12	291
14508	Troy	troy	12	298
14509	Tulia	tulia	12	292
14510	Tye	tye	12	285
14511	Tyler	tyler	12	288
14512	Universal City	universal-city	12	295
14513	Utopia	utopia	12	295
14514	Uvalde	uvalde	12	295
14515	Valley View	valley-view	12	286
14516	Van Alstyne	van-alstyne	12	300
14517	Van Horn	van-horn	12	293
14518	Van Vleck	van-vleck	12	291
14519	Vega	vega	12	292
14520	Vernon	vernon	12	294
14521	Victoria	victoria	12	301
14522	Vidor	vidor	12	299
14523	Waco	waco	12	298
14524	Wadsworth	wadsworth	12	291
14525	Waller	waller	12	291
14526	Wallis	wallis	12	291
14527	Washington	washington	12	291
14528	Waskom	waskom	12	296
14529	Waxahachie	waxahachie	12	286
14530	Weatherford	weatherford	12	286
14531	Webster	webster	12	291
14532	Wellington	wellington	12	292
14533	Wellman	wellman	12	284
14534	Weslaco	weslaco	12	287
14535	West Columbia	west-columbia	12	291
14536	Weston	weston	12	286
14537	Wharton	wharton	12	291
14538	Wheeler	wheeler	12	292
14539	Whiteface	whiteface	12	284
14540	Whitehouse	whitehouse	12	288
14541	Whitesboro	whitesboro	12	300
14542	Whitewright	whitewright	12	300
14543	Whitharral	whitharral	12	284
14544	Whitney	whitney	12	286
14545	Wichita Falls	wichita-falls	12	294
14546	Willis	willis	12	291
14547	Wills Point	wills-point	12	286
14548	Wimberley	wimberley	12	297
14549	Winnsboro	winnsboro	12	288
14550	Wolfe City	wolfe-city	12	286
14551	Wolfforth	wolfforth	12	284
14552	Woodsboro	woodsboro	12	289
14553	Woodville	woodville	12	299
14554	Woodway	woodway	12	298
14555	Wylie	wylie	12	286
14556	Yoakum	yoakum	12	295
14557	Zapata	zapata	12	303
14558	Alamo Heights	alamo-heights	12	295
14559	Atascocita	atascocita	12	291
14560	Balch Springs	balch-springs	12	286
14561	Barton Creek	barton-creek	12	297
14562	Bartonville	bartonville	12	286
14563	Bear Creek	bear-creek	12	297
14564	Bee Cave	bee-cave	12	297
14565	Benbrook	benbrook	12	286
14566	Briarcliff	briarcliff	12	297
14567	Brushy Creek	brushy-creek	12	297
14568	Canyon Lake	canyon-lake	12	295
14569	Cinco Ranch	cinco-ranch	12	291
14570	Copper Canyon	copper-canyon	12	286
14571	Corinth	corinth	12	286
14572	Cross Roads	cross-roads	12	286
14573	Fair Oaks Ranch	fair-oaks-ranch	12	295
14574	Fairview	fairview	12	286
14575	Farmers Branch	farmers-branch	12	286
14576	Fort Bliss	fort-bliss	12	293
14577	Fort Hood	fort-hood	12	298
14578	Four Corners	four-corners	12	291
14579	Fulshear	fulshear	12	291
14580	Garden Ridge	garden-ridge	12	295
14581	Godley	godley	12	286
14582	Grandview	grandview	12	286
14583	Greatwood	greatwood	12	291
14584	Hewitt	hewitt	12	298
14585	Highland Park	highland-park	12	286
14586	Highland Village	highland-village	12	286
14587	Horizon City	horizon-city	12	293
14588	Horseshoe Bay	horseshoe-bay	12	297
14589	Iowa Colony	iowa-colony	12	291
14590	Jersey Village	jersey-village	12	291
14591	Jollyville	jollyville	12	297
14592	Kingsland	kingsland	12	297
14593	Lago Vista	lago-vista	12	297
14594	Lakehills	lakehills	12	295
14595	Lakeway	lakeway	12	297
14596	Lavon	lavon	12	286
14597	Liberty Hill	liberty-hill	12	297
14598	Live Oak	live-oak	12	295
14599	Lorena	lorena	12	298
14600	Lucas	lucas	12	286
14601	Manvel	manvel	12	291
14602	Mission Bend	mission-bend	12	291
14603	Murphy	murphy	12	286
14604	Ore City	ore-city	12	288
14605	Paradise	paradise	12	286
14606	Pecan Grove	pecan-grove	12	291
14607	Piney Point Village	piney-point-village	12	291
14608	Port Isabel	port-isabel	12	287
14609	Robinson	robinson	12	298
14610	Saginaw	saginaw	12	286
14611	Sanger	sanger	12	286
14612	Sienna Plantation	sienna-plantation	12	291
14613	Socorro	socorro	12	293
14614	Saint Hedwig	saint-hedwig	12	295
14615	Stagecoach	stagecoach	12	291
14616	The Woodlands	the-woodlands	12	291
14617	Timberwood Park	timberwood-park	12	295
14618	Trophy Club	trophy-club	12	286
14619	University Park	university-park	12	286
14620	Venus	venus	12	286
14621	Wake Village	wake-village	12	296
14622	Watauga	watauga	12	286
14623	Wells Branch	wells-branch	12	297
14624	West Lake Hills	west-lake-hills	12	297
14625	West University Place	west-university-place	12	291
14626	Westlake	westlake	12	286
14627	White Oak	white-oak	12	288
14628	Willow Park	willow-park	12	286
14629	Windcrest	windcrest	12	295
14630	Windthorst	windthorst	12	294
14631	Wyldwood	wyldwood	12	297
14632	Alpine	alpine	23	304
14633	American Fork	american-fork	23	304
14634	Bear River City	bear-river-city	23	304
14635	Beaver	beaver	23	304
14636	Bicknell	bicknell	23	304
14637	Blanding	blanding	23	304
14638	Bluff	bluff	23	304
14639	Bountiful	bountiful	23	304
14640	Brigham City	brigham-city	23	304
14641	Castle Dale	castle-dale	23	304
14642	Cedar City	cedar-city	23	304
14643	Centerville	centerville	23	304
14644	Central	central	23	304
14645	Clearfield	clearfield	23	304
14646	Coalville	coalville	23	304
14647	Corinne	corinne	23	304
14648	Dammeron Valley	dammeron-valley	23	304
14649	Delta	delta	23	304
14650	Draper	draper	23	304
14651	Duchesne	duchesne	23	304
14652	Dugway	dugway	23	304
14653	Eden	eden	23	304
14654	Emery	emery	23	304
14655	Enterprise	enterprise	23	304
14656	Ephraim	ephraim	23	304
14657	Escalante	escalante	23	304
14658	Eureka	eureka	23	304
14659	Fairview	fairview	23	304
14660	Farmington	farmington	23	304
14661	Fillmore	fillmore	23	304
14662	Fort Duchesne	fort-duchesne	23	304
14663	Grantsville	grantsville	23	304
14664	Gunlock	gunlock	23	304
14665	Heber City	heber-city	23	304
14666	Hildale	hildale	23	304
14667	Hill Air Force Base	hill-air-force-base	23	304
14668	Huntington	huntington	23	304
14669	Hurricane	hurricane	23	304
14670	Hyrum	hyrum	23	304
14671	Ivins	ivins	23	304
14672	Junction	junction	23	304
14673	Kamas	kamas	23	304
14674	Kanab	kanab	23	304
14675	Kaysville	kaysville	23	304
14676	La Verkin	la-verkin	23	304
14677	Layton	layton	23	304
14678	Leeds	leeds	23	304
14679	Lehi	lehi	23	304
14680	Lewiston	lewiston	23	304
14681	Lindon	lindon	23	304
14682	Logan	logan	23	304
14683	Magna	magna	23	304
14684	Manila	manila	23	304
14685	Manti	manti	23	304
14686	Mantua	mantua	23	304
14687	Midvale	midvale	23	304
14688	Midway	midway	23	304
14689	Milford	milford	23	304
14690	Moab	moab	23	304
14691	Monroe	monroe	23	304
14692	Monticello	monticello	23	304
14693	Morgan	morgan	23	304
14694	Mount Pleasant	mount-pleasant	23	304
14695	Nephi	nephi	23	304
14696	New Harmony	new-harmony	23	304
14697	Newcastle	newcastle	23	304
14698	North Salt Lake	north-salt-lake	23	304
14699	Ogden	ogden	23	304
14700	Orangeville	orangeville	23	304
14701	Orem	orem	23	304
14702	Panguitch	panguitch	23	304
14703	Park City	park-city	23	304
14704	Parowan	parowan	23	304
14705	Payson	payson	23	304
14706	Pleasant Grove	pleasant-grove	23	304
14707	Price	price	23	304
14708	Providence	providence	23	304
14709	Provo	provo	23	304
14710	Randolph	randolph	23	304
14711	Richfield	richfield	23	304
14712	Richmond	richmond	23	304
14713	Riverton	riverton	23	304
14714	Rockville	rockville	23	304
14715	Roosevelt	roosevelt	23	304
14716	Roy	roy	23	304
14717	Rush Valley	rush-valley	23	304
14718	Salem	salem	23	304
14719	Salt Lake City	salt-lake-city	23	304
14720	Sandy	sandy	23	304
14721	Santa Clara	santa-clara	23	304
14722	Santaquin	santaquin	23	304
14723	Smithfield	smithfield	23	304
14724	South Jordan	south-jordan	23	304
14725	Spanish Fork	spanish-fork	23	304
14726	Springdale	springdale	23	304
14727	Springville	springville	23	304
14728	St. George	st-george	23	304
14729	Sterling	sterling	23	304
14730	Syracuse	syracuse	23	304
14731	Tooele	tooele	23	304
14732	Toquerville	toquerville	23	304
14733	Tremonton	tremonton	23	304
14734	Vernal	vernal	23	304
14735	Veyo	veyo	23	304
14736	Virgin	virgin	23	304
14737	Washington	washington	23	304
14738	Wendover	wendover	23	304
14739	West Jordan	west-jordan	23	304
14740	Woodruff	woodruff	23	304
14741	Woods Cross	woods-cross	23	304
14742	Bluffdale	bluffdale	23	304
14743	Cedar Hills	cedar-hills	23	304
14744	Clinton	clinton	23	304
14745	Cottonwood Heights	cottonwood-heights	23	304
14746	Eagle Mountain	eagle-mountain	23	304
14747	East Millcreek	east-millcreek	23	304
14748	Farr West	farr-west	23	304
14749	Green River	green-river	23	304
14750	Gunnison	gunnison	23	304
14751	Herriman	herriman	23	304
14752	Highland	highland	23	304
14753	Holladay	holladay	23	304
14754	Hooper	hooper	23	304
14755	Kearns	kearns	23	304
14756	Mapleton	mapleton	23	304
14757	Millcreek	millcreek	23	304
14758	Murray	murray	23	304
14759	North Ogden	north-ogden	23	304
14760	Plain City	plain-city	23	304
14761	Pleasant View	pleasant-view	23	304
14762	Riverdale	riverdale	23	304
14763	Saratoga Springs	saratoga-springs	23	304
14764	South Salt Lake	south-salt-lake	23	304
14765	South Snyderville Basin	south-snyderville-basin	23	304
14766	South Weber	south-weber	23	304
14767	Stansbury Park	stansbury-park	23	304
14768	Taylorsville	taylorsville	23	304
14769	Torrey	torrey	23	304
14770	Tropic	tropic	23	304
14771	West Bountiful	west-bountiful	23	304
14772	West Haven	west-haven	23	304
14773	West Valley City	west-valley-city	23	304
14774	Abingdon	abingdon	28	305
14775	Accomac	accomac	28	306
14776	Afton	afton	28	307
14777	Alberta	alberta	28	308
14778	Aldie	aldie	28	309
14779	Alexandria	alexandria	28	309
14780	Altavista	altavista	28	307
14781	Amelia Court House	amelia-court-house	28	308
14782	Amherst	amherst	28	307
14783	Annandale	annandale	28	309
14784	Appomattox	appomattox	28	307
14785	Arcola	arcola	28	309
14786	Ark	ark	28	306
14787	Arlington	arlington	28	309
14788	Ashburn	ashburn	28	309
14789	Ashland	ashland	28	308
14790	Atkins	atkins	28	305
14791	Aylett	aylett	28	308
14792	Bassett	bassett	28	307
14793	Bastian	bastian	28	307
14794	Bealeton	bealeton	28	309
14795	Bedford	bedford	28	307
14796	Bent Mountain	bent-mountain	28	307
14797	Berryville	berryville	28	309
14798	Big Island	big-island	28	307
14799	Big Stone Gap	big-stone-gap	28	305
14800	Blacksburg	blacksburg	28	307
14801	Blackstone	blackstone	28	308
14802	Bland	bland	28	307
14803	Bluefield	bluefield	28	310
14804	Boston	boston	28	309
14805	Bowling Green	bowling-green	28	308
14806	Boyce	boyce	28	309
14807	Boydton	boydton	28	311
14808	Boykins	boykins	28	306
14809	Bracey	bracey	28	311
14810	Bridgewater	bridgewater	28	312
14811	Bristol	bristol	28	305
14812	Bristow	bristow	28	309
14813	Broadway	broadway	28	312
14814	Brookneal	brookneal	28	307
14815	Buchanan	buchanan	28	307
14816	Buckingham	buckingham	28	308
14817	Buena Vista	buena-vista	28	307
14818	Burke	burke	28	309
14819	Cape Charles	cape-charles	28	306
14820	Capron	capron	28	306
14821	Carson	carson	28	308
14822	Catharpin	catharpin	28	309
14823	Catlett	catlett	28	309
14824	Cedar Bluff	cedar-bluff	28	310
14825	Centreville	centreville	28	309
14826	Chantilly	chantilly	28	309
14827	Charles City	charles-city	28	308
14828	Charlotte Court House	charlotte-court-house	28	307
14829	Charlottesville	charlottesville	28	313
14830	Chase City	chase-city	28	311
14831	Chatham	chatham	28	307
14832	Chesapeake	chesapeake	28	306
14833	Chester	chester	28	308
14834	Chesterfield	chesterfield	28	308
14835	Chincoteague Island	chincoteague-island	28	306
14836	Christiansburg	christiansburg	28	307
14837	Claremont	claremont	28	306
14838	Clarksville	clarksville	28	311
14839	Clifton	clifton	28	309
14840	Clifton Forge	clifton-forge	28	307
14841	Clintwood	clintwood	28	305
14842	Clover	clover	28	307
14843	Cloverdale	cloverdale	28	307
14844	Collinsville	collinsville	28	307
14845	Colonial Beach	colonial-beach	28	309
14846	Colonial Heights	colonial-heights	28	308
14847	Courtland	courtland	28	306
14848	Covington	covington	28	307
14849	Crewe	crewe	28	308
14850	Critz	critz	28	314
14851	Culpeper	culpeper	28	309
14852	Cumberland	cumberland	28	308
14853	Dahlgren	dahlgren	28	309
14854	Daleville	daleville	28	307
14855	Danville	danville	28	307
14856	Dayton	dayton	28	312
14857	Deerfield	deerfield	28	312
14858	Delaplane	delaplane	28	309
14859	Dendron	dendron	28	306
14860	Dinwiddie	dinwiddie	28	308
14861	Disputanta	disputanta	28	308
14862	Doran	doran	28	310
14863	Dublin	dublin	28	307
14864	Duffield	duffield	28	305
14865	Dulles	dulles	28	309
14866	Dumfries	dumfries	28	309
14867	Dunn Loring	dunn-loring	28	309
14868	Earlysville	earlysville	28	313
14869	Edinburg	edinburg	28	309
14870	Elkton	elkton	28	312
14871	Elkwood	elkwood	28	309
14872	Emporia	emporia	28	308
14873	Exmore	exmore	28	306
14874	Faber	faber	28	307
14875	Fairfax	fairfax	28	309
14876	Fairfax Station	fairfax-station	28	309
14877	Falls Church	falls-church	28	309
14878	Falls Mills	falls-mills	28	310
14879	Farmville	farmville	28	308
14880	Ferrum	ferrum	28	307
14881	Fieldale	fieldale	28	307
14882	Fincastle	fincastle	28	307
14883	Fishersville	fishersville	28	312
14884	Flint Hill	flint-hill	28	309
14885	Floyd	floyd	28	307
14886	Forest	forest	28	307
14887	Fork Union	fork-union	28	313
14888	Franklin	franklin	28	306
14889	Fredericksburg	fredericksburg	28	309
14890	Front Royal	front-royal	28	309
14891	Fort Belvoir	fort-belvoir	28	309
14892	Fort Lee	fort-lee	28	308
14893	Fort Myer	fort-myer	28	309
14894	Gainesville	gainesville	28	309
14895	Galax	galax	28	307
14896	Gasburg	gasburg	28	308
14897	Gate City	gate-city	28	305
14898	Glade Spring	glade-spring	28	305
14899	Glen Allen	glen-allen	28	308
14900	Gloucester Point	gloucester-point	28	306
14901	Goochland	goochland	28	308
14902	Gordonsville	gordonsville	28	308
14903	Great Falls	great-falls	28	309
14904	Greenbush	greenbush	28	306
14905	Greenville	greenville	28	312
14906	Gretna	gretna	28	307
14907	Grottoes	grottoes	28	312
14908	Grundy	grundy	28	305
14909	Halifax	halifax	28	307
14910	Hampden Sydney	hampden-sydney	28	308
14911	Hampton	hampton	28	306
14912	Hanover	hanover	28	308
14913	Harrisonburg	harrisonburg	28	312
14914	Haymarket	haymarket	28	309
14915	Heathsville	heathsville	28	308
14916	Herndon	herndon	28	309
14917	Highland Springs	highland-springs	28	308
14918	Hillsville	hillsville	28	307
14919	Hinton	hinton	28	312
14920	Honaker	honaker	28	305
14921	Hopewell	hopewell	28	308
14922	Hot Springs	hot-springs	28	307
14923	Huddleston	huddleston	28	307
14924	Independence	independence	28	307
14925	Irvington	irvington	28	308
14926	Isle of Wight	isle-of-wight	28	306
14927	Jamestown	jamestown	28	306
14928	Jarratt	jarratt	28	308
14929	Jetersville	jetersville	28	308
14930	Jonesville	jonesville	28	305
14931	Kenbridge	kenbridge	28	308
14932	Keswick	keswick	28	313
14933	Kilmarnock	kilmarnock	28	308
14934	King and Queen Court House	king-and-queen-court-house	28	308
14935	King George	king-george	28	309
14936	King William	king-william	28	308
14937	Kinsale	kinsale	28	309
14938	Lancaster	lancaster	28	308
14939	Lawrenceville	lawrenceville	28	308
14940	Lebanon	lebanon	28	305
14941	Leesburg	leesburg	28	309
14942	Lexington	lexington	28	307
14943	Lightfoot	lightfoot	28	306
14944	Lignum	lignum	28	309
14945	Linden	linden	28	309
14946	Locust Grove	locust-grove	28	308
14947	Lorton	lorton	28	309
14948	Louisa	louisa	28	308
14949	Lovettsville	lovettsville	28	309
14950	Lovingston	lovingston	28	307
14951	Low Moor	low-moor	28	307
14952	Lunenburg	lunenburg	28	308
14953	Luray	luray	28	309
14954	Lynchburg	lynchburg	28	307
14955	Machipongo	machipongo	28	306
14956	Madison	madison	28	313
14957	Madison Heights	madison-heights	28	307
14958	Manakin-Sabot	manakin-sabot	28	308
14959	Manassas	manassas	28	309
14960	Manquin	manquin	28	308
14961	Marion	marion	28	305
14962	Martinsville	martinsville	28	307
14963	Mathews	mathews	28	306
14964	McGaheysville	mcgaheysville	28	312
14965	McLean	mclean	28	309
14966	Meadowview	meadowview	28	305
14967	Mechanicsville	mechanicsville	28	308
14968	Melfa	melfa	28	306
14969	Merrifield	merrifield	28	309
14970	Middleburg	middleburg	28	309
14971	Middletown	middletown	28	309
14972	Midland	midland	28	309
14973	Midlothian	midlothian	28	308
14974	Millwood	millwood	28	309
14975	Mineral	mineral	28	308
14976	Monterey	monterey	28	307
14977	Montross	montross	28	309
14978	Mount Vernon	mount-vernon	28	309
14979	Narrows	narrows	28	307
14980	Nassawadox	nassawadox	28	306
14981	Nellysford	nellysford	28	307
14982	New Castle	new-castle	28	307
14983	New Church	new-church	28	306
14984	New Kent	new-kent	28	308
14985	New Market	new-market	28	309
14986	New River	new-river	28	307
14987	Newington	newington	28	309
14988	Newport News	newport-news	28	306
14989	Nokesville	nokesville	28	309
14990	Norfolk	norfolk	28	306
14991	Norton	norton	28	305
14992	Norwood	norwood	28	307
14993	Nottoway Court House	nottoway-court-house	28	308
14994	Oakton	oakton	28	309
14995	Occoquan	occoquan	28	309
14996	Oilville	oilville	28	308
14997	Orange	orange	28	308
14998	Paeonian Springs	paeonian-springs	28	309
14999	Painter	painter	28	306
15000	Palmyra	palmyra	28	313
15001	Pearisburg	pearisburg	28	307
15002	Pembroke	pembroke	28	307
15003	Petersburg	petersburg	28	308
15004	Pocahontas	pocahontas	28	310
15005	Poquoson	poquoson	28	306
15006	Portsmouth	portsmouth	28	306
15007	Powhatan	powhatan	28	308
15008	Prince George	prince-george	28	308
15009	Prospect	prospect	28	308
15010	Pulaski	pulaski	28	307
15011	Purcellville	purcellville	28	309
15012	Quantico	quantico	28	309
15013	Quinton	quinton	28	308
15014	Radford	radford	28	307
15015	Remington	remington	28	309
15016	Reston	reston	28	309
15017	Rhoadesville	rhoadesville	28	308
15018	Rich Creek	rich-creek	28	307
15019	Richlands	richlands	28	310
15020	Richmond	richmond	28	308
15021	Roanoke	roanoke	28	307
15022	Rockville	rockville	28	308
15023	Rocky Mount	rocky-mount	28	307
15024	Round Hill	round-hill	28	309
15025	Ruckersville	ruckersville	28	313
15026	Rustburg	rustburg	28	307
15027	Salem	salem	28	307
15028	Saltville	saltville	28	305
15029	Saluda	saluda	28	308
15030	Sandston	sandston	28	308
15031	Scottsville	scottsville	28	313
15032	Shawsville	shawsville	28	307
15033	Shenandoah	shenandoah	28	309
15034	Smithfield	smithfield	28	306
15035	South Boston	south-boston	28	307
15036	South Hill	south-hill	28	311
15037	Sperryville	sperryville	28	309
15038	Spotsylvania	spotsylvania	28	309
15039	Springfield	springfield	28	309
15040	Stafford	stafford	28	309
15041	Stanardsville	stanardsville	28	313
15042	Stanley	stanley	28	309
15043	Staunton	staunton	28	312
15044	Steeles Tavern	steeles-tavern	28	312
15045	Stephens City	stephens-city	28	309
15046	Sterling	sterling	28	309
15047	Strasburg	strasburg	28	309
15048	Stuart	stuart	28	314
15049	Stuarts Draft	stuarts-draft	28	312
15050	Studley	studley	28	308
15051	Suffolk	suffolk	28	306
15052	Surry	surry	28	306
15053	Sussex	sussex	28	308
15054	Sweet Briar	sweet-briar	28	307
15055	Tappahannock	tappahannock	28	308
15056	Tazewell	tazewell	28	310
15057	The Plains	the-plains	28	309
15058	Toano	toano	28	306
15059	Triangle	triangle	28	309
15060	Troutville	troutville	28	307
15061	Troy	troy	28	313
15062	Upperville	upperville	28	309
15063	Urbanna	urbanna	28	308
15064	Vansant	vansant	28	305
15065	Verona	verona	28	312
15066	Victoria	victoria	28	308
15067	Vienna	vienna	28	309
15068	Vinton	vinton	28	307
15069	Virgilina	virgilina	28	307
15070	Virginia Beach	virginia-beach	28	306
15071	Wakefield	wakefield	28	308
15072	Walkerton	walkerton	28	308
15073	Wallops Island	wallops-island	28	306
15074	Warm Springs	warm-springs	28	307
15075	Warrenton	warrenton	28	309
15076	Warsaw	warsaw	28	308
15077	Washington	washington	28	309
15078	Waterford	waterford	28	309
15079	Wattsville	wattsville	28	306
15080	Waverly	waverly	28	308
15081	Waynesboro	waynesboro	28	312
15082	Weber City	weber-city	28	305
15083	West Point	west-point	28	308
15084	Weyers Cave	weyers-cave	28	312
15085	White Stone	white-stone	28	308
15086	Williamsburg	williamsburg	28	306
15087	Winchester	winchester	28	309
15088	Wirtz	wirtz	28	307
15089	Wise	wise	28	305
15090	Woodberry Forest	woodberry-forest	28	313
15091	Woodbridge	woodbridge	28	309
15092	Woodlawn	woodlawn	28	307
15093	Woodstock	woodstock	28	309
15094	Wytheville	wytheville	28	307
15095	Yorktown	yorktown	28	306
15096	Aquia Harbour	aquia-harbour	28	309
15097	Bailey s Crossroads	bailey-s-crossroads	28	309
15098	Belle Haven	belle-haven	28	309
15099	Bellwood	bellwood	28	308
15100	Bon Air	bon-air	28	308
15101	Brambleton	brambleton	28	309
15102	Brightwood	brightwood	28	313
15103	Bull Run	bull-run	28	309
15104	Cave Spring	cave-spring	28	307
15105	Chamberlayne	chamberlayne	28	308
15106	Chilhowie	chilhowie	28	305
15107	Crozet	crozet	28	313
15108	Dale City	dale-city	28	309
15109	Dumbarton	dumbarton	28	308
15110	East Highland Park	east-highland-park	28	308
15111	Falmouth	falmouth	28	309
15112	Fort Hunt	fort-hunt	28	309
15113	Franconia	franconia	28	309
15114	Groveton	groveton	28	309
15115	Hollins	hollins	28	307
15116	Hybla Valley	hybla-valley	28	309
15117	Idylwood	idylwood	28	309
15118	Lake Monticello	lake-monticello	28	313
15119	Lake Ridge	lake-ridge	28	309
15120	Lakeside	lakeside	28	308
15121	Laurel	laurel	28	308
15122	Lincolnia	lincolnia	28	309
15123	Manassas Park	manassas-park	28	309
15124	Mantua	mantua	28	309
15125	Massanutten	massanutten	28	312
15126	Matoaca	matoaca	28	308
15127	Montclair	montclair	28	309
15128	Montrose	montrose	28	308
15129	North Springfield	north-springfield	28	309
15130	Pennington Gap	pennington-gap	28	305
15131	Potomac Falls	potomac-falls	28	309
15132	Rose Hill	rose-hill	28	309
15133	Short Pump	short-pump	28	308
15134	Timberlake	timberlake	28	307
15135	Tuckahoe	tuckahoe	28	308
15136	Tysons Corner	tysons-corner	28	309
15137	West Falls Church	west-falls-church	28	309
15138	West Springfield	west-springfield	28	309
15139	Wolf Trap	wolf-trap	28	309
15140	Woodlake	woodlake	28	308
15141	Wyndham	wyndham	28	308
15142	Arlington	arlington	36	315
15143	Bakersfield	bakersfield	36	316
15144	Barre	barre	36	316
15145	Bennington	bennington	36	315
15146	Bethel	bethel	36	316
15147	Bradford	bradford	36	316
15148	Brandon	brandon	36	316
15149	Brattleboro	brattleboro	36	317
15150	Bristol	bristol	36	316
15151	Brookfield	brookfield	36	316
15152	Burlington	burlington	36	316
15153	Cabot	cabot	36	316
15154	Castleton	castleton	36	316
15155	Cavendish	cavendish	36	316
15156	Charlotte	charlotte	36	316
15157	Chelsea	chelsea	36	316
15158	Chester	chester	36	316
15159	Chittenden	chittenden	36	316
15160	Colchester	colchester	36	316
15161	Craftsbury	craftsbury	36	316
15162	Danby	danby	36	316
15163	Danville	danville	36	316
15164	Dorset	dorset	36	315
15165	East Montpelier	east-montpelier	36	316
15166	Essex	essex	36	316
15167	Fairlee	fairlee	36	316
15168	Franklin	franklin	36	316
15169	Grafton	grafton	36	317
15170	Grand Isle	grand-isle	36	316
15171	Hartford	hartford	36	316
15172	Hartland	hartland	36	316
15173	Highgate Center	highgate-center	36	316
15174	Hinesburg	hinesburg	36	316
15175	Jericho	jericho	36	316
15176	Johnson	johnson	36	316
15177	Killington	killington	36	316
15178	Londonderry	londonderry	36	317
15179	Ludlow	ludlow	36	316
15180	Lunenburg	lunenburg	36	316
15181	Manchester	manchester	36	315
15182	Marlboro	marlboro	36	317
15183	Middlebury	middlebury	36	316
15184	Middletown Springs	middletown-springs	36	316
15185	Milton	milton	36	316
15186	Montpelier	montpelier	36	316
15187	Moretown	moretown	36	316
15188	Morgan	morgan	36	316
15189	Mount Holly	mount-holly	36	316
15190	Newbury	newbury	36	316
15191	Newport	newport	36	316
15192	North Hero	north-hero	36	316
15193	Northfield	northfield	36	316
15194	Norton	norton	36	316
15195	Norwich	norwich	36	316
15196	Pittsfield	pittsfield	36	316
15197	Pittsford	pittsford	36	316
15198	Plainfield	plainfield	36	316
15199	Plymouth	plymouth	36	316
15200	Pownal	pownal	36	315
15201	Proctor	proctor	36	316
15202	Putney	putney	36	317
15203	Randolph	randolph	36	316
15204	Reading	reading	36	316
15205	Richford	richford	36	316
15206	Richmond	richmond	36	316
15207	Rochester	rochester	36	316
15208	Rutland	rutland	36	316
15209	Shelburne	shelburne	36	316
15210	Shoreham	shoreham	36	316
15211	South Burlington	south-burlington	36	316
15212	Springfield	springfield	36	316
15213	Saint Albans City	saint-albans-city	36	316
15214	Stamford	stamford	36	315
15215	Stockbridge	stockbridge	36	316
15216	Stowe	stowe	36	316
15217	Swanton	swanton	36	316
15218	Townshend	townshend	36	317
15219	Troy	troy	36	316
15220	Tunbridge	tunbridge	36	316
15221	Underhill	underhill	36	316
15222	Vergennes	vergennes	36	316
15223	Vernon	vernon	36	317
15224	Waitsfield	waitsfield	36	316
15225	Wardsboro	wardsboro	36	317
15226	Washington	washington	36	316
15227	Waterbury	waterbury	36	316
15228	West Pawlet	west-pawlet	36	316
15229	Westford	westford	36	316
15230	Weston	weston	36	316
15231	Williamstown	williamstown	36	316
15232	Williston	williston	36	316
15233	Wilmington	wilmington	36	317
15234	Windsor	windsor	36	316
15235	Winooski	winooski	36	316
15236	Wolcott	wolcott	36	316
15237	Woodstock	woodstock	36	316
15238	Alburgh	alburgh	36	316
15239	Arlington	arlington	36	315
15240	Bennington	bennington	36	315
15241	Bradford	bradford	36	316
15242	Brandon	brandon	36	316
15243	Brattleboro	brattleboro	36	317
15244	Bristol	bristol	36	316
15245	Cabot	cabot	36	316
15246	Cornwall	cornwall	36	316
15247	Jay	jay	36	316
15248	Jericho	jericho	36	316
15249	Johnson	johnson	36	316
15250	Ludlow	ludlow	36	316
15251	Lyndon	lyndon	36	316
15252	Manchester	manchester	36	315
15253	Middlebury	middlebury	36	316
15254	Milton	milton	36	316
15255	Morristown	morristown	36	316
15256	Northfield	northfield	36	316
15257	Town of Rockingham	town-of-rockingham	36	317
15258	Royalton	royalton	36	316
15259	Springfield	springfield	36	316
15260	Saint Johnsbury	saint-johnsbury	36	316
15261	Swanton	swanton	36	316
15262	Warren	warren	36	316
15263	Waterbury	waterbury	36	316
15264	Aberdeen	aberdeen	27	318
15265	Acme	acme	27	318
15266	Addy	addy	27	319
15267	Adna	adna	27	318
15268	Airway Heights	airway-heights	27	319
15269	Almira	almira	27	319
15270	Amanda Park	amanda-park	27	318
15271	Anacortes	anacortes	27	318
15272	Anatone	anatone	27	319
15273	Arlington	arlington	27	318
15274	Asotin	asotin	27	319
15275	Auburn	auburn	27	318
15276	Bainbridge Island	bainbridge-island	27	318
15277	Battle Ground	battle-ground	27	320
15278	Belfair	belfair	27	318
15279	Bellevue	bellevue	27	318
15280	Bellingham	bellingham	27	318
15281	Benge	benge	27	319
15282	Benton City	benton-city	27	321
15283	Bickleton	bickleton	27	320
15284	Bingen	bingen	27	320
15285	Black Diamond	black-diamond	27	318
15286	Blaine	blaine	27	318
15287	Bothell	bothell	27	318
15288	Bow	bow	27	318
15289	Bremerton	bremerton	27	318
15290	Brewster	brewster	27	319
15291	Bridgeport	bridgeport	27	318
15292	Brinnon	brinnon	27	318
15293	Brush Prairie	brush-prairie	27	320
15294	Buckley	buckley	27	318
15295	Buena	buena	27	321
15296	Burbank	burbank	27	321
15297	Burlington	burlington	27	318
15298	Camas	camas	27	320
15299	Carbonado	carbonado	27	318
15300	Carnation	carnation	27	318
15301	Cashmere	cashmere	27	318
15302	Castle Rock	castle-rock	27	320
15303	Cathlamet	cathlamet	27	320
15304	Centerville	centerville	27	320
15305	Centralia	centralia	27	318
15306	Chehalis	chehalis	27	318
15307	Chelan	chelan	27	318
15308	Cheney	cheney	27	319
15309	Chewelah	chewelah	27	319
15310	Chimacum	chimacum	27	318
15311	Clarkston	clarkston	27	319
15312	Cle Elum	cle-elum	27	321
15313	Clear Lake	clear-lake	27	318
15314	Clinton	clinton	27	318
15315	Colfax	colfax	27	319
15316	College Place	college-place	27	321
15317	Colton	colton	27	319
15318	Colville	colville	27	319
15319	Concrete	concrete	27	318
15320	Connell	connell	27	321
15321	Conway	conway	27	318
15322	Cosmopolis	cosmopolis	27	318
15323	Coulee City	coulee-city	27	319
15324	Coulee Dam	coulee-dam	27	319
15325	Coupeville	coupeville	27	318
15326	Cowiche	cowiche	27	321
15327	Creston	creston	27	319
15328	Curlew	curlew	27	319
15329	Cusick	cusick	27	319
15330	Custer	custer	27	318
15331	Dallesport	dallesport	27	320
15332	Danville	danville	27	319
15333	Darrington	darrington	27	318
15334	Davenport	davenport	27	319
15335	Dayton	dayton	27	319
15336	Deer Park	deer-park	27	319
15337	Deming	deming	27	318
15338	Dixie	dixie	27	321
15339	DuPont	dupont	27	318
15340	Duvall	duvall	27	318
15341	East Wenatchee	east-wenatchee	27	318
15342	Easton	easton	27	321
15343	Eatonville	eatonville	27	318
15344	Edmonds	edmonds	27	318
15345	Ellensburg	ellensburg	27	321
15346	Elma	elma	27	318
15347	Endicott	endicott	27	319
15348	Entiat	entiat	27	318
15349	Enumclaw	enumclaw	27	318
15350	Ephrata	ephrata	27	319
15351	Everett	everett	27	318
15352	Everson	everson	27	318
15353	Fairchild Air Force Base	fairchild-air-force-base	27	319
15354	Fairfield	fairfield	27	319
15355	Fall City	fall-city	27	318
15356	Federal Way	federal-way	27	318
15357	Ferndale	ferndale	27	318
15358	Forks	forks	27	318
15359	Freeland	freeland	27	318
15360	Friday Harbor	friday-harbor	27	318
15361	Garfield	garfield	27	319
15362	George	george	27	319
15363	Gig Harbor	gig-harbor	27	318
15364	Gold Bar	gold-bar	27	318
15365	Goldendale	goldendale	27	320
15366	Graham	graham	27	318
15367	Grand Coulee	grand-coulee	27	319
15368	Grandview	grandview	27	321
15369	Granger	granger	27	321
15370	Granite Falls	granite-falls	27	318
15371	Greenbank	greenbank	27	318
15372	Hamilton	hamilton	27	318
15373	Harrington	harrington	27	319
15374	Hartline	hartline	27	319
15375	Hay	hay	27	319
15376	Hoodsport	hoodsport	27	318
15377	Hoquiam	hoquiam	27	318
15378	Hunters	hunters	27	319
15379	Ilwaco	ilwaco	27	318
15380	Inchelium	inchelium	27	319
15381	Index	index	27	318
15382	Issaquah	issaquah	27	318
15383	Joyce	joyce	27	318
15384	Kahlotus	kahlotus	27	321
15385	Kalama	kalama	27	320
15386	Keller	keller	27	319
15387	Kelso	kelso	27	320
15388	Kenmore	kenmore	27	318
15389	Kennewick	kennewick	27	321
15390	Kent	kent	27	318
15391	Kettle Falls	kettle-falls	27	319
15392	Keyport	keyport	27	318
15393	Kingston	kingston	27	318
15394	Kirkland	kirkland	27	318
15395	Kittitas	kittitas	27	321
15396	La Center	la-center	27	320
15397	La Conner	la-conner	27	318
15398	La Push	la-push	27	318
15399	Lacey	lacey	27	318
15400	LaCrosse	lacrosse	27	319
15401	Lake Stevens	lake-stevens	27	318
15402	Lakewood	lakewood	27	318
15403	Lamont	lamont	27	319
15404	Langley	langley	27	318
15405	Leavenworth	leavenworth	27	318
15406	Liberty Lake	liberty-lake	27	319
15407	Lind	lind	27	319
15408	Long Beach	long-beach	27	318
15409	Longview	longview	27	320
15410	Lopez Island	lopez-island	27	318
15411	Lummi Island	lummi-island	27	318
15412	Lyle	lyle	27	320
15413	Lynden	lynden	27	318
15414	Lynnwood	lynnwood	27	318
15415	Mabton	mabton	27	321
15416	Manchester	manchester	27	318
15417	Mansfield	mansfield	27	318
15418	Manson	manson	27	318
15419	Maple Falls	maple-falls	27	318
15420	Maple Valley	maple-valley	27	318
15421	Marysville	marysville	27	318
15422	Mattawa	mattawa	27	319
15423	McCleary	mccleary	27	318
15424	McKenna	mckenna	27	318
15425	Mead	mead	27	319
15426	Medical Lake	medical-lake	27	319
15427	Medina	medina	27	318
15428	Menlo	menlo	27	318
15429	Mercer Island	mercer-island	27	318
15430	Milton	milton	27	318
15431	Monroe	monroe	27	318
15432	Montesano	montesano	27	318
15433	Morton	morton	27	318
15434	Moses Lake	moses-lake	27	319
15435	Mossyrock	mossyrock	27	318
15436	Mount Vernon	mount-vernon	27	318
15437	Mountlake Terrace	mountlake-terrace	27	318
15438	Moxee	moxee	27	321
15439	Mukilteo	mukilteo	27	318
15440	Naches	naches	27	321
15441	Napavine	napavine	27	318
15442	Naselle	naselle	27	318
15443	Nespelem	nespelem	27	319
15444	Newman Lake	newman-lake	27	319
15445	Newport	newport	27	319
15446	Nine Mile Falls	nine-mile-falls	27	319
15447	Nooksack	nooksack	27	318
15448	North Bend	north-bend	27	318
15449	Oak Harbor	oak-harbor	27	318
15450	Oakesdale	oakesdale	27	319
15451	Oakville	oakville	27	318
15452	Ocean Park	ocean-park	27	318
15453	Ocean Shores	ocean-shores	27	318
15454	Odessa	odessa	27	319
15455	Okanogan	okanogan	27	319
15456	Olalla	olalla	27	318
15457	Olympia	olympia	27	318
15458	Omak	omak	27	319
15459	Onalaska	onalaska	27	318
15460	Orient	orient	27	319
15461	Orondo	orondo	27	318
15462	Oroville	oroville	27	319
15463	Orting	orting	27	318
15464	Othello	othello	27	319
15465	Pacific	pacific	27	318
15466	Palisades	palisades	27	318
15467	Palouse	palouse	27	319
15468	Parker	parker	27	321
15469	Pasco	pasco	27	321
15470	Paterson	paterson	27	321
15471	Pe Ell	pe-ell	27	318
15472	Point Roberts	point-roberts	27	318
15473	Pomeroy	pomeroy	27	319
15474	Port Angeles	port-angeles	27	318
15475	Port Hadlock-Irondale	port-hadlock-irondale	27	318
15476	Port Ludlow	port-ludlow	27	318
15477	Port Orchard	port-orchard	27	318
15478	Port Townsend	port-townsend	27	318
15479	Poulsbo	poulsbo	27	318
15480	Prescott	prescott	27	321
15481	Preston	preston	27	318
15482	Prosser	prosser	27	321
15483	Pullman	pullman	27	319
15484	Puyallup	puyallup	27	318
15485	Quilcene	quilcene	27	318
15486	Quincy	quincy	27	319
15487	Rainier	rainier	27	318
15488	Randle	randle	27	318
15489	Raymond	raymond	27	318
15490	Redmond	redmond	27	318
15491	Renton	renton	27	318
15492	Republic	republic	27	319
15493	Rice	rice	27	319
15494	Richland	richland	27	321
15495	Ridgefield	ridgefield	27	320
15496	Ritzville	ritzville	27	319
15497	Riverside	riverside	27	319
15498	Rochester	rochester	27	318
15499	Rockford	rockford	27	319
15500	Roosevelt	roosevelt	27	320
15501	Rosalia	rosalia	27	319
15502	Roslyn	roslyn	27	321
15503	Roy	roy	27	318
15504	Royal City	royal-city	27	319
15505	Salkum	salkum	27	318
15506	Sammamish	sammamish	27	318
15507	Satsop	satsop	27	318
15508	Seattle	seattle	27	318
15509	Sedro-Woolley	sedro-woolley	27	318
15510	Sekiu	sekiu	27	318
15511	Selah	selah	27	321
15512	Sequim	sequim	27	318
15513	Shaw Island	shaw-island	27	318
15514	Shelton	shelton	27	318
15515	Silverdale	silverdale	27	318
15516	Silver Lake	silver-lake	27	320
15517	Snohomish	snohomish	27	318
15518	Snoqualmie	snoqualmie	27	318
15519	Snoqualmie Pass	snoqualmie-pass	27	321
15520	South Bend	south-bend	27	318
15521	Southworth	southworth	27	318
15522	Spanaway	spanaway	27	318
15523	Spangle	spangle	27	319
15524	Spokane	spokane	27	319
15525	Sprague	sprague	27	319
15526	Springdale	springdale	27	319
15527	Saint John	saint-john	27	319
15528	Stanwood	stanwood	27	318
15529	Starbuck	starbuck	27	319
15530	Steilacoom	steilacoom	27	318
15531	Steptoe	steptoe	27	319
15532	Stevenson	stevenson	27	320
15533	Sultan	sultan	27	318
15534	Sumas	sumas	27	318
15535	Sumner	sumner	27	318
15536	Sunnyside	sunnyside	27	321
15537	Tacoma	tacoma	27	318
15538	Taholah	taholah	27	318
15539	Tekoa	tekoa	27	319
15540	Tenino	tenino	27	318
15541	Toledo	toledo	27	318
15542	Tonasket	tonasket	27	319
15543	Toppenish	toppenish	27	321
15544	Touchet	touchet	27	321
15545	Toutle	toutle	27	320
15546	Tracyton	tracyton	27	318
15547	Trout Lake	trout-lake	27	320
15548	Tumwater	tumwater	27	318
15549	Twisp	twisp	27	319
15550	Union	union	27	318
15551	University Place	university-place	27	318
15552	Valley	valley	27	319
15553	Valleyford	valleyford	27	319
15554	Vancouver	vancouver	27	320
15555	Vashon	vashon	27	318
15556	Waitsburg	waitsburg	27	321
15557	Walla Walla	walla-walla	27	321
15558	Wapato	wapato	27	321
15559	Warden	warden	27	319
15560	Washougal	washougal	27	320
15561	Washtucna	washtucna	27	319
15562	Waterville	waterville	27	318
15563	Wellpinit	wellpinit	27	319
15564	Wenatchee	wenatchee	27	318
15565	Westport	westport	27	318
15566	White Swan	white-swan	27	321
15567	Wilbur	wilbur	27	319
15568	Wilkeson	wilkeson	27	318
15569	Winlock	winlock	27	318
15570	Winthrop	winthrop	27	319
15571	Wishram	wishram	27	320
15572	Woodinville	woodinville	27	318
15573	Woodland	woodland	27	320
15574	Yakima	yakima	27	321
15575	Yelm	yelm	27	318
15576	Zillah	zillah	27	321
15577	Alderwood Manor	alderwood-manor	27	318
15578	Artondale	artondale	27	318
15579	Bonney Lake	bonney-lake	27	318
15580	Burien	burien	27	318
15581	Camano Island	camano-island	27	318
15582	Cascade-Fairwood	cascade-fairwood	27	318
15583	Cottage Lake	cottage-lake	27	318
15584	Country Homes	country-homes	27	319
15585	Covington	covington	27	318
15586	Des Moines	des-moines	27	318
15587	East Hill-Meridian	east-hill-meridian	27	318
15588	East Renton Highlands	east-renton-highlands	27	318
15589	Edgewood	edgewood	27	318
15590	Elk Plain	elk-plain	27	318
15591	Fife	fife	27	318
15592	Five Corners	five-corners	27	320
15593	Hazel Dell North	hazel-dell-north	27	320
15594	Inglewood-Finn Hill	inglewood-finn-hill	27	318
15595	Lakeland North	lakeland-north	27	318
15596	Maltby	maltby	27	318
15597	Martha Lake	martha-lake	27	318
15598	Mill Creek	mill-creek	27	318
15599	Mirrormont	mirrormont	27	318
15600	North Creek	north-creek	27	318
15601	Paine Field-Lake Stickney	paine-field-lake-stickney	27	318
15602	Parkland	parkland	27	318
15603	Parkwood	parkwood	27	318
15604	Picnic Point-North Lynnwood	picnic-point-north-lynnwood	27	318
15605	Salmon Creek	salmon-creek	27	320
15606	SeaTac	seatac	27	318
15607	Shoreline	shoreline	27	318
15608	South Hill	south-hill	27	318
15609	Spokane Valley	spokane-valley	27	319
15610	Three Lakes	three-lakes	27	318
15611	Tukwila	tukwila	27	318
15612	Union Hill-Novelty Hill	union-hill-novelty-hill	27	318
15613	West Richland	west-richland	27	321
15614	White Center	white-center	27	318
15615	White Salmon	white-salmon	27	320
15616	Abbotsford	abbotsford	22	322
15617	Abrams	abrams	22	323
15618	Adams	adams	22	322
15619	Afton	afton	22	324
15620	Albany	albany	22	324
15621	Algoma	algoma	22	323
15622	Allenton	allenton	22	325
15623	Alma	alma	22	326
15624	Alma Center	alma-center	22	326
15625	Almond	almond	22	322
15626	Altoona	altoona	22	326
15627	Amberg	amberg	22	323
15628	Amery	amery	22	327
15629	Amherst	amherst	22	322
15630	Antigo	antigo	22	322
15631	Appleton	appleton	22	323
15632	Arcadia	arcadia	22	326
15633	Arena	arena	22	324
15634	Argyle	argyle	22	324
15635	Arlington	arlington	22	324
15636	Ashippun	ashippun	22	325
15637	Ashland	ashland	22	328
15638	Athens	athens	22	322
15639	Auburndale	auburndale	22	322
15640	Augusta	augusta	22	326
15641	Avoca	avoca	22	324
15642	Bagley	bagley	22	324
15643	Baldwin	baldwin	22	327
15644	Balsam Lake	balsam-lake	22	327
15645	Bangor	bangor	22	326
15646	Baraboo	baraboo	22	324
15647	Barneveld	barneveld	22	324
15648	Barron	barron	22	327
15649	Bassett	bassett	22	325
15650	Bayfield	bayfield	22	328
15651	Bear Creek	bear-creek	22	323
15652	Beaver Dam	beaver-dam	22	325
15653	Belgium	belgium	22	325
15654	Belleville	belleville	22	324
15655	Belmont	belmont	22	324
15656	Beloit	beloit	22	324
15657	Benton	benton	22	324
15658	Berlin	berlin	22	323
15659	Big Bend	big-bend	22	325
15660	Birchwood	birchwood	22	327
15661	Black Earth	black-earth	22	324
15662	Black River Falls	black-river-falls	22	326
15663	Blair	blair	22	326
15664	Blanchardville	blanchardville	22	324
15665	Blenker	blenker	22	322
15666	Bloomer	bloomer	22	326
15667	Blue Mounds	blue-mounds	22	324
15668	Blue River	blue-river	22	324
15669	Bonduel	bonduel	22	323
15670	Boscobel	boscobel	22	324
15671	Boulder Junction	boulder-junction	22	322
15672	Bowler	bowler	22	323
15673	Boyceville	boyceville	22	327
15674	Briggsville	briggsville	22	324
15675	Brillion	brillion	22	323
15676	Brodhead	brodhead	22	324
15677	Brokaw	brokaw	22	322
15678	Brookfield	brookfield	22	325
15679	Brownsville	brownsville	22	325
15680	Bruce	bruce	22	326
15681	Brussels	brussels	22	323
15682	Burlington	burlington	22	325
15683	Butler	butler	22	325
15684	Butternut	butternut	22	328
15685	Cable	cable	22	328
15686	Cadott	cadott	22	326
15687	Cambria	cambria	22	324
15688	Cambridge	cambridge	22	324
15689	Cameron	cameron	22	327
15690	Camp Douglas	camp-douglas	22	324
15691	Campbellsport	campbellsport	22	323
15692	Cascade	cascade	22	325
15693	Casco	casco	22	323
15694	Cashton	cashton	22	326
15695	Cassville	cassville	22	324
15696	Cazenovia	cazenovia	22	324
15697	Cedar Grove	cedar-grove	22	325
15698	Cedarburg	cedarburg	22	325
15699	Centuria	centuria	22	327
15700	Chetek	chetek	22	327
15701	Chilton	chilton	22	323
15702	Chippewa Falls	chippewa-falls	22	326
15703	Clayton	clayton	22	327
15704	Clear Lake	clear-lake	22	327
15705	Cleveland	cleveland	22	323
15706	Clinton	clinton	22	324
15707	Clintonville	clintonville	22	323
15708	Cochrane	cochrane	22	326
15709	Colby	colby	22	326
15710	Coleman	coleman	22	323
15711	Colfax	colfax	22	327
15712	Coloma	coloma	22	323
15713	Columbus	columbus	22	324
15714	Combined Locks	combined-locks	22	323
15715	Coon Valley	coon-valley	22	326
15716	Cornell	cornell	22	326
15717	Cottage Grove	cottage-grove	22	324
15718	Crandon	crandon	22	322
15719	Crivitz	crivitz	22	323
15720	Cross Plains	cross-plains	22	324
15721	Cuba City	cuba-city	22	324
15722	Cudahy	cudahy	22	325
15723	Cumberland	cumberland	22	327
15724	Dallas	dallas	22	327
15725	Darlington	darlington	22	324
15726	DeForest	deforest	22	324
15727	De Pere	de-pere	22	323
15728	De Soto	de-soto	22	326
15729	Deerfield	deerfield	22	324
15730	Delafield	delafield	22	325
15731	Delavan	delavan	22	325
15732	Denmark	denmark	22	323
15733	Dodgeville	dodgeville	22	324
15734	Dorchester	dorchester	22	326
15735	Dousman	dousman	22	325
15736	Downsville	downsville	22	327
15737	Dresser	dresser	22	327
15738	Durand	durand	22	326
15739	Eagle	eagle	22	325
15740	Eagle River	eagle-river	22	322
15741	East Troy	east-troy	22	325
15742	Eau Claire	eau-claire	22	326
15743	Eden	eden	22	323
15744	Edgar	edgar	22	322
15745	Edgerton	edgerton	22	324
15746	Eleva	eleva	22	326
15747	Elk Mound	elk-mound	22	327
15748	Elkhart Lake	elkhart-lake	22	325
15749	Elkhorn	elkhorn	22	325
15750	Ellsworth	ellsworth	22	327
15751	Elm Grove	elm-grove	22	325
15752	Elmwood	elmwood	22	327
15753	Elroy	elroy	22	324
15754	Endeavor	endeavor	22	324
15755	Evansville	evansville	22	324
15756	Fairwater	fairwater	22	323
15757	Fall Creek	fall-creek	22	326
15758	Fall River	fall-river	22	324
15759	Fennimore	fennimore	22	324
15760	Fifield	fifield	22	322
15761	Fish Creek	fish-creek	22	323
15762	Florence	florence	22	323
15763	Fond du Lac	fond-du-lac	22	323
15764	Fontana-on-Geneva Lake	fontana-on-geneva-lake	22	325
15765	Forestville	forestville	22	323
15766	Fountain City	fountain-city	22	326
15767	Francis Creek	francis-creek	22	323
15768	Franklin	franklin	22	325
15769	Frederic	frederic	22	327
15770	Fredonia	fredonia	22	325
15771	Friendship	friendship	22	322
15772	Fort Atkinson	fort-atkinson	22	325
15773	Galesville	galesville	22	326
15774	Gays Mills	gays-mills	22	326
15775	Germantown	germantown	22	325
15776	Gillett	gillett	22	323
15777	Gilman	gilman	22	322
15778	Gilmanton	gilmanton	22	326
15779	Glenwood City	glenwood-city	22	327
15780	Glidden	glidden	22	328
15781	Goodman	goodman	22	323
15782	Grafton	grafton	22	325
15783	Grand Marsh	grand-marsh	22	322
15784	Granton	granton	22	326
15785	Grantsburg	grantsburg	22	327
15786	Green Bay	green-bay	22	323
15787	Green Lake	green-lake	22	323
15788	Greendale	greendale	22	325
15789	Greenwood	greenwood	22	326
15790	Hales Corners	hales-corners	22	325
15791	Hammond	hammond	22	327
15792	Hancock	hancock	22	323
15793	Hartford	hartford	22	325
15794	Hartland	hartland	22	325
15795	Hawkins	hawkins	22	326
15796	Hayward	hayward	22	328
15913	Oakfield	oakfield	22	323
15797	Hazel Green	hazel-green	22	324
15798	Helenville	helenville	22	325
15799	Hewitt	hewitt	22	322
15800	Highland	highland	22	324
15801	Hilbert	hilbert	22	323
15802	Hillsboro	hillsboro	22	326
15803	Holcombe	holcombe	22	326
15804	Holmen	holmen	22	326
15805	Horicon	horicon	22	325
15806	Hortonville	hortonville	22	323
15807	Hubertus	hubertus	22	325
15808	Hudson	hudson	22	327
15809	Hurley	hurley	22	328
15810	Hustisford	hustisford	22	325
15811	Independence	independence	22	326
15812	Iola	iola	22	323
15813	Iron Ridge	iron-ridge	22	325
15814	Jackson	jackson	22	325
15815	Janesville	janesville	22	324
15816	Jefferson	jefferson	22	325
15817	Johnson Creek	johnson-creek	22	325
15818	Juda	juda	22	324
15819	Junction City	junction-city	22	322
15820	Juneau	juneau	22	325
15821	Kaukauna	kaukauna	22	323
15822	Kenosha	kenosha	22	325
15823	Keshena	keshena	22	323
15824	Kewaskum	kewaskum	22	325
15825	Kewaunee	kewaunee	22	323
15826	Kiel	kiel	22	323
15827	Kimberly	kimberly	22	323
15828	Kohler	kohler	22	325
15829	La Crosse	la-crosse	22	326
15830	La Farge	la-farge	22	326
15831	La Valle	la-valle	22	324
15832	Lac du Flambeau	lac-du-flambeau	22	322
15833	Ladysmith	ladysmith	22	326
15834	Lake Geneva	lake-geneva	22	325
15835	Lake Mills	lake-mills	22	325
15836	Lancaster	lancaster	22	324
15837	Land O  Lakes	land-o-lakes	22	322
15838	Lannon	lannon	22	325
15839	Lena	lena	22	323
15840	Little Chute	little-chute	22	323
15841	Livingston	livingston	22	324
15842	Lodi	lodi	22	324
15843	Lomira	lomira	22	325
15844	Lowell	lowell	22	325
15845	Loyal	loyal	22	326
15846	Luck	luck	22	327
15847	Luxemburg	luxemburg	22	323
15848	Madison	madison	22	324
15849	Manawa	manawa	22	323
15850	Manitowish Waters	manitowish-waters	22	322
15851	Manitowoc	manitowoc	22	323
15852	Maple	maple	22	328
15853	Marinette	marinette	22	323
15854	Marion	marion	22	323
15855	Markesan	markesan	22	323
15856	Marshall	marshall	22	324
15857	Marshfield	marshfield	22	322
15858	Mauston	mauston	22	324
15859	Mayville	mayville	22	325
15860	Mazomanie	mazomanie	22	324
15861	McFarland	mcfarland	22	324
15862	Medford	medford	22	322
15863	Mellen	mellen	22	328
15864	Melrose	melrose	22	326
15865	Menasha	menasha	22	323
15866	Menomonee Falls	menomonee-falls	22	325
15867	Menomonie	menomonie	22	327
15868	Mequon	mequon	22	325
15869	Merrill	merrill	22	322
15870	Merrillan	merrillan	22	326
15871	Merrimac	merrimac	22	324
15872	Merton	merton	22	325
15873	Middleton	middleton	22	324
15874	Milltown	milltown	22	327
15875	Milton	milton	22	324
15876	Milwaukee	milwaukee	22	325
15877	Mineral Point	mineral-point	22	324
15878	Minocqua	minocqua	22	322
15879	Minong	minong	22	327
15880	Mishicot	mishicot	22	323
15881	Mondovi	mondovi	22	326
15882	Monroe	monroe	22	324
15883	Montello	montello	22	324
15884	Monticello	monticello	22	324
15885	Mosinee	mosinee	22	322
15886	Mount Calvary	mount-calvary	22	323
15887	Mount Horeb	mount-horeb	22	324
15888	Mukwonago	mukwonago	22	325
15889	Muscoda	muscoda	22	324
15890	Muskego	muskego	22	325
15891	Nashotah	nashotah	22	325
15892	Necedah	necedah	22	324
15893	Neenah	neenah	22	323
15894	Neillsville	neillsville	22	326
15895	Nekoosa	nekoosa	22	322
15896	Neosho	neosho	22	325
15897	New Auburn	new-auburn	22	326
15898	New Berlin	new-berlin	22	325
15899	New Franken	new-franken	22	323
15900	New Glarus	new-glarus	22	324
15901	New Holstein	new-holstein	22	323
15902	New Lisbon	new-lisbon	22	324
15903	New London	new-london	22	323
15904	New Richmond	new-richmond	22	327
15905	Newburg	newburg	22	325
15906	Newton	newton	22	323
15907	Niagara	niagara	22	323
15908	North Lake	north-lake	22	325
15909	North Prairie	north-prairie	22	325
15910	Norwalk	norwalk	22	326
15911	Oak Creek	oak-creek	22	325
15912	Oakdale	oakdale	22	326
15914	Oconomowoc	oconomowoc	22	325
15915	Oconto	oconto	22	323
15916	Oconto Falls	oconto-falls	22	323
15917	Omro	omro	22	323
15918	Onalaska	onalaska	22	326
15919	Oneida	oneida	22	323
15920	Ontario	ontario	22	326
15921	Oostburg	oostburg	22	325
15922	Oregon	oregon	22	324
15923	Orfordville	orfordville	22	324
15924	Osceola	osceola	22	327
15925	Oshkosh	oshkosh	22	323
15926	Osseo	osseo	22	326
15927	Owen	owen	22	326
15928	Oxford	oxford	22	324
15929	Packwaukee	packwaukee	22	324
15930	Palmyra	palmyra	22	325
15931	Pardeeville	pardeeville	22	324
15932	Park Falls	park-falls	22	322
15933	Patch Grove	patch-grove	22	324
15934	Pepin	pepin	22	326
15935	Peshtigo	peshtigo	22	323
15936	Pewaukee	pewaukee	22	325
15937	Phillips	phillips	22	322
15938	Pine River	pine-river	22	323
15939	Pittsville	pittsville	22	322
15940	Plain	plain	22	324
15941	Plainfield	plainfield	22	323
15942	Platteville	platteville	22	324
15943	Pleasant Prairie	pleasant-prairie	22	325
15944	Plover	plover	22	322
15945	Plum City	plum-city	22	327
15946	Plymouth	plymouth	22	325
15947	Port Washington	port-washington	22	325
15948	Port Wing	port-wing	22	328
15949	Portage	portage	22	324
15950	Potosi	potosi	22	324
15951	Potter	potter	22	323
15952	Poy Sippi	poy-sippi	22	323
15953	Poynette	poynette	22	324
15954	Prairie du Chien	prairie-du-chien	22	326
15955	Prairie du Sac	prairie-du-sac	22	324
15956	Prairie Farm	prairie-farm	22	327
15957	Prentice	prentice	22	322
15958	Prescott	prescott	22	327
15959	Princeton	princeton	22	323
15960	Pulaski	pulaski	22	323
15961	Racine	racine	22	325
15962	Randolph	randolph	22	325
15963	Random Lake	random-lake	22	325
15964	Redgranite	redgranite	22	323
15965	Reedsburg	reedsburg	22	324
15966	Reedsville	reedsville	22	323
15967	Rhinelander	rhinelander	22	322
15968	Rib Lake	rib-lake	22	322
15969	Rice Lake	rice-lake	22	327
15970	Richfield	richfield	22	325
15971	Richland Center	richland-center	22	324
15972	Rio	rio	22	324
15973	Ripon	ripon	22	323
15974	River Falls	river-falls	22	327
15975	Rochester	rochester	22	325
15976	Rosendale	rosendale	22	323
15977	Rosholt	rosholt	22	322
15978	Rothschild	rothschild	22	322
15979	Rubicon	rubicon	22	325
15980	Salem	salem	22	325
15981	Sauk City	sauk-city	22	324
15982	Saukville	saukville	22	325
15983	Schofield	schofield	22	322
15984	Seymour	seymour	22	323
15985	Sharon	sharon	22	325
15986	Shawano	shawano	22	323
15987	Sheboygan	sheboygan	22	325
15988	Sheboygan Falls	sheboygan-falls	22	325
15989	Shell Lake	shell-lake	22	327
15990	Sherwood	sherwood	22	323
15991	Shiocton	shiocton	22	323
15992	Shullsburg	shullsburg	22	324
15993	Silver Lake	silver-lake	22	325
15994	Sinsinawa	sinsinawa	22	324
15995	Siren	siren	22	327
15996	Slinger	slinger	22	325
15997	Solon Springs	solon-springs	22	328
15998	Somerset	somerset	22	327
15999	South Milwaukee	south-milwaukee	22	325
16000	South Wayne	south-wayne	22	324
16001	Sparta	sparta	22	326
16002	Spencer	spencer	22	322
16003	Spooner	spooner	22	327
16004	Spring Green	spring-green	22	324
16005	Spring Valley	spring-valley	22	327
16006	Saint Cloud	saint-cloud	22	323
16007	Saint Croix Falls	saint-croix-falls	22	327
16008	Stanley	stanley	22	326
16009	Stevens Point	stevens-point	22	322
16010	Stockbridge	stockbridge	22	323
16011	Stockholm	stockholm	22	326
16012	Stoughton	stoughton	22	324
16013	Stratford	stratford	22	322
16014	Strum	strum	22	326
16015	Sturgeon Bay	sturgeon-bay	22	323
16016	Sturtevant	sturtevant	22	325
16017	Sullivan	sullivan	22	325
16018	Sun Prairie	sun-prairie	22	324
16019	Superior	superior	22	328
16020	Suring	suring	22	323
16021	Sussex	sussex	22	325
16022	Taylor	taylor	22	326
16023	Thiensville	thiensville	22	325
16024	Thorp	thorp	22	326
16025	Three Lakes	three-lakes	22	322
16026	Tigerton	tigerton	22	323
16027	Tisch Mills	tisch-mills	22	323
16028	Tomah	tomah	22	326
16029	Tomahawk	tomahawk	22	322
16030	Tony	tony	22	326
16031	Trevor	trevor	22	325
16032	Turtle Lake	turtle-lake	22	327
16033	Twin Lakes	twin-lakes	22	325
16034	Two Rivers	two-rivers	22	323
16035	Union Grove	union-grove	22	325
16036	Valders	valders	22	323
16037	Van Dyne	van-dyne	22	323
16038	Verona	verona	22	324
16039	Vesper	vesper	22	322
16040	Viola	viola	22	324
16041	Viroqua	viroqua	22	326
16042	Wales	wales	22	325
16043	Walworth	walworth	22	325
16044	Washburn	washburn	22	328
16045	Washington	washington	22	323
16046	Tichigan	tichigan	22	325
16047	Waterloo	waterloo	22	325
16048	Watertown	watertown	22	325
16049	Waukesha	waukesha	22	325
16050	Waunakee	waunakee	22	324
16051	Waupaca	waupaca	22	323
16052	Waupun	waupun	22	323
16053	Wausau	wausau	22	322
16054	Wausaukee	wausaukee	22	323
16055	Wautoma	wautoma	22	323
16056	Wauzeka	wauzeka	22	326
16057	Webster	webster	22	327
16058	West Bend	west-bend	22	325
16059	West Salem	west-salem	22	326
16060	Westby	westby	22	326
16061	Westfield	westfield	22	324
16062	Weyauwega	weyauwega	22	323
16063	Weyerhaeuser	weyerhaeuser	22	326
16064	White Lake	white-lake	22	322
16065	Whitehall	whitehall	22	326
16066	Whitelaw	whitelaw	22	323
16067	Whitewater	whitewater	22	325
16068	Wild Rose	wild-rose	22	323
16069	Williams Bay	williams-bay	22	325
16070	Wilmot	wilmot	22	325
16071	Wilson	wilson	22	327
16072	Winneconne	winneconne	22	323
16073	Winter	winter	22	328
16074	Wisconsin Dells	wisconsin-dells	22	324
16075	Wisconsin Rapids	wisconsin-rapids	22	322
16076	Wittenberg	wittenberg	22	323
16077	Wonewoc	wonewoc	22	324
16078	Woodruff	woodruff	22	322
16079	Woodville	woodville	22	327
16080	Wrightstown	wrightstown	22	323
16081	Allouez	allouez	22	323
16082	Ashwaubenon	ashwaubenon	22	323
16083	Bayside	bayside	22	325
16084	Bellevue	bellevue	22	323
16085	Brown Deer	brown-deer	22	325
16086	Caledonia	caledonia	22	325
16087	Camp Lake	camp-lake	22	325
16088	Fitchburg	fitchburg	22	324
16089	Fox Point	fox-point	22	325
16090	Glendale	glendale	22	325
16091	Greenfield	greenfield	22	325
16092	Howard	howard	22	323
16093	Howards Grove	howards-grove	22	325
16094	Kronenwetter	kronenwetter	22	322
16095	Lake Delton	lake-delton	22	324
16096	Mount Pleasant	mount-pleasant	22	325
16097	Paddock Lake	paddock-lake	22	325
16098	Village of Pewaukee	village-of-pewaukee	22	325
16099	Shorewood	shorewood	22	325
16100	Saint Francis	saint-francis	22	325
16101	Suamico	suamico	22	323
16102	Wauwatosa	wauwatosa	22	325
16103	West Allis	west-allis	22	325
16104	West Milwaukee	west-milwaukee	22	325
16105	Weston	weston	22	322
16106	Whitefish Bay	whitefish-bay	22	325
16107	Alderson	alderson	19	329
16108	Alloy	alloy	19	329
16109	Ansted	ansted	19	329
16110	Ballard	ballard	19	329
16111	Barboursville	barboursville	19	330
16112	Beaver	beaver	19	329
16113	Beckley	beckley	19	329
16114	Belle	belle	19	330
16115	Berkeley Springs	berkeley-springs	19	331
16116	Beverly	beverly	19	332
16117	Bluefield	bluefield	19	329
16118	Brenton	brenton	19	329
16119	Bridgeport	bridgeport	19	332
16120	Brohard	brohard	19	332
16121	Bruceton Mills	bruceton-mills	19	333
16122	Buckhannon	buckhannon	19	332
16123	Bunker Hill	bunker-hill	19	331
16124	Cedar Grove	cedar-grove	19	330
16125	Ceredo	ceredo	19	330
16126	Chapmanville	chapmanville	19	330
16127	Charles Town	charles-town	19	331
16128	Charleston	charleston	19	330
16129	Chester	chester	19	334
16130	Clarksburg	clarksburg	19	332
16131	Clay	clay	19	330
16132	Colliers	colliers	19	334
16133	Craigsville	craigsville	19	330
16134	Culloden	culloden	19	330
16135	Dailey	dailey	19	332
16136	Daniels	daniels	19	329
16137	Danville	danville	19	330
16138	Delbarton	delbarton	19	330
16139	Dunbar	dunbar	19	330
16140	Eleanor	eleanor	19	330
16141	Elizabeth	elizabeth	19	330
16142	Elkins	elkins	19	332
16143	Ellamore	ellamore	19	332
16144	Erbacon	erbacon	19	332
16145	Fairmont	fairmont	19	332
16146	Falling Waters	falling-waters	19	331
16147	Farmington	farmington	19	332
16148	Fayetteville	fayetteville	19	329
16149	Flatwoods	flatwoods	19	330
16150	Franklin	franklin	19	335
16151	Fort Ashby	fort-ashby	19	331
16152	Gassaway	gassaway	19	330
16153	Gauley Bridge	gauley-bridge	19	329
16154	Glenville	glenville	19	332
16155	Grafton	grafton	19	332
16156	Grantsville	grantsville	19	330
16157	Granville	granville	19	333
16158	Green Bank	green-bank	19	336
16159	Green Spring	green-spring	19	331
16160	Hamlin	hamlin	19	330
16161	Harpers Ferry	harpers-ferry	19	331
16162	Harrisville	harrisville	19	332
16163	Hedgesville	hedgesville	19	331
16164	Hinton	hinton	19	329
16165	Huntington	huntington	19	330
16166	Hurricane	hurricane	19	330
16167	Iaeger	iaeger	19	329
16168	Institute	institute	19	330
16169	Inwood	inwood	19	331
16170	Itmann	itmann	19	329
16171	Kenova	kenova	19	330
16172	Kermit	kermit	19	330
16173	Keyser	keyser	19	331
16174	Keystone	keystone	19	329
16175	Kingwood	kingwood	19	333
16176	LeRoy	leroy	19	330
16177	Leckie	leckie	19	329
16178	Lewisburg	lewisburg	19	329
16179	Lindside	lindside	19	329
16180	Logan	logan	19	330
16181	Lost City	lost-city	19	331
16182	Mabscott	mabscott	19	329
16183	Madison	madison	19	330
16184	Marlinton	marlinton	19	336
16185	Martinsburg	martinsburg	19	331
16186	Middlebourne	middlebourne	19	334
16187	Millville	millville	19	331
16188	Milton	milton	19	330
16189	Montgomery	montgomery	19	329
16190	Moorefield	moorefield	19	331
16191	Morgantown	morgantown	19	333
16192	Moundsville	moundsville	19	334
16193	Mount Clare	mount-clare	19	332
16194	Mount Hope	mount-hope	19	329
16195	Naoma	naoma	19	329
16196	New Cumberland	new-cumberland	19	334
16197	New Martinsville	new-martinsville	19	334
16198	Newell	newell	19	334
16199	Nitro	nitro	19	330
16200	Oak Hill	oak-hill	19	329
16201	Oceana	oceana	19	329
16202	Old Fields	old-fields	19	331
16203	Ona	ona	19	330
16204	Parkersburg	parkersburg	19	337
16205	Parsons	parsons	19	332
16206	Petersburg	petersburg	19	331
16207	Peterstown	peterstown	19	329
16208	Philippi	philippi	19	332
16209	Pineville	pineville	19	329
16210	Poca	poca	19	330
16211	Point Pleasant	point-pleasant	19	330
16212	Princeton	princeton	19	329
16213	Prosperity	prosperity	19	329
16214	Rainelle	rainelle	19	329
16215	Ranson	ranson	19	331
16216	Ravenswood	ravenswood	19	330
16217	Red House	red-house	19	330
16218	Richwood	richwood	19	330
16219	Ripley	ripley	19	330
16220	Romney	romney	19	331
16221	Ronceverte	ronceverte	19	329
16222	Rupert	rupert	19	329
16223	Shady Spring	shady-spring	19	329
16224	Shepherdstown	shepherdstown	19	331
16225	Shinnston	shinnston	19	332
16226	Snowshoe	snowshoe	19	336
16227	Sophia	sophia	19	329
16228	Spencer	spencer	19	330
16229	Saint Albans	saint-albans	19	330
16230	Saint Marys	saint-marys	19	337
16231	Stephenson	stephenson	19	329
16232	Sugar Grove	sugar-grove	19	335
16233	Summersville	summersville	19	330
16234	Sutton	sutton	19	330
16235	Thomas	thomas	19	332
16236	Triadelphia	triadelphia	19	334
16237	Tunnelton	tunnelton	19	333
16238	Union	union	19	329
16239	Valley Grove	valley-grove	19	334
16240	Varney	varney	19	330
16241	Vienna	vienna	19	337
16242	Washington	washington	19	337
16243	Wayne	wayne	19	330
16244	Webster Springs	webster-springs	19	332
16245	Weirton	weirton	19	334
16246	Welch	welch	19	329
16247	Wellsburg	wellsburg	19	334
16248	West Union	west-union	19	332
16249	Weston	weston	19	332
16250	Wheeling	wheeling	19	334
16251	White Sulphur Springs	white-sulphur-springs	19	329
16252	Williamson	williamson	19	330
16253	Williamstown	williamstown	19	337
16254	Winfield	winfield	19	330
16255	Cameron	cameron	19	334
16256	Cross Lanes	cross-lanes	19	330
16257	Davis	davis	19	332
16258	Reedsville	reedsville	19	333
16259	South Charleston	south-charleston	19	330
16260	Teays Valley	teays-valley	19	330
16261	Afton	afton	9	338
16262	Arapahoe	arapahoe	9	339
16263	Baggs	baggs	9	340
16264	Basin	basin	9	341
16265	Big Piney	big-piney	9	338
16266	Bondurant	bondurant	9	338
16267	Buffalo	buffalo	9	340
16268	Burlington	burlington	9	341
16269	Casper	casper	9	339
16270	Cheyenne	cheyenne	9	342
16271	Clearmont	clearmont	9	343
16272	Cody	cody	9	341
16273	Cowley	cowley	9	341
16274	Diamondville	diamondville	9	338
16275	Douglas	douglas	9	339
16276	Dubois	dubois	9	339
16277	Evanston	evanston	9	338
16278	Evansville	evansville	9	339
16279	Farson	farson	9	338
16280	Warren Air Force Base	warren-air-force-base	9	342
16281	Freedom	freedom	9	338
16282	Fort Washakie	fort-washakie	9	339
16283	Gillette	gillette	9	340
16284	Glenrock	glenrock	9	339
16285	Green River	green-river	9	338
16286	Greybull	greybull	9	341
16287	Guernsey	guernsey	9	340
16288	Hanna	hanna	9	340
16289	Jackson	jackson	9	344
16290	Kelly	kelly	9	344
16291	Kemmerer	kemmerer	9	338
16292	Lander	lander	9	339
16293	Laramie	laramie	9	340
16294	Lost Springs	lost-springs	9	339
16295	Lovell	lovell	9	341
16296	Lusk	lusk	9	340
16297	Lyman	lyman	9	338
16298	Meeteetse	meeteetse	9	341
16299	Moran	moran	9	344
16300	Mountain View	mountain-view	9	338
16301	Newcastle	newcastle	9	343
16302	Pavillion	pavillion	9	339
16303	Pine Bluffs	pine-bluffs	9	342
16304	Pinedale	pinedale	9	338
16305	Powell	powell	9	341
16306	Ranchester	ranchester	9	343
16307	Rawlins	rawlins	9	340
16308	Reliance	reliance	9	338
16309	Riverton	riverton	9	339
16310	Rock River	rock-river	9	340
16311	Rock Springs	rock-springs	9	338
16312	Saratoga	saratoga	9	340
16313	Sheridan	sheridan	9	343
16314	Shoshoni	shoshoni	9	339
16315	Smoot	smoot	9	338
16316	Story	story	9	343
16317	Sundance	sundance	9	343
16318	Ten Sleep	ten-sleep	9	339
16319	Teton Village	teton-village	9	344
16320	Thermopolis	thermopolis	9	339
16321	Torrington	torrington	9	342
16322	Upton	upton	9	343
16323	Wapiti	wapiti	9	341
16324	Wheatland	wheatland	9	340
16325	Wilson	wilson	9	344
16326	Worland	worland	9	339
\.


--
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: platehate
--

SELECT pg_catalog.setval('cities_city_id_seq', 1, false);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: platehate
--

COPY countries (country_id, country, stub) FROM stdin;
1	United States	us
\.


--
-- Name: countries_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: platehate
--

SELECT pg_catalog.setval('countries_country_id_seq', 1, true);


--
-- Data for Name: metros; Type: TABLE DATA; Schema: public; Owner: platehate
--

COPY metros (metro_id, metro, stub, region_id) FROM stdin;
1	Anchorage, AK	anchorage	11
2	Fairbanks, AK	fairbanks	11
3	Juneau, AK	juneau	11
4	Dothan, AL	dothan	3
5	Birmingham, AL	birmingham	3
6	Huntsville-Decatur (Florence), AL	huntsville-decatur-florence	3
7	Montgomery (Selma), AL	montgomery-selma	3
8	Mobile, AL-Pensacola (Ft. Walton Beach), FL	mobile	3
9	Columbus, GA	columbus	3
10	Meridian, MS	meridian	3
11	Atlanta, GA	atlanta	3
12	Columbus-Tupelo-West Point, MS	columbus-tupelo-west-point	3
13	Little Rock-Pine Bluff, AR	little-rock-pine-bluff	16
14	Ft. Smith-Fayetteville-Springdale-Rogers, AR	ft-smith-fayetteville-springdale-rogers	16
15	Memphis, TN	memphis	16
16	Jonesboro, AR	jonesboro	16
17	Shreveport, LA	shreveport	16
18	Springfield, MO	springfield	16
19	Monroe, LA-El Dorado, AR	monroe	16
20	Tucson (Sierra Vista), AZ	tucson-sierra-vista	41
21	Phoenix, AZ	phoenix	41
22	Albuquerque-Santa Fe, NM	albuquerque-santa-fe	41
23	Yuma, AZ-El Centro, CA	yuma	41
24	Los Angeles, CA	los-angeles	13
25	San Francisco-Oakland-San Jose, CA	san-francisco-oakland-san-jose	13
26	Sacramento-Stockton-Modesto, CA	sacramento-stockton-modesto	13
27	Fresno-Visalia, CA	fresno-visalia	13
28	San Diego, CA	san-diego	13
29	Chico-Redding, CA	chico-redding	13
30	Monterey-Salinas, CA	monterey-salinas	13
31	Eureka, CA	eureka	13
32	Santa Barbara-Santa Maria-San Luis Obispo, CA	santa-barbara-santa-maria-san-luis-obispo	13
33	Bakersfield, CA	bakersfield	13
34	Yuma, AZ-El Centro, CA	yuma	13
35	Reno, NV	reno	13
36	Palm Springs, CA	palm-springs	13
37	Medford-Klamath Falls, OR	medford-klamath-falls	13
38	Denver, CO	denver	1
39	Albuquerque-Santa Fe, NM	albuquerque-santa-fe	1
40	Colorado Springs-Pueblo, CO	colorado-springs-pueblo	1
41	Grand Junction-Montrose, CO	grand-junction-montrose	1
42	Hartford & New Haven, CT	hartford-new-haven	24
43	New York, NY	new-york	24
44	Washington, DC (Hagerstown, MD)	washington	10
45	Philadelphia, PA	philadelphia	14
46	Salisbury, MD	salisbury	14
47	Gainesville, FL	gainesville	26
48	Orlando-Daytona Beach-Melbourne, FL	orlando-daytona-beach-melbourne	26
49	Panama City, FL	panama-city	26
50	Tampa-St Petersburg (Sarasota), FL	tampa-st-petersburg-sarasota	26
51	Ft. Myers-Naples, FL	ft-myers-naples	26
52	Jacksonville, FL	jacksonville	26
53	West Palm Beach-Ft. Pierce, FL	west-palm-beach-ft-pierce	26
54	Miami-Ft. Lauderdale, FL	miami-ft-lauderdale	26
55	Tallahassee, FL-Thomasville, GA	tallahassee	26
56	Mobile, AL-Pensacola (Ft. Walton Beach), FL	mobile	26
57	Macon, GA	macon	2
58	Atlanta, GA	atlanta	2
59	Albany, GA	albany	2
60	Savannah, GA	savannah	2
61	Columbus, GA	columbus	2
62	Augusta, GA	augusta	2
63	Tallahassee, FL-Thomasville, GA	tallahassee	2
64	Jacksonville, FL	jacksonville	2
65	Dothan, AL	dothan	2
66	Greenville-Spartanburg, SC-Asheville, NC-Anderson, SC	greenville-spartanburg	2
67	Chattanooga, TN	chattanooga	2
68	Honolulu, HI	honolulu	18
69	Des Moines-Ames, IA	des-moines-ames	4
70	Ottumwa, IA-Kirksville, MO	ottumwa	4
71	Cedar Rapids-Waterloo-Iowa City & Dubuque, IA	cedar-rapids-waterloo-iowa-city-dubuque	4
72	Sioux City, IA	sioux-city	4
73	Davenport,IA-Rock Island-Moline,IL	davenport	4
74	Omaha, NE	omaha	4
75	Rochester, MN-Mason City, IA-Austin, MN	rochester	4
76	Quincy, IL-Hannibal, MO-Keokuk, IA	quincy	4
77	Sioux Falls(Mitchell), SD	sioux-falls-mitchell	4
78	Idaho Falls-Pocatello, ID	idaho-falls-pocatello	21
79	Spokane, WA	spokane	21
80	Boise, ID	boise	21
81	Twin Falls, ID	twin-falls	21
82	Salt Lake City, UT	salt-lake-city	21
83	St. Louis, MO	st-louis	5
84	Chicago, IL	chicago	5
85	Evansville, IN	evansville	5
86	Davenport,IA-Rock Island-Moline,IL	davenport	5
87	Champaign & Springfield-Decatur,IL	champaign-springfield-decatur	5
88	Rockford, IL	rockford	5
89	Paducah, KY-Cape Girardeau, MO-Harrisburg-Mount Vernon, IL	paducah	5
90	Terre Haute, IN	terre-haute	5
91	Peoria-Bloomington, IL	peoria-bloomington	5
92	Quincy, IL-Hannibal, MO-Keokuk, IA	quincy	5
93	South Bend-Elkhart, IN	south-bend-elkhart	8
94	Indianapolis, IN	indianapolis	8
95	Ft. Wayne, IN	ft-wayne	8
96	Cincinnati, OH	cincinnati	8
97	Louisville, KY	louisville	8
98	Lafayette, IN	lafayette	8
99	Terre Haute, IN	terre-haute	8
100	Evansville, IN	evansville	8
101	Chicago, IL	chicago	8
102	Champaign & Springfield-Decatur,IL	champaign-springfield-decatur	8
103	Wichita-Hutchinson, KS	wichita-hutchinson	49
104	Topeka, KS	topeka	49
105	Joplin, MO-Pittsburg, KS	joplin	49
106	Kansas City, MO	kansas-city	49
107	Lincoln & Hastings-Kearney, NE	lincoln-hastings-kearney	49
108	Tulsa, OK	tulsa	49
109	St. Joseph, MO	st-joseph	49
110	Knoxville, TN	knoxville	20
111	Nashville, TN	nashville	20
112	Cincinnati, OH	cincinnati	20
113	Paducah, KY-Cape Girardeau, MO-Harrisburg-Mount Vernon, IL	paducah	20
114	Lexington, KY	lexington	20
115	Charleston-Huntington, WV	charleston-huntington	20
116	Louisville, KY	louisville	20
117	Evansville, IN	evansville	20
118	Bowling Green, KY	bowling-green	20
119	Tri-Cities, TN-VA	tri-cities	20
120	Lafayette, LA	lafayette	43
121	Baton Rouge, LA	baton-rouge	43
122	Alexandria, LA	alexandria	43
123	New Orleans, LA	new-orleans	43
124	Shreveport, LA	shreveport	43
125	Monroe, LA-El Dorado, AR	monroe	43
126	Lake Charles, LA	lake-charles	43
127	Boston, MA-Manchester, NH	boston	29
128	Providence, RI-New Bedford, MA	providence	29
129	Springfield-Holyoke, MA	springfield-holyoke	29
130	Albany-Schenectady-Troy, NY	albany-schenectady-troy	29
131	Baltimore, MD	baltimore	35
132	Washington, DC (Hagerstown, MD)	washington	35
133	Salisbury, MD	salisbury	35
134	Pittsburgh, PA	pittsburgh	35
135	Portland-Auburn, ME	portland-auburn	40
136	Bangor, ME	bangor	40
137	Presque Isle, ME	presque-isle	40
138	Toledo, OH	toledo	34
139	Traverse City-Cadillac, MI	traverse-city-cadillac	34
140	Grand Rapids-Kalamazoo-Battle Creek, MI	grand-rapids-kalamazoo-battle-creek	34
141	Flint-Saginaw-Bay City, MI	flint-saginaw-bay-city	34
142	Detroit, MI	detroit	34
143	Alpena, MI	alpena	34
144	Marquette, MI	marquette	34
145	South Bend-Elkhart, IN	south-bend-elkhart	34
146	Lansing, MI	lansing	34
147	Green Bay-Appleton, WI	green-bay-appleton	34
148	Duluth, MN-Superior, WI	duluth	34
149	Fargo-Valley City, ND	fargo-valley-city	48
150	Rochester, MN-Mason City, IA-Austin, MN	rochester	48
151	Sioux Falls(Mitchell), SD	sioux-falls-mitchell	48
152	Minneapolis-St. Paul, MN	minneapolis-st-paul	48
153	La Crosse-Eau Claire, WI	la-crosse-eau-claire	48
154	Duluth, MN-Superior, WI	duluth	48
155	Mankato, MN	mankato	48
156	Kansas City, MO	kansas-city	17
157	Paducah, KY-Cape Girardeau, MO-Harrisburg-Mount Vernon, IL	paducah	17
158	St. Joseph, MO	st-joseph	17
159	Springfield, MO	springfield	17
160	Joplin, MO-Pittsburg, KS	joplin	17
161	St. Louis, MO	st-louis	17
162	Columbia-Jefferson City, MO	columbia-jefferson-city	17
163	Ottumwa, IA-Kirksville, MO	ottumwa	17
164	Quincy, IL-Hannibal, MO-Keokuk, IA	quincy	17
165	Omaha, NE	omaha	17
166	Columbus-Tupelo-West Point, MS	columbus-tupelo-west-point	31
167	Memphis, TN	memphis	31
168	New Orleans, LA	new-orleans	31
169	Hattiesburg-Laurel, MS	hattiesburg-laurel	31
170	Jackson, MS	jackson	31
171	Greenwood-Greenville, MS	greenwood-greenville	31
172	Biloxi-Gulfport, MS	biloxi-gulfport	31
173	Baton Rouge, LA	baton-rouge	31
174	Meridian, MS	meridian	31
175	Mobile, AL-Pensacola (Ft. Walton Beach), FL	mobile	31
176	Billings, MT	billings	38
177	Butte-Bozeman, MT	butte-bozeman	38
178	Missoula, MT	missoula	38
179	Helena, MT	helena	38
180	Minot-Bismarck-Dickinson(Williston), ND	minot-bismarck-dickinson-williston	38
181	Great Falls, MT	great-falls	38
182	Rapid City, SD	rapid-city	38
183	Spokane, WA	spokane	38
184	Glendive, MT	glendive	38
185	Raleigh-Durham (Fayetteville), NC	raleigh-durham-fayetteville	6
186	Greensboro-High Point-Winston Salem, NC	greensboro-high-point-winston-salem	6
187	Norfolk-Portsmouth-Newport News,VA	norfolk-portsmouth-newport-news	6
188	Charlotte, NC	charlotte	6
189	Greenville-New Bern-Washington, NC	greenville-new-bern-washington	6
190	Chattanooga, TN	chattanooga	6
191	Greenville-Spartanburg, SC-Asheville, NC-Anderson, SC	greenville-spartanburg	6
192	Wilmington, NC	wilmington	6
193	Atlanta, GA	atlanta	6
194	Florence-Myrtle Beach, SC	florence-myrtle-beach	6
195	Fargo-Valley City, ND	fargo-valley-city	44
196	Minot-Bismarck-Dickinson(Williston), ND	minot-bismarck-dickinson-williston	44
197	Lincoln & Hastings-Kearney, NE	lincoln-hastings-kearney	46
198	Sioux City, IA	sioux-city	46
199	Denver, CO	denver	46
200	Omaha, NE	omaha	46
201	Cheyenne, WY-Scottsbluff, NE	cheyenne	46
202	North Platte, NE	north-platte	46
203	Sioux Falls(Mitchell), SD	sioux-falls-mitchell	46
204	Boston, MA-Manchester, NH	boston	15
205	Burlington, VT-Plattsburgh, NY	burlington	15
206	Portland-Auburn, ME	portland-auburn	15
207	Philadelphia, PA	philadelphia	50
208	New York, NY	new-york	50
209	Albuquerque-Santa Fe, NM	albuquerque-santa-fe	25
210	El Paso, TX	el-paso	25
211	Amarillo, TX	amarillo	25
212	Las Vegas, NV	las-vegas	30
213	Salt Lake City, UT	salt-lake-city	30
214	Reno, NV	reno	30
215	Los Angeles, CA	los-angeles	30
216	New York, NY	new-york	51
217	Elmira, NY	elmira	51
218	Albany-Schenectady-Troy, NY	albany-schenectady-troy	51
219	Binghamton, NY	binghamton	51
220	Buffalo, NY	buffalo	51
221	Watertown, NY	watertown	51
222	Syracuse, NY	syracuse	51
223	Rochester, NY	rochester	51
224	Utica, NY	utica	51
225	Burlington, VT-Plattsburgh, NY	burlington	51
226	Columbus, OH	columbus	7
227	Cleveland-Akron (Canton), OH	cleveland-akron-canton	7
228	Cincinnati, OH	cincinnati	7
229	Dayton, OH	dayton	7
230	Toledo, OH	toledo	7
231	Wheeling, WV-Steubenville, OH	wheeling	7
232	Youngstown, OH	youngstown	7
233	Parkersburg, WV	parkersburg	7
234	Lima, OH	lima	7
235	Charleston-Huntington, WV	charleston-huntington	7
236	Ft. Wayne, IN	ft-wayne	7
237	Zanesville, OH	zanesville	7
238	Sherman, TX-Ada, OK	sherman	32
239	Tulsa, OK	tulsa	32
240	Joplin, MO-Pittsburg, KS	joplin	32
241	Oklahoma City, OK	oklahoma-city	32
242	Wichita Falls, TX & Lawton, OK	wichita-falls	32
243	Amarillo, TX	amarillo	32
244	Ft. Smith-Fayetteville-Springdale-Rogers, AR	ft-smith-fayetteville-springdale-rogers	32
245	Shreveport, LA	shreveport	32
246	Yakima-Pasco-Richland-Kennewick, WA	yakima-pasco-richland-kennewick	47
247	Boise, ID	boise	47
248	Medford-Klamath Falls, OR	medford-klamath-falls	47
249	Portland, OR	portland	47
250	Eugene, OR	eugene	47
251	Bend, OR	bend	47
252	Spokane, WA	spokane	47
253	Johnstown-Altoona, PA	johnstown-altoona	45
254	Philadelphia, PA	philadelphia	45
255	Pittsburgh, PA	pittsburgh	45
256	Harrisburg-Lancaster-Lebanon-York, PA	harrisburg-lancaster-lebanon-york	45
257	Erie, PA	erie	45
258	Wilkes Barre-Scranton, PA	wilkes-barre-scranton	45
259	Buffalo, NY	buffalo	45
260	Elmira, NY	elmira	45
261	Youngstown, OH	youngstown	45
262	New York, NY	new-york	45
263	Washington, DC (Hagerstown, MD)	washington	45
264	Providence, RI-New Bedford, MA	providence	42
265	Greenville-Spartanburg, SC-Asheville, NC-Anderson, SC	greenville-spartanburg	39
266	Augusta, GA	augusta	39
267	Charleston, SC	charleston	39
268	Columbia, SC	columbia	39
269	Savannah, GA	savannah	39
270	Florence-Myrtle Beach, SC	florence-myrtle-beach	39
271	Charlotte, NC	charlotte	39
272	Sioux Falls(Mitchell), SD	sioux-falls-mitchell	33
273	Sioux City, IA	sioux-city	33
274	Rapid City, SD	rapid-city	33
275	Minot-Bismarck-Dickinson(Williston), ND	minot-bismarck-dickinson-williston	33
276	Memphis, TN	memphis	37
277	Knoxville, TN	knoxville	37
278	Nashville, TN	nashville	37
279	Chattanooga, TN	chattanooga	37
280	Jackson, TN	jackson	37
281	Tri-Cities, TN-VA	tri-cities	37
282	Paducah, KY-Cape Girardeau, MO-Harrisburg-Mount Vernon, IL	paducah	37
283	Huntsville-Decatur (Florence), AL	huntsville-decatur-florence	37
284	Lubbock, TX	lubbock	12
285	Abilene-Sweetwater, TX	abilene-sweetwater	12
286	Dallas-Ft. Worth, TX	dallas-ft-worth	12
287	Harlingen-Weslaco-Brownsville-McAllen, TX	harlingen-weslaco-brownsville-mcallen	12
288	Tyler-Longview(Lufkin & Nacogdoches), TX	tyler-longview-lufkin-nacogdoches	12
289	Corpus Christi, TX	corpus-christi	12
290	Odessa-Midland, TX	odessa-midland	12
291	Houston, TX	houston	12
292	Amarillo, TX	amarillo	12
293	El Paso, TX	el-paso	12
294	Wichita Falls, TX & Lawton, OK	wichita-falls	12
295	San Antonio, TX	san-antonio	12
296	Shreveport, LA	shreveport	12
297	Austin, TX	austin	12
298	Waco-Temple-Bryan, TX	waco-temple-bryan	12
299	Beaumont-Port Arthur, TX	beaumont-port-arthur	12
300	Sherman, TX-Ada, OK	sherman	12
301	Victoria, TX	victoria	12
302	San Angelo, TX	san-angelo	12
303	Laredo, TX	laredo	12
304	Salt Lake City, UT	salt-lake-city	23
305	Tri-Cities, TN-VA	tri-cities	28
306	Norfolk-Portsmouth-Newport News,VA	norfolk-portsmouth-newport-news	28
307	Roanoke-Lynchburg, VA	roanoke-lynchburg	28
308	Richmond-Petersburg, VA	richmond-petersburg	28
309	Washington, DC (Hagerstown, MD)	washington	28
310	Bluefield-Beckley-Oak Hill, WV	bluefield-beckley-oak-hill	28
311	Raleigh-Durham (Fayetteville), NC	raleigh-durham-fayetteville	28
312	Harrisonburg, VA	harrisonburg	28
313	Charlottesville, VA	charlottesville	28
314	Greensboro-High Point-Winston Salem, NC	greensboro-high-point-winston-salem	28
315	Albany-Schenectady-Troy, NY	albany-schenectady-troy	36
316	Burlington, VT-Plattsburgh, NY	burlington	36
317	Boston, MA-Manchester, NH	boston	36
318	Seattle-Tacoma, WA	seattle-tacoma	27
319	Spokane, WA	spokane	27
320	Portland, OR	portland	27
321	Yakima-Pasco-Richland-Kennewick, WA	yakima-pasco-richland-kennewick	27
322	Wausau-Rhinelander, WI	wausau-rhinelander	22
323	Green Bay-Appleton, WI	green-bay-appleton	22
324	Madison, WI	madison	22
325	Milwaukee, WI	milwaukee	22
326	La Crosse-Eau Claire, WI	la-crosse-eau-claire	22
327	Minneapolis-St. Paul, MN	minneapolis-st-paul	22
328	Duluth, MN-Superior, WI	duluth	22
329	Bluefield-Beckley-Oak Hill, WV	bluefield-beckley-oak-hill	19
330	Charleston-Huntington, WV	charleston-huntington	19
331	Washington, DC (Hagerstown, MD)	washington	19
332	Clarksburg-Weston, WV	clarksburg-weston	19
333	Pittsburgh, PA	pittsburgh	19
334	Wheeling, WV-Steubenville, OH	wheeling	19
335	Harrisonburg, VA	harrisonburg	19
336	Roanoke-Lynchburg, VA	roanoke-lynchburg	19
337	Parkersburg, WV	parkersburg	19
338	Salt Lake City, UT	salt-lake-city	9
339	Casper-Riverton, WY	casper-riverton	9
340	Denver, CO	denver	9
341	Billings, MT	billings	9
342	Cheyenne, WY-Scottsbluff, NE	cheyenne	9
343	Rapid City, SD	rapid-city	9
344	Idaho Falls-Pocatello, ID	idaho-falls-pocatello	9
\.


--
-- Name: metros_metro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: platehate
--

SELECT pg_catalog.setval('metros_metro_id_seq', 1, false);


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: platehate
--

COPY regions (region_id, region, stub, country_id, abbr) FROM stdin;
1	Colorado	colorado	1	co
2	Georgia	georgia	1	ga
3	Alabama	alabama	1	al
4	Iowa	iowa	1	ia
5	Illinois	illinois	1	il
6	North Carolina	north-carolina	1	nc
7	Ohio	ohio	1	oh
8	Indiana	indiana	1	in
9	Wyoming	wyoming	1	wy
10	District of Columbia	district-of-columbia	1	dc
11	Alaska	alaska	1	ak
12	Texas	texas	1	tx
13	California	california	1	ca
14	Delaware	delaware	1	de
15	New Hampshire	new-hampshire	1	nh
16	Arkansas	arkansas	1	ar
17	Missouri	missouri	1	mo
18	Hawaii	hawaii	1	hi
19	West Virginia	west-virginia	1	wv
20	Kentucky	kentucky	1	ky
21	Idaho	idaho	1	id
22	Wisconsin	wisconsin	1	wi
23	Utah	utah	1	ut
24	Connecticut	connecticut	1	ct
25	New Mexico	new-mexico	1	nm
26	Florida	florida	1	fl
27	Washington	washington	1	wa
28	Virginia	virginia	1	va
29	Massachusetts	massachusetts	1	ma
30	Nevada	nevada	1	nv
31	Mississippi	mississippi	1	ms
32	Oklahoma	oklahoma	1	ok
33	South Dakota	south-dakota	1	sd
34	Michigan	michigan	1	mi
35	Maryland	maryland	1	md
36	Vermont	vermont	1	vt
37	Tennessee	tennessee	1	tn
38	Montana	montana	1	mt
39	South Carolina	south-carolina	1	sc
40	Maine	maine	1	me
41	Arizona	arizona	1	az
42	Rhode Island	rhode-island	1	ri
43	Louisiana	louisiana	1	la
44	North Dakota	north-dakota	1	nd
45	Pennsylvania	pennsylvania	1	pa
46	Nebraska	nebraska	1	ne
47	Oregon	oregon	1	or
48	Minnesota	minnesota	1	mn
49	Kansas	kansas	1	ks
50	New Jersey	new-jersey	1	nj
51	New York	new-york	1	ny
\.


--
-- Name: regions_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: platehate
--

SELECT pg_catalog.setval('regions_region_id_seq', 1, true);


--
-- Name: city_id_pk; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace:
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT city_id_pk PRIMARY KEY (city_id);


--
-- Name: country_id_pk; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace:
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT country_id_pk PRIMARY KEY (country_id);


--
-- Name: country_uq; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace:
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT country_uq UNIQUE (country);


--
-- Name: login_uq; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace:
--

ALTER TABLE ONLY users
    ADD CONSTRAINT login_uq UNIQUE (login);


--
-- Name: metro_id_pk; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace:
--

ALTER TABLE ONLY metros
    ADD CONSTRAINT metro_id_pk PRIMARY KEY (metro_id);


--
-- Name: plate_body_uq; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace:
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT plate_body_uq UNIQUE (plate_id, body);


--
-- Name: plate_id_pk; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace:
--

ALTER TABLE ONLY plates
    ADD CONSTRAINT plate_id_pk PRIMARY KEY (plate_id);


--
-- Name: plate_region_uq; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace:
--

ALTER TABLE ONLY plates
    ADD CONSTRAINT plate_region_uq UNIQUE (plate, region_id);


--
-- Name: region_id_pk; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace:
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT region_id_pk PRIMARY KEY (region_id);


--
-- Name: review_id_pk; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace:
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT review_id_pk PRIMARY KEY (review_id);


--
-- Name: stub_uq; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace:
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT stub_uq UNIQUE (stub);


--
-- Name: user_id_pk; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace:
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_id_pk PRIMARY KEY (user_id);


--
-- Name: user_plate_uq; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace:
--

ALTER TABLE ONLY users_plates
    ADD CONSTRAINT user_plate_uq UNIQUE (user_id, plate_id);


--
-- Name: city_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT city_id_fk FOREIGN KEY (city_id) REFERENCES cities(city_id) MATCH FULL;


--
-- Name: country_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT country_id_fk FOREIGN KEY (country_id) REFERENCES countries(country_id) MATCH FULL;


--
-- Name: metro_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT metro_id_fk FOREIGN KEY (metro_id) REFERENCES metros(metro_id) MATCH FULL;


--
-- Name: plate_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT plate_id_fk FOREIGN KEY (plate_id) REFERENCES plates(plate_id) MATCH FULL;

-- Name: plate_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users(user_id) MATCH FULL;

--
-- Name: plate_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY users_plates
    ADD CONSTRAINT plate_id_fk FOREIGN KEY (plate_id) REFERENCES plates(plate_id) MATCH FULL;


--
-- Name: region_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY plates
    ADD CONSTRAINT region_id_fk FOREIGN KEY (region_id) REFERENCES regions(region_id) MATCH FULL;


--
-- Name: region_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT region_id_fk FOREIGN KEY (region_id) REFERENCES regions(region_id) MATCH FULL;


--
-- Name: region_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY metros
    ADD CONSTRAINT region_id_fk FOREIGN KEY (region_id) REFERENCES regions(region_id) MATCH FULL;


--
-- Name: user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY users_plates
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users(user_id) MATCH FULL;


--
-- Name: user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users(user_id) MATCH FULL;


--
-- Name: user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT review_id_fk FOREIGN KEY (review_id) REFERENCES reviews(review_id) MATCH FULL;


--
-- Name: review_id_pk; Type: CONSTRAINT; Schema: public; Owner: platehate; Tablespace:
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT message_id_pk PRIMARY KEY (message_id);

--
-- Name: plate_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT plate_id_fk FOREIGN KEY (plate_id) REFERENCES plates(plate_id) MATCH FULL;

-- Name: plate_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: platehate
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users(user_id) MATCH FULL;

--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
