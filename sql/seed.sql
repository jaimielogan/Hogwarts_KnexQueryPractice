-- start fresh
DROP TABLE IF EXISTS parents;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS professors;
DROP TABLE IF EXISTS houses;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS parents_students;
DROP TABLE IF EXISTS enrollments;

-- create all the tables
CREATE TABLE parents (
    id serial PRIMARY KEY,
    name text
);
CREATE TABLE subjects (
    id serial PRIMARY KEY,
    name text
);

CREATE TABLE professors (
    id serial PRIMARY KEY,
    name text
);

CREATE TABLE classes (
    id serial PRIMARY KEY,
    name text,
    subject_id integer references subjects(id),
    professor_id integer references professors(id)
);

CREATE TABLE houses (
    id serial PRIMARY KEY,
    name text,
    description text,
    location text,
    mascot text,
    colours text,
    house_head_id integer references professors(id)
);

CREATE TABLE students (
    id serial PRIMARY KEY,
    name text,
    house_id integer references houses(id),
    year integer,
    patronus text
);

CREATE TABLE parents_students (
    parent_id integer references parents(id),
    student_id integer references students(id)
);

CREATE TABLE enrollments (
    class_id integer references classes(id),
    student_id integer references students(id)
);

INSERT INTO parents (name) VALUES
    ('Alice Longbottom'),
    ('Narcissa Malfoy'),
    ('Lily Potter'),
    ('Molly Weasley'),
    ('Vincent Crabbe, Sr.'),
    ('Amos Diggory'),
    ('Goyle Sr'),
    ('Frank Longbottom'),
    ('Xenophilius Lovegood'),
    ('Lucius Malfoy'),
    ('James Potter'),
    ('Arthur Weasley');

INSERT INTO subjects (name) VALUES
    ('Alchemy'),
    ('Ancient Runes'),
    ('Apparition'),
    ('Arithmancy'),
    ('Art'),
    ('Astronomy'),
    ('Care of Magical Creatures'),
    ('Charms'),
    ('Defence Against the Dark Arts'),
    ('Divination'),
    ('Flying'),
    ('Herbology'),
    ('History of Magic'),
    ('Magical Theory'),
    ('Muggle Studies'),
    ('Music'),
    ('Potions'),
    ('Transfiguration'),
    ('Xylomancy');

INSERT INTO professors (name) VALUES
    ('Bathsheda Babbling'),
    ('Cuthbert Binns'),
    ('Charity Burbage'),
    ('Filius Flitwick'),
    ('Wilhelmina Grubbly-Plank'),
    ('Minerva McGonagall'),
    ('Severus Snape'),
    ('Pomona Sprout'),
    ('Sybill Trelawney'),
    ('Septima Vector'),
    ('Libatius Borage'),
    ('Leonardo da Vinci'),
    ('Aurora Sinistra'),
    ('Wilkie Twycross'),
    ('Katarina Cremin'),
    ('Madam Hooch'),
    ('Alastor Moody'),
    ('Adalbert Waffling');


INSERT INTO classes (name, subject_id, professor_id) VALUES
    ('Alchemy Basics', (SELECT id FROM subjects WHERE name = 'Alchemy'), (SELECT id FROM professors WHERE name = 'Libatius Borage')),
    ('Introduction to Ancient Runes', (SELECT id FROM subjects WHERE name = 'Ancient Runes'), (SELECT id FROM professors WHERE name = 'Bathesda Babbling')),
    ('Advanced Ancient Runes', (SELECT id FROM subjects WHERE name = 'Ancient Runes'), (SELECT id FROM professors WHERE name = 'Bathesda Babbling')),
    ('Apparition', (SELECT id FROM subjects WHERE name = 'Apparition'), (SELECT id FROM professors WHERE name = 'Wilkie Twycross')),
    ('Introduction to Arithmancy', (SELECT id FROM subjects WHERE name = 'Arithmancy'), (SELECT id FROM professors WHERE name = 'Septima Vector')),
    ('Advanced Numerology', (SELECT id FROM subjects WHERE name = 'Arithmancy'), (SELECT id FROM professors WHERE name = 'Septima Vector')),
    ('Advanced Arithmancy', (SELECT id FROM subjects WHERE name = 'Arithmancy'), (SELECT id FROM professors WHERE name = 'Septima Vector')),
    ('Wizard Art', (SELECT id FROM subjects WHERE name = 'Art'), (SELECT id FROM professors WHERE name = 'Leonardo da Vinci')),
    ('Muggle Art', (SELECT id FROM subjects WHERE name = 'Art'), (SELECT id FROM professors WHERE name = 'Leonardo da Vinci')),
    ('Astronomy 1', (SELECT id FROM subjects WHERE name = 'Astronomy'), (SELECT id FROM professors WHERE name = 'Aurora Sinistra')),
    ('Astronomy 2', (SELECT id FROM subjects WHERE name = 'Astronomy'), (SELECT id FROM professors WHERE name = 'Aurora Sinistra')),
    ('Astronomy 3', (SELECT id FROM subjects WHERE name = 'Astronomy'), (SELECT id FROM professors WHERE name = 'Aurora Sinistra')),
    ('Introduction to Care of Magical Creatures', (SELECT id FROM subjects WHERE name = 'Care of Magical Creatures'), (SELECT id FROM professors WHERE name = 'Wilhelmina Grubbly-Plank')),
    ('Creatures of the Deep', (SELECT id FROM subjects WHERE name = 'Care of Magical Creatures'), (SELECT id FROM professors WHERE name = 'Wilhelmina Grubbly-Plank')),
    ('Creatures of the Sky', (SELECT id FROM subjects WHERE name = 'Care of Magical Creatures'), (SELECT id FROM professors WHERE name = 'Wilhelmina Grubbly-Plank')),
    ('Creatures of the Earth', (SELECT id FROM subjects WHERE name = 'Care of Magical Creatures'), (SELECT id FROM professors WHERE name = 'Wilhelmina Grubbly-Plank')),
    ('Caring for Dangerous Creatures', (SELECT id FROM subjects WHERE name = 'Care of Magical Creatures'), (SELECT id FROM professors WHERE name = 'Wilhelmina Grubbly-Plank')),
    ('Introduction to Charms', (SELECT id FROM subjects WHERE name = 'Charms'), (SELECT id FROM professors WHERE name = 'Filius Flitwick')),
    ('Charms of Engagement', (SELECT id FROM subjects WHERE name = 'Charms'), (SELECT id FROM professors WHERE name = 'Filius Flitwick')),
    ('Charms for Self-Improvement', (SELECT id FROM subjects WHERE name = 'Charms'), (SELECT id FROM professors WHERE name = 'Filius Flitwick')),
    ('Make Your Life Easier With Charms', (SELECT id FROM subjects WHERE name = 'Charms'), (SELECT id FROM professors WHERE name = 'Filius Flitwick')),
    ('Charms for Health', (SELECT id FROM subjects WHERE name = 'Charms'), (SELECT id FROM professors WHERE name = 'Filius Flitwick')),
    ('Transformations and Non-Verbal Spells', (SELECT id FROM subjects WHERE name = 'Charms'), (SELECT id FROM professors WHERE name = 'Filius Flitwick')),
    ('Advanced Charms', (SELECT id FROM subjects WHERE name = 'Charms'), (SELECT id FROM professors WHERE name = 'Filius Flitwick')),
    ('Introduction to Defence Against the Dark Arts', (SELECT id FROM subjects WHERE name = 'Defence Against the Dark Arts'), (SELECT id FROM professors WHERE name = 'Filius Flitwick')),
    ('Defence Against the Dark Arts 2', (SELECT id FROM subjects WHERE name = 'Defence Against the Dark Arts'), (SELECT id FROM professors WHERE name = 'Alastor Moody')),
    ('Defence Against the Dark Arts 3', (SELECT id FROM subjects WHERE name = 'Defence Against the Dark Arts'), (SELECT id FROM professors WHERE name = 'Alastor Moody')),
    ('Defence Against the Dark Arts 4', (SELECT id FROM subjects WHERE name = 'Defence Against the Dark Arts'), (SELECT id FROM professors WHERE name = 'Alastor Moody')),
    ('Defence Against the Dark Arts 5', (SELECT id FROM subjects WHERE name = 'Defence Against the Dark Arts'), (SELECT id FROM professors WHERE name = 'Alastor Moody')),
    ('Defence Against the Dark Arts 6', (SELECT id FROM subjects WHERE name = 'Defence Against the Dark Arts'), (SELECT id FROM professors WHERE name = 'Alastor Moody')),
    ('Auror Certification', (SELECT id FROM subjects WHERE name = 'Defence Against the Dark Arts'), (SELECT id FROM professors WHERE name = 'Alastor Moody')),
    ('Introduction to Divination', (SELECT id FROM subjects WHERE name = 'Divination'), (SELECT id FROM professors WHERE name = 'Sybill Trelawney')),
    ('Divination: Tea Time', (SELECT id FROM subjects WHERE name = 'Divination'), (SELECT id FROM professors WHERE name = 'Sybill Trelawney')),
    ('Divination: Palmistry', (SELECT id FROM subjects WHERE name = 'Divination'), (SELECT id FROM professors WHERE name = 'Sybill Trelawney')),
    ('Divination: Locating Your Third Eye', (SELECT id FROM subjects WHERE name = 'Divination'), (SELECT id FROM professors WHERE name = 'Sybill Trelawney')),
    ('Divination for the Gifted', (SELECT id FROM subjects WHERE name = 'Divination'), (SELECT id FROM professors WHERE name = 'Sybill Trelawney')),
    ('Xylomancy', (SELECT id FROM subjects WHERE name = 'Divination'), (SELECT id FROM professors WHERE name = 'Sybill Trelawney')),
    ('Divination for the Gifted', (SELECT id FROM subjects WHERE name = 'Divination'), (SELECT id FROM professors WHERE name = 'Sybill Trelawney')),
    ('Introduction to Flying', (SELECT id FROM subjects WHERE name = 'Flying'), (SELECT id FROM professors WHERE name = 'Madam Hooch')),
    ('Introduction to Herbology', (SELECT id FROM subjects WHERE name = 'Herbology'), (SELECT id FROM professors WHERE name = 'Pomona Sprout')),
    ('Aqua Herbology', (SELECT id FROM subjects WHERE name = 'Herbology'), (SELECT id FROM professors WHERE name = 'Pomona Sprout')),
    ('Desert and Mountain Herbology', (SELECT id FROM subjects WHERE name = 'Herbology'), (SELECT id FROM professors WHERE name = 'Pomona Sprout')),
    ('Greenhouse Care', (SELECT id FROM subjects WHERE name = 'Herbology'), (SELECT id FROM professors WHERE name = 'Pomona Sprout')),
    ('Everything You Need to Know About Dirt', (SELECT id FROM subjects WHERE name = 'Herbology'), (SELECT id FROM professors WHERE name = 'Pomona Sprout')),
    ('Advanced Herbology', (SELECT id FROM subjects WHERE name = 'Herbology'), (SELECT id FROM professors WHERE name = 'Pomona Sprout')),
    ('Dangerous Herbology', (SELECT id FROM subjects WHERE name = 'Herbology'), (SELECT id FROM professors WHERE name = 'Pomona Sprout')),
    ('Introduction to History of Magic', (SELECT id FROM subjects WHERE name = 'History of Magic'), (SELECT id FROM professors WHERE name = 'Cuthbert Binns')),
    ('The History of the Medieval Assembly of European Wizards & International Warlock Convention of 1289', (SELECT id FROM subjects WHERE name = 'History of Magic'), (SELECT id FROM professors WHERE name = '),Cuthbert Binns')),
    ('History of Witch Hunts', (SELECT id FROM subjects WHERE name = 'History of Magic'), (SELECT id FROM professors WHERE name = 'Cuthbert Binns')),
    ('Goblin Rebellions & Giant Wars', (SELECT id FROM subjects WHERE name = 'History of Magic'), (SELECT id FROM professors WHERE name = 'Cuthbert Binns')),
    ('Giant Wars In-depth', (SELECT id FROM subjects WHERE name = 'History of Magic'), (SELECT id FROM professors WHERE name = 'Cuthbert Binns')),
    ('History of Magic: Advanced Independent Study', (SELECT id FROM subjects WHERE name = 'History of Magic'), (SELECT id FROM professors WHERE name = 'Cuthbert Binns')),
    ('Introduction to Magical Theory', (SELECT id FROM subjects WHERE name = 'History of Magic'), (SELECT id FROM professors WHERE name = 'Adalbert Waffling')),
    ('Advanced Magical Theory', (SELECT id FROM subjects WHERE name = 'History of Magic'), (SELECT id FROM professors WHERE name = 'Adalbert Waffling')),
    ('Muggle Studies for Non-Muggleborns', (SELECT id FROM subjects WHERE name = 'Muggle Studies'), (SELECT id FROM professors WHERE name = 'Charity Burbage')),
    ('Cannot Believe It Is Not Magic: Wifi and Other Muggle Tech', (SELECT id FROM subjects WHERE name = 'Muggle Studies'), (SELECT id FROM professors WHERE name = 'Charity Burbage')),
    ('Muggle Perspectives and Blending Into the Muggle World', (SELECT id FROM subjects WHERE name = 'Muggle Studies'), (SELECT id FROM professors WHERE name = 'Charity Burbage')),
    ('Frog Choir', (SELECT id FROM subjects WHERE name = 'Music'), (SELECT id FROM professors WHERE name = 'Filius Flitwick')),
    ('Orchestra', (SELECT id FROM subjects WHERE name = 'Music'), (SELECT id FROM professors WHERE name = 'Septima Vector')),
    ('Introduction to Potions', (SELECT id FROM subjects WHERE name = 'Potions'), (SELECT id FROM professors WHERE name = 'Severus Snape')),
    ('Environmental Potions', (SELECT id FROM subjects WHERE name = 'Potions'), (SELECT id FROM professors WHERE name = 'Severus Snape')),
    ('Antidotes', (SELECT id FROM subjects WHERE name = 'Potions'), (SELECT id FROM professors WHERE name = 'Severus Snape')),
    ('Safe Poison Brewing', (SELECT id FROM subjects WHERE name = 'Potions'), (SELECT id FROM professors WHERE name = 'Severus Snape')),
    ('Performance-Enhancing Potions', (SELECT id FROM subjects WHERE name = 'Potions'), (SELECT id FROM professors WHERE name = 'Severus Snape')),
    ('Potions: How to Pick the Best Ingredients', (SELECT id FROM subjects WHERE name = 'Potions'), (SELECT id FROM professors WHERE name = 'Severus Snape')),
    ('Advanced Potions', (SELECT id FROM subjects WHERE name = 'Potions'), (SELECT id FROM professors WHERE name = 'Severus Snape')),
    ('Introduction to Transfiguration', (SELECT id FROM subjects WHERE name = 'Transfiguration'), (SELECT id FROM professors WHERE name = 'Minerva McGonagall')),
    ('Simple Element Transfiguration', (SELECT id FROM subjects WHERE name = 'Transfiguration'), (SELECT id FROM professors WHERE name = 'Minerva McGonagall')),
    ('Intermediate Element Transfiguration', (SELECT id FROM subjects WHERE name = 'Transfiguration'), (SELECT id FROM professors WHERE name = 'Minerva McGonagall')),
    ('Complex Element Transfiguration', (SELECT id FROM subjects WHERE name = 'Transfiguration'), (SELECT id FROM professors WHERE name = 'Minerva McGonagall')),
    ('Animal-based Transfiguration', (SELECT id FROM subjects WHERE name = 'Transfiguration'), (SELECT id FROM professors WHERE name = 'Minerva McGonagall')),
    ('Conjuring-based Transfiguration', (SELECT id FROM subjects WHERE name = 'Transfiguration'), (SELECT id FROM professors WHERE name = 'Minerva McGonagall')),
    ('Advanced Transfiguration: Independent Study', (SELECT id FROM subjects WHERE name = 'Transfiguration'), (SELECT id FROM professors WHERE name = 'Minerva McGonagall'));

INSERT INTO houses (name, description, location, mascot, colours, house_head_id) VALUES
    ('Hufflepuff', 'Hufflepuff is the most inclusive among the four houses; valuing hard work, dedication, patience, loyalty, and fair play rather than a particular aptitude in its members.', 'accessed through a pile of large barrels, found stacked in a shadowy stone recess on a right-hand side corridor near the kitchens', 'badger', 'yellow and black', (SELECT id FROM professors WHERE name = 'Pomona Sprout')),
    ('Ravenclaw', 'Ravenclaw house members are characterised by their wit, learning, and wisdom.', 'Ravenclaw Tower', 'eagle', 'blue and bronze', (SELECT id FROM professors WHERE name = 'Filius Flitwick')),
    ('Slytherin', 'Slytherin is traditionally home to students who exhibit such traits as cunning, resourcefulness, and ambition.', 'dungeous under the Black lake', 'snake', 'green and silver', (SELECT id FROM professors WHERE name = 'Severus Snape')),
    ('Gryffindor', 'Gryffindor members are characterized by courage, chivalry, and determination.', 'Gryffindor Tower', 'lion', 'red and gold', (SELECT id FROM professors WHERE name = 'Minerva McGonagall'));

INSERT INTO students (name, house_id, year, patronus) VALUES
('Maverick Durgan', (SELECT id FROM houses WHERE name = 'Gryffindor'), 7, 'martingale'),
('Laura Gerhold', (SELECT id FROM houses WHERE name = 'Gryffindor'), 7, 'penguin'),
('Lorenzo Hayes', (SELECT id FROM houses WHERE name = 'Gryffindor'), 7, 'jaguar'),
('Orland Stamm', (SELECT id FROM houses WHERE name = 'Gryffindor'), 7, 'sun fish'),
('Okey Jacobs', (SELECT id FROM houses WHERE name = 'Gryffindor'), 7, 'giant squid'),
('Johanna Haag', (SELECT id FROM houses WHERE name = 'Gryffindor'), 7, 'seahorse'),
('Dallas Wintheiser', (SELECT id FROM houses WHERE name = 'Gryffindor'), 7, 'dachshund'),
('Clovis Jones', (SELECT id FROM houses WHERE name = 'Gryffindor'), 7, 'clown fish'),
('Dejah Wisozk', (SELECT id FROM houses WHERE name = 'Gryffindor'), 7, 'west highland terrier'),
('Sienna Stoltenberg', (SELECT id FROM houses WHERE name = 'Gryffindor'), 7, 'seal'),
('Katrina Kemmer', (SELECT id FROM houses WHERE name = 'Gryffindor'), 7, 'lemur'),
('Oliver Wood', (SELECT id FROM houses WHERE name = 'Gryffindor'), 6, 'ox'),
('Angelina Johnson', (SELECT id FROM houses WHERE name = 'Gryffindor'), 6, 'horse'),
('Letha Moore Miss', (SELECT id FROM houses WHERE name = 'Gryffindor'), 6, 'alpaca'),
('Leonora Lebsack', (SELECT id FROM houses WHERE name = 'Gryffindor'), 6, 'bison'),
('Tyrese Runolfsdottir', (SELECT id FROM houses WHERE name = 'Gryffindor'), 6, 'coati'),
('Hubert Fadel', (SELECT id FROM houses WHERE name = 'Gryffindor'), 6, 'rooster'),
('Antwan Yundt', (SELECT id FROM houses WHERE name = 'Gryffindor'), 6, 'deer'),
('Damon Predovic', (SELECT id FROM houses WHERE name = 'Gryffindor'), 6, 'rat'),
('Meghan Halvorson', (SELECT id FROM houses WHERE name = 'Gryffindor'), 6, 'lizard'),
('Ahmed Breitenberg', (SELECT id FROM houses WHERE name = 'Gryffindor'), 6, 'oryx'),
('Tom Zieme', (SELECT id FROM houses WHERE name = 'Gryffindor'), 6, 'pig'),
('Katie Bell', (SELECT id FROM houses WHERE name = 'Gryffindor'), 5, 'thorny devil'),
('Fred Weasley', (SELECT id FROM houses WHERE name = 'Gryffindor'), 5, 'porpoise'),
('George Weasley', (SELECT id FROM houses WHERE name = 'Gryffindor'), 5, 'bighorn'),
('Florida Weissnat', (SELECT id FROM houses WHERE name = 'Gryffindor'), 5, 'stallion'),
('Lisette Kuhic', (SELECT id FROM houses WHERE name = 'Gryffindor'), 5, 'aardvark'),
('Green MacGyver', (SELECT id FROM houses WHERE name = 'Gryffindor'), 5, 'reindeer'),
('Brooklyn Schmitt', (SELECT id FROM houses WHERE name = 'Gryffindor'), 5, 'mole'),
('Carlie Gutkowski', (SELECT id FROM houses WHERE name = 'Gryffindor'), 5, 'leopard'),
('Darion Bergstrom', (SELECT id FROM houses WHERE name = 'Gryffindor'), 5, 'eagle owl'),
('Mariana Jakubowski', (SELECT id FROM houses WHERE name = 'Gryffindor'), 5, 'hartebeest'),
('Harold Anderson', (SELECT id FROM houses WHERE name = 'Gryffindor'), 5, 'bull'),
('Lavender Brown', (SELECT id FROM houses WHERE name = 'Gryffindor'), 4, 'aoudad'),
('Seamus Finnigan', (SELECT id FROM houses WHERE name = 'Gryffindor'), 4, 'mare'),
('Dean Thomas', (SELECT id FROM houses WHERE name = 'Gryffindor'), 4, 'weasel'),
('Fay Dunbar', (SELECT id FROM houses WHERE name = 'Gryffindor'), 4, 'basilisk'),
('Hermione Granger', (SELECT id FROM houses WHERE name = 'Gryffindor'), 4, 'ermine'),
('Ron Weasley', (SELECT id FROM houses WHERE name = 'Gryffindor'), 4, 'hare'),
('Lee Jordan', (SELECT id FROM houses WHERE name = 'Gryffindor'), 4, 'gorilla'),
('Neville Longbottom', (SELECT id FROM houses WHERE name = 'Gryffindor'), 4, 'fawn'),
('Parvati Patil', (SELECT id FROM houses WHERE name = 'Gryffindor'), 4, 'ram'),
('Harry Potter', (SELECT id FROM houses WHERE name = 'Gryffindor'), 4, 'stag'),
('Dean Thomas', (SELECT id FROM houses WHERE name = 'Gryffindor'), 4, 'rhinoceros'),
('Penelope Ziemann', (SELECT id FROM houses WHERE name = 'Gryffindor'), 3, 'moose'),
('Meaghan Mayert', (SELECT id FROM houses WHERE name = 'Gryffindor'), 3, 'canary'),
('Audie Donnelly', (SELECT id FROM houses WHERE name = 'Gryffindor'), 3, 'crocodile'),
('Raven Bernhard', (SELECT id FROM houses WHERE name = 'Gryffindor'), 3, 'musk-ox'),
('Leopoldo Olson', (SELECT id FROM houses WHERE name = 'Gryffindor'), 3, 'sloth'),
('Kelley Cruickshank', (SELECT id FROM houses WHERE name = 'Gryffindor'), 3, 'armadillo'),
('Celia Keefe', (SELECT id FROM houses WHERE name = 'Gryffindor'), 3, 'vicuna'),
('Quincy Wuckert', (SELECT id FROM houses WHERE name = 'Gryffindor'), 3, 'addax'),
('Leola Pfeffer', (SELECT id FROM houses WHERE name = 'Gryffindor'), 3, 'panda'),
('Elvie Konopelski', (SELECT id FROM houses WHERE name = 'Gryffindor'), 3, 'giraffe'),
('Ginny Weasley', (SELECT id FROM houses WHERE name = 'Gryffindor'), 3, 'finch'),
('Colin Creevey', (SELECT id FROM houses WHERE name = 'Gryffindor'), 3, 'cat'),
('Kareem Corkery', (SELECT id FROM houses WHERE name = 'Gryffindor'), 2, 'waterbuck'),
('Consuelo Collier', (SELECT id FROM houses WHERE name = 'Gryffindor'), 2, 'civet'),
('Edwin Pfeffer', (SELECT id FROM houses WHERE name = 'Gryffindor'), 2, 'marten'),
('Keyshawn Jakubowski', (SELECT id FROM houses WHERE name = 'Gryffindor'), 2, 'shrew'),
('Hellen Wehner', (SELECT id FROM houses WHERE name = 'Gryffindor'), 2, 'ground hog'),
('Chelsey Considine', (SELECT id FROM houses WHERE name = 'Gryffindor'), 2, 'coyote'),
('Zechariah Glover', (SELECT id FROM houses WHERE name = 'Gryffindor'), 2, 'sheep'),
('Mac McDermott', (SELECT id FROM houses WHERE name = 'Gryffindor'), 2, 'gnu'),
('Jada Fay', (SELECT id FROM houses WHERE name = 'Gryffindor'), 2, 'kitten'),
('Marisa Schamberger', (SELECT id FROM houses WHERE name = 'Gryffindor'), 2, 'badger'),
('Dennis Creevey', (SELECT id FROM houses WHERE name = 'Gryffindor'), 1, 'hippopotamus'),
('Era Herzog', (SELECT id FROM houses WHERE name = 'Gryffindor'), 1, 'chameleon'),
('Marjory Wehner', (SELECT id FROM houses WHERE name = 'Gryffindor'), 1, 'ewe'),
('Grayson Breitenberg', (SELECT id FROM houses WHERE name = 'Gryffindor'), 1, 'chicken'),
('Greyson Herman', (SELECT id FROM houses WHERE name = 'Gryffindor'), 1, 'lovebird'),
('Barton Glover', (SELECT id FROM houses WHERE name = 'Gryffindor'), 1, 'guinea pig'),
('Dina Jerde', (SELECT id FROM houses WHERE name = 'Gryffindor'), 1, 'mongoose'),
('Gaston Hills', (SELECT id FROM houses WHERE name = 'Gryffindor'), 1, 'parrot'),
('Evan Weimann', (SELECT id FROM houses WHERE name = 'Gryffindor'), 1, 'meerkat'),
('Amparo Hane', (SELECT id FROM houses WHERE name = 'Gryffindor'), 1, 'opossum'),
('Gina Lind', (SELECT id FROM houses WHERE name = 'Gryffindor'), 1, 'polar bear'),
('Queenie Altenwerth', (SELECT id FROM houses WHERE name = 'Gryffindor'), 1, 'antelope'),
('Pauline Kemmer Miss', (SELECT id FROM houses WHERE name = 'Slytherin'), 7, 'wolverine'),
('Aaliyah VonRueden', (SELECT id FROM houses WHERE name = 'Slytherin'), 7, 'llama'),
('Addison Stamm', (SELECT id FROM houses WHERE name = 'Slytherin'), 7, 'whale'),
('Norbert Konopelski', (SELECT id FROM houses WHERE name = 'Slytherin'), 7, 'bald eagle'),
('Roel Watsica', (SELECT id FROM houses WHERE name = 'Slytherin'), 7, 'dog'),
('Hudson Lueilwitz', (SELECT id FROM houses WHERE name = 'Slytherin'), 7, 'eland'),
('Desmond Simonis', (SELECT id FROM houses WHERE name = 'Slytherin'), 7, 'doe'),
('Icie Waelchi', (SELECT id FROM houses WHERE name = 'Slytherin'), 7, 'quagga'),
('Arch Jacobs', (SELECT id FROM houses WHERE name = 'Slytherin'), 7, 'tiger'),
('Lauryn Larkin', (SELECT id FROM houses WHERE name = 'Slytherin'), 7, 'ape'),
('Bryce Maggi', (SELECT id FROM houses WHERE name = 'Slytherin'), 7, 'newt'),
('Heather Parisian', (SELECT id FROM houses WHERE name = 'Slytherin'), 6, 'mule'),
('Brando Huels', (SELECT id FROM houses WHERE name = 'Slytherin'), 6, 'skunk'),
('Ethan Hudson', (SELECT id FROM houses WHERE name = 'Slytherin'), 6, 'turtle'),
('Karina Walker', (SELECT id FROM houses WHERE name = 'Slytherin'), 6, 'alligator'),
('Joe Ondricka', (SELECT id FROM houses WHERE name = 'Slytherin'), 6, 'blue crab'),
('Minerva Harris', (SELECT id FROM houses WHERE name = 'Slytherin'), 6, 'starfish'),
('Wilmer Hyatt', (SELECT id FROM houses WHERE name = 'Slytherin'), 6, 'hedgehog'),
('Tillman Paucek', (SELECT id FROM houses WHERE name = 'Slytherin'), 6, 'yak'),
('Myrna Emard', (SELECT id FROM houses WHERE name = 'Slytherin'), 6, 'mynah bird'),
('Lavina Kling', (SELECT id FROM houses WHERE name = 'Slytherin'), 6, 'wildcat'),
('Tiffany Durgan', (SELECT id FROM houses WHERE name = 'Slytherin'), 6, 'budgerigar'),
('Caterina Trantow', (SELECT id FROM houses WHERE name = 'Slytherin'), 5, 'warthog'),
('Maynard Miller', (SELECT id FROM houses WHERE name = 'Slytherin'), 5, 'chimpanzee'),
('Elmer Thompson', (SELECT id FROM houses WHERE name = 'Slytherin'), 5, 'cow'),
('Adan Eichmann', (SELECT id FROM houses WHERE name = 'Slytherin'), 5, 'salamander'),
('Clair Kunde', (SELECT id FROM houses WHERE name = 'Slytherin'), 5, 'gazelle'),
('Euna Howell', (SELECT id FROM houses WHERE name = 'Slytherin'), 5, 'okapi'),
('Roberta Renner', (SELECT id FROM houses WHERE name = 'Slytherin'), 5, 'impala'),
('Lorine Schiller', (SELECT id FROM houses WHERE name = 'Slytherin'), 5, 'dormouse'),
('Ansel Moore', (SELECT id FROM houses WHERE name = 'Slytherin'), 5, 'beaver'),
('Dedric Abbott', (SELECT id FROM houses WHERE name = 'Slytherin'), 5, 'porcupine'),
('Noemi Schumm', (SELECT id FROM houses WHERE name = 'Slytherin'), 5, 'elephant'),
('Conor Mann', (SELECT id FROM houses WHERE name = 'Slytherin'), 4, 'squirrel'),
('Cary Wyman Dr.', (SELECT id FROM houses WHERE name = 'Slytherin'), 4, 'gila monster'),
('Rickie Feest', (SELECT id FROM houses WHERE name = 'Slytherin'), 4, 'lynx'),
('Janet Roob', (SELECT id FROM houses WHERE name = 'Slytherin'), 4, 'tapir'),
('Nikki Schroeder', (SELECT id FROM houses WHERE name = 'Slytherin'), 4, 'fox'),
('Amir Reilly', (SELECT id FROM houses WHERE name = 'Slytherin'), 4, 'pronghorn'),
('Draco Malfoy', (SELECT id FROM houses WHERE name = 'Slytherin'), 4, 'frog'),
('Vincent Crabbe', (SELECT id FROM houses WHERE name = 'Slytherin'), 4, 'baboon'),
('Gregory Goyle', (SELECT id FROM houses WHERE name = 'Slytherin'), 4, 'gopher'),
('Pansy Parkinson', (SELECT id FROM houses WHERE name = 'Slytherin'), 4, 'hyena'),
('Nikki Schroeder', (SELECT id FROM houses WHERE name = 'Slytherin'), 4, 'crow'),
('Amica Reilly', (SELECT id FROM houses WHERE name = 'Slytherin'), 4, 'walrus'),
('Adelle Bartoletti', (SELECT id FROM houses WHERE name = 'Slytherin'), 3, 'dingo'),
('Albin Conn', (SELECT id FROM houses WHERE name = 'Slytherin'), 3, 'dromedary'),
('Shanel Gottlieb', (SELECT id FROM houses WHERE name = 'Slytherin'), 3, 'dung beetle'),
('Grayce Cruickshank', (SELECT id FROM houses WHERE name = 'Slytherin'), 3, 'silver fox'),
('Mateo Toy', (SELECT id FROM houses WHERE name = 'Slytherin'), 3, 'hog'),
('Alivia Thiel', (SELECT id FROM houses WHERE name = 'Slytherin'), 3, 'jerboa'),
('Dana Zulauf', (SELECT id FROM houses WHERE name = 'Slytherin'), 3, 'puma'),
('Gilberto Reinger', (SELECT id FROM houses WHERE name = 'Slytherin'), 3, 'orangutan'),
('Lydia Jerde', (SELECT id FROM houses WHERE name = 'Slytherin'), 3, 'jackal'),
('Charity Lockman', (SELECT id FROM houses WHERE name = 'Slytherin'), 3, 'lemur'),
('Louvenia Swift', (SELECT id FROM houses WHERE name = 'Slytherin'), 3, 'mustang'),
('Liliane Farrell', (SELECT id FROM houses WHERE name = 'Slytherin'), 2, 'grizzly bear'),
('Ursula Kutch', (SELECT id FROM houses WHERE name = 'Slytherin'), 2, 'colt'),
('Shawn Stiedemann', (SELECT id FROM houses WHERE name = 'Slytherin'), 2, 'burro'),
('Korey Blick', (SELECT id FROM houses WHERE name = 'Slytherin'), 2, 'peccary'),
('Bernhard Greenfelder', (SELECT id FROM houses WHERE name = 'Slytherin'), 2, 'toad'),
('Tanner Ferry', (SELECT id FROM houses WHERE name = 'Slytherin'), 2, 'boar'),
('Lionel Kuhn', (SELECT id FROM houses WHERE name = 'Slytherin'), 2, 'steer'),
('Evalyn Herzog', (SELECT id FROM houses WHERE name = 'Slytherin'), 2, 'wombat'),
('Cleve Block', (SELECT id FROM houses WHERE name = 'Slytherin'), 2, 'ocelot'),
('Estel Balistreri', (SELECT id FROM houses WHERE name = 'Slytherin'), 2, 'bumble bee'),
('Delpha Roob', (SELECT id FROM houses WHERE name = 'Slytherin'), 2, 'zebra'),
('Major Huels', (SELECT id FROM houses WHERE name = 'Slytherin'), 1, 'elk'),
('Virginie Streich', (SELECT id FROM houses WHERE name = 'Slytherin'), 1, 'parakeet'),
('Bobbie Swift', (SELECT id FROM houses WHERE name = 'Slytherin'), 1, 'iguana'),
('Abbey Fritsch', (SELECT id FROM houses WHERE name = 'Slytherin'), 1, 'chinchilla'),
('Matteo Fisher', (SELECT id FROM houses WHERE name = 'Slytherin'), 1, 'buffalo'),
('Ransom Tillman', (SELECT id FROM houses WHERE name = 'Slytherin'), 1, 'musk deer'),
('Alexandrine Kreiger', (SELECT id FROM houses WHERE name = 'Slytherin'), 1, 'camel'),
('Casimir Boyle', (SELECT id FROM houses WHERE name = 'Slytherin'), 1, 'bat'),
('Melisa Von', (SELECT id FROM houses WHERE name = 'Slytherin'), 1, 'capybara'),
('Cristian Haley', (SELECT id FROM houses WHERE name = 'Slytherin'), 1, 'panther'),
('Deondre Satterfield', (SELECT id FROM houses WHERE name = 'Slytherin'), 1, 'mandrill'),
('Orie Rosenbaum', (SELECT id FROM houses WHERE name = 'HufflePuff'), 7, 'mouse'),
('Rodger Eichmann', (SELECT id FROM houses WHERE name = 'HufflePuff'), 7, 'raccoon'),
('Ezra Dibbert', (SELECT id FROM houses WHERE name = 'HufflePuff'), 7, 'mountain goat'),
('Rick Green', (SELECT id FROM houses WHERE name = 'HufflePuff'), 7, 'snake'),
('Myah Dickens', (SELECT id FROM houses WHERE name = 'HufflePuff'), 7, 'duckbill platypus'),
('Halie Yundt', (SELECT id FROM houses WHERE name = 'HufflePuff'), 7, 'jaguar'),
('Nelda Conroy', (SELECT id FROM houses WHERE name = 'HufflePuff'), 7, 'woodchuck'),
('Waino Satterfield', (SELECT id FROM houses WHERE name = 'HufflePuff'), 7, 'monkey'),
('Amina Keeling', (SELECT id FROM houses WHERE name = 'HufflePuff'), 7, 'wolf'),
('Zoey White', (SELECT id FROM houses WHERE name = 'HufflePuff'), 7, 'snowy owl'),
('Sincere Cummerata', (SELECT id FROM houses WHERE name = 'HufflePuff'), 7, 'lion'),
('Stacy VonRueden', (SELECT id FROM houses WHERE name = 'HufflePuff'), 6, 'donkey'),
('Cedric Diggory', (SELECT id FROM houses WHERE name = 'HufflePuff'), 6, 'kangaroo'),
('Edison Keeling', (SELECT id FROM houses WHERE name = 'HufflePuff'), 6, 'goat'),
('Noemi Emmerich', (SELECT id FROM houses WHERE name = 'HufflePuff'), 6, 'hamster'),
('Dorothea Ruecker', (SELECT id FROM houses WHERE name = 'HufflePuff'), 6, 'ibex'),
('Abdul Kemmer', (SELECT id FROM houses WHERE name = 'HufflePuff'), 6, 'prairie dog'),
('Geovany Becker', (SELECT id FROM houses WHERE name = 'HufflePuff'), 6, 'seal'),
('Rebeka White', (SELECT id FROM houses WHERE name = 'HufflePuff'), 6, 'muskrat'),
('Devin McGlynn', (SELECT id FROM houses WHERE name = 'HufflePuff'), 6, 'bunny'),
('Ahmed Jakubowski', (SELECT id FROM houses WHERE name = 'HufflePuff'), 6, 'marmoset'),
('Davion Ward', (SELECT id FROM houses WHERE name = 'HufflePuff'), 6, 'chamois'),
('Raina Marks', (SELECT id FROM houses WHERE name = 'HufflePuff'), 5, 'fox'),
('Sigurd Crooks', (SELECT id FROM houses WHERE name = 'HufflePuff'), 5, 'cheetah'),
('Joshuah Klock', (SELECT id FROM houses WHERE name = 'HufflePuff'), 5, 'koala'),
('Ryann Gutkowski', (SELECT id FROM houses WHERE name = 'HufflePuff'), 5, 'gemsbok'),
('Darren Dietrich', (SELECT id FROM houses WHERE name = 'HufflePuff'), 5, 'otter'),
('Montana Jaskolski', (SELECT id FROM houses WHERE name = 'HufflePuff'), 5, 'pony'),
('Elbert Auer', (SELECT id FROM houses WHERE name = 'HufflePuff'), 5, 'bear'),
('Cassie Harvey', (SELECT id FROM houses WHERE name = 'HufflePuff'), 5, 'springbok'),
('Erin Stark', (SELECT id FROM houses WHERE name = 'HufflePuff'), 5, 'chipmunk'),
('Ludwig Prosacc', (SELECT id FROM houses WHERE name = 'HufflePuff'), 5, 'cougar'),
('Luna Lovegood', (SELECT id FROM houses WHERE name = 'HufflePuff'), 5, 'fish'),
('Gaetano Kirlin', (SELECT id FROM houses WHERE name = 'HufflePuff'), 4, 'puppy'),
('Ford Parisian', (SELECT id FROM houses WHERE name = 'HufflePuff'), 4, 'lamb'),
('Elvera Labadie', (SELECT id FROM houses WHERE name = 'HufflePuff'), 4, 'anteater'),
('Sister Thompson', (SELECT id FROM houses WHERE name = 'HufflePuff'), 4, 'argali'),
('Adam Murazik', (SELECT id FROM houses WHERE name = 'HufflePuff'), 4, 'ferret'),
('Jeremie Sanford', (SELECT id FROM houses WHERE name = 'HufflePuff'), 4, 'rabbit'),
('Jerome Kertzmann', (SELECT id FROM houses WHERE name = 'HufflePuff'), 4, 'zebu'),
('Chesley Bednar', (SELECT id FROM houses WHERE name = 'HufflePuff'), 4, 'dugong'),
('Nicholas Rutherford', (SELECT id FROM houses WHERE name = 'HufflePuff'), 4, 'octopus'),
('Emiliano Osinski', (SELECT id FROM houses WHERE name = 'HufflePuff'), 4, 'ox'),
('Joanny Tillman', (SELECT id FROM houses WHERE name = 'HufflePuff'), 4, 'horse'),
('Frankie Herman', (SELECT id FROM houses WHERE name = 'HufflePuff'), 3, 'alpaca'),
('Laverna Prosacc', (SELECT id FROM houses WHERE name = 'HufflePuff'), 3, 'bison'),
('Markus Maggio', (SELECT id FROM houses WHERE name = 'HufflePuff'), 3, 'coati'),
('Austyn Schulist', (SELECT id FROM houses WHERE name = 'HufflePuff'), 3, 'rooster'),
('Marjory Reynolds', (SELECT id FROM houses WHERE name = 'HufflePuff'), 3, 'deer'),
('Romaine Block', (SELECT id FROM houses WHERE name = 'HufflePuff'), 3, 'rat'),
('Jammie Parker', (SELECT id FROM houses WHERE name = 'HufflePuff'), 3, 'lizard'),
('Emerson Heaney', (SELECT id FROM houses WHERE name = 'HufflePuff'), 3, 'oryx'),
('Tavares Okuneva', (SELECT id FROM houses WHERE name = 'HufflePuff'), 3, 'pig'),
('Lilla Dach', (SELECT id FROM houses WHERE name = 'HufflePuff'), 3, 'thorny devil'),
('Vernie Kuhic', (SELECT id FROM houses WHERE name = 'HufflePuff'), 3, 'porpoise'),
('Ollie Dare', (SELECT id FROM houses WHERE name = 'HufflePuff'), 2, 'bighorn'),
('Kailee Lind', (SELECT id FROM houses WHERE name = 'HufflePuff'), 2, 'stallion'),
('Michale Homenick', (SELECT id FROM houses WHERE name = 'HufflePuff'), 2, 'aardvark'),
('Carmine Price', (SELECT id FROM houses WHERE name = 'HufflePuff'), 2, 'reindeer'),
('Elmo Nienow', (SELECT id FROM houses WHERE name = 'HufflePuff'), 2, 'mole'),
('Katrine Pfeffer', (SELECT id FROM houses WHERE name = 'HufflePuff'), 2, 'leopard'),
('Chanelle Cartwright', (SELECT id FROM houses WHERE name = 'HufflePuff'), 2, 'eagle owl'),
('Summer Abshire', (SELECT id FROM houses WHERE name = 'HufflePuff'), 2, 'hartebeest'),
('Candido Dare', (SELECT id FROM houses WHERE name = 'HufflePuff'), 2, 'bull'),
('Ephraim Hickle', (SELECT id FROM houses WHERE name = 'HufflePuff'), 2, 'aoudad'),
('Ali Heller', (SELECT id FROM houses WHERE name = 'HufflePuff'), 2, 'mare'),
('Stanley Cummerata', (SELECT id FROM houses WHERE name = 'HufflePuff'), 1, 'weasel'),
('Rory Wuckert', (SELECT id FROM houses WHERE name = 'HufflePuff'), 1, 'basilisk'),
('Herta Rowe', (SELECT id FROM houses WHERE name = 'HufflePuff'), 1, 'ermine'),
('Kadin Lemke', (SELECT id FROM houses WHERE name = 'HufflePuff'), 1, 'hare'),
('Zita DuBuque', (SELECT id FROM houses WHERE name = 'HufflePuff'), 1, 'gorilla'),
('Barbara Stanton', (SELECT id FROM houses WHERE name = 'HufflePuff'), 1, 'fawn'),
('Deven Williamson', (SELECT id FROM houses WHERE name = 'HufflePuff'), 1, 'ram'),
('Adonis Pouros', (SELECT id FROM houses WHERE name = 'HufflePuff'), 1, 'mink'),
('Mallory Okuneva', (SELECT id FROM houses WHERE name = 'HufflePuff'), 1, 'rhinoceros'),
('Fay Sipes', (SELECT id FROM houses WHERE name = 'HufflePuff'), 1, 'moose'),
('Izabella Feil', (SELECT id FROM houses WHERE name = 'HufflePuff'), 1, 'canary'),
('Gregory DuBuque', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 7, 'crocodile'),
('Mikel Macejkovic', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 7, 'musk-ox'),
('Benny Robel', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 7, 'sloth'),
('Jerod Nitzsche', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 7, 'armadillo'),
('Rhoda Heaney', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 7, 'vicuna'),
('Nigel Carter', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 7, 'addax'),
('Juanita Heathcote', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 7, 'panda'),
('Octavia Gleason', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 7, 'giraffe'),
('Hattie Osinski', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 7, 'finch'),
('Hershel Sporer', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 7, 'cat'),
('Anahi Pagac', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 7, 'waterbuck'),
('Gwendolyn Halvorson', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 6, 'civet'),
('Blaise Waters', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 6, 'marten'),
('Christiana McLaughlin', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 6, 'shrew'),
('Leta Bahringer', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 6, 'ground hog'),
('Rick Padberg', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 6, 'coyote'),
('Immanuel Ankunding', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 6, 'sheep'),
('Liliana Davis', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 6, 'gnu'),
('Abigayle Predovic', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 6, 'kitten'),
('Jarrett Cummings', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 6, 'badger'),
('Perry Prosacc', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 6, 'hippopotamus'),
('Monserrate Larson', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 6, 'chameleon'),
('Alvina Conner', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 5, 'ewe'),
('Aubrey Tremblay', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 5, 'chicken'),
('Jedediah Buckridge', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 5, 'lovebird'),
('Arnulfo Medhurst', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 5, 'guinea pig'),
('Sarah Bednar', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 5, 'mongoose'),
('Valentina Hand', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 5, 'parrot'),
('Maximillia Walker', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 5, 'meerkat'),
('Newell Eichmann', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 5, 'opossum'),
('Dominic Dietrich', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 5, 'polar bear'),
('Melba Marquardt', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 5, 'antelope'),
('Candice Feest', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 5, 'wolverine'),
('Zelma Lebsack', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 4, 'llama'),
('Colten Kozey', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 4, 'whale'),
('Hillary McLaughlin', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 4, 'bald eagle'),
('Theresa Weimann', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 4, 'dog'),
('Simeon Kihn', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 4, 'eland'),
('Rosanna Conner', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 4, 'doe'),
('Deion Hyatt', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 4, 'quagga'),
('Cecilia Hettinger', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 4, 'tiger'),
('Crawford Kozey', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 4, 'ape'),
('Maida Renner', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 4, 'newt'),
('Eliane Wintheiser', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 4, 'mule'),
('Karina Jones', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 3, 'skunk'),
('Broderick Runte', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 3, 'turtle'),
('Owen Schimmel', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 3, 'alligator'),
('Vanessa Raynor', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 3, 'blue crab'),
('Oral Dibbert', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 3, 'starfish'),
('Andreane Lindgren', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 3, 'hedgehog'),
('Orville Shields', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 3, 'yak'),
('Willy Schroeder', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 3, 'mynah bird'),
('Tanya Hirthe', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 3, 'wildcat'),
('Nedra Ankunding', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 3, 'budgerigar'),
('Marietta Lueilwitz', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 3, 'warthog'),
('Loy Hettinger', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 2, 'chimpanzee'),
('Brain Sipes', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 2, 'cow'),
('Blanche Cole', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 2, 'salamander'),
('Freeda Auer', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 2, 'gazelle'),
('Stephanie Kihn', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 2, 'okapi'),
('Horace Keebler', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 2, 'impala'),
('Monserrate Beier', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 2, 'dormouse'),
('Antoinette Lueilwitz', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 2, 'beaver'),
('Annabelle Funk', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 2, 'porcupine'),
('Twila Schroeder', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 2, 'elephant'),
('Jarred Wilderman', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 2, 'squirrel'),
('Winnifred Krajcik', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 1, 'gila monster'),
('Rico Hane', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 1, 'lynx'),
('Bethany Reinger', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 1, 'tapir'),
('Aric Bode', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 1, 'fox'),
('Kasey Witting', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 1, 'pronghorn'),
('Marguerite Watsica', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 1, 'frog'),
('Mariane Watsica', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 1, 'baboon'),
('Crystel Pagac', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 1, 'gopher'),
('Shakira Renner', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 1, 'hyena'),
('Darwin Wehner', (SELECT id FROM houses WHERE name = 'Ravenclaw'), 1, 'crow');

-- CREATE TABLE enrollments (
--     class_id integer references classes(id),
--     student_id integer references students(id)
-- );

INSERT INTO enrollments (class_id, student_id)
    SELECT 1 class_id, students.id student_id
        FROM students
        WHERE students.year > 5 AND students.name LIKE '% RE %';
INSERT INTO enrollments (class_id, student_id)
    SELECT 2 class_id, students.id student_id
        FROM students
        WHERE students.year > 3 AND students.house_id = 2 OR students.house_id = 4 AND students.name LIKE '% E %';
INSERT INTO enrollments (class_id, student_id)
    SELECT 3 class_id, students.id student_id
        FROM students
        WHERE students.year > 5 AND students.house_id = 2 AND students.name LIKE '% E %';
INSERT INTO enrollments (class_id, student_id)
    SELECT 4 class_id, students.id student_id
        FROM students
        WHERE students.year = 6;
INSERT INTO enrollments (class_id, student_id)
    SELECT 5 class_id, students.id student_id
        FROM students
        WHERE students.house_id = 2 AND students.year = 3;
INSERT INTO enrollments (class_id, student_id)
    SELECT 6 class_id, students.id student_id
        FROM students
        WHERE students.year = 4 AND students.house_id = 2;
INSERT INTO enrollments (class_id, student_id)
    SELECT 7 class_id, students.id student_id
        FROM students
        WHERE students.year = 6  AND students.house_id = 2;
INSERT INTO enrollments (class_id, student_id)
    SELECT 8 class_id, students.id student_id
        FROM students
        WHERE students.name LIKE '% W %';
INSERT INTO enrollments (class_id, student_id)
    SELECT 9 class_id, students.id student_id
        FROM students
        WHERE students.name LIKE '% V %';
INSERT INTO enrollments (class_id, student_id)
    SELECT 10 class_id, students.id student_id
        FROM students
        WHERE students.year = 3;
INSERT INTO enrollments (class_id, student_id)
    SELECT 11 class_id, students.id student_id
        FROM students
        WHERE students.year > 3 AND students.name LIKE '% EA %';
INSERT INTO enrollments (class_id, student_id)
    SELECT 12 class_id, students.id student_id
        FROM students
        WHERE students.year > 5 AND students.house_id = 1;
INSERT INTO enrollments (class_id, student_id)
    SELECT 13 class_id, students.id student_id
        FROM students
        WHERE students.year > 3 AND students.house_id = 2 AND students.name LIKE '% AY %';
INSERT INTO enrollments (class_id, student_id)
    SELECT 14 class_id, students.id student_id
        FROM students
        WHERE students.year = 3;
INSERT INTO enrollments (class_id, student_id)
    SELECT 15 class_id, students.id student_id
        FROM students
        WHERE students.year > 3 AND students.name LIKE '% ME %';
INSERT INTO enrollments (class_id, student_id)
    SELECT 16 class_id, students.id student_id
        FROM students
        WHERE students.year > 3 AND students.name LIKE '% PO %';
INSERT INTO enrollments (class_id, student_id)
    SELECT 17 class_id, students.id student_id
        FROM students
        WHERE students.year = 7 AND students.house_id = 1 AND students.name LIKE '% OU %';
INSERT INTO enrollments (class_id, student_id)
    SELECT 18 class_id, students.id student_id
        FROM students
        WHERE students.year > 3 AND students.house_id = 2;
INSERT INTO enrollments (class_id, student_id)
    SELECT 19 class_id, students.id student_id
        FROM students
        WHERE students.year = 1;
INSERT INTO enrollments (class_id, student_id)
    SELECT 20 class_id, students.id student_id
        FROM students
        WHERE students.year > 3 AND students.name LIKE '% ME %';
INSERT INTO enrollments (class_id, student_id)
    SELECT 21 class_id, students.id student_id
        FROM students
        WHERE students.year > 5 AND students.house_id = 1 AND students.house_id = 4;
INSERT INTO enrollments (class_id, student_id)
    SELECT 22 class_id, students.id student_id
        FROM students
        WHERE students.year > 3 AND students.house_id = 3;
INSERT INTO enrollments (class_id, student_id)
    SELECT 23 class_id, students.id student_id
        FROM students
        WHERE students.year > 3 AND students.house_id = 2;
INSERT INTO enrollments (class_id, student_id)
    SELECT 24 class_id, students.id student_id
        FROM students
        WHERE students.year = 7 AND students.house_id = 2;
INSERT INTO enrollments (class_id, student_id)
    SELECT 25 class_id, students.id student_id
        FROM students
        WHERE students.year = 1;
INSERT INTO enrollments (class_id, student_id)
    SELECT 26 class_id, students.id student_id
        FROM students
        WHERE students.year = 2;
INSERT INTO enrollments (class_id, student_id)
    SELECT 27 class_id, students.id student_id
        FROM students
        WHERE students.year = 2;
INSERT INTO enrollments (class_id, student_id)
    SELECT 28 class_id, students.id student_id
        FROM students
        WHERE students.year = 3;
INSERT INTO enrollments (class_id, student_id)
    SELECT 29 class_id, students.id student_id
        FROM students
        WHERE students.year = 4;
INSERT INTO enrollments (class_id, student_id)
    SELECT 30 class_id, students.id student_id
        FROM students
        WHERE students.year = 5;


INSERT INTO parents_students (parent_id, student_id)
    SELECT 1 parent_id, students.id student_id
        FROM students
        WHERE students.name LIKE '%Longbottom%';
INSERT INTO parents_students (parent_id, student_id)
    SELECT 8 parent_id, students.id student_id
        FROM students
        WHERE students.name LIKE '%Longbottom%';
INSERT INTO parents_students (parent_id, student_id)
    SELECT 2 parent_id, students.id student_id
        FROM students
        WHERE students.name LIKE '%Malfoy%';
INSERT INTO parents_students (parent_id, student_id)
    SELECT 10 parent_id, students.id student_id
        FROM students
        WHERE students.name LIKE '%Malfoy%';
INSERT INTO parents_students (parent_id, student_id)
    SELECT 3 parent_id, students.id student_id
        FROM students
        WHERE students.name LIKE '%Potter%';
INSERT INTO parents_students (parent_id, student_id)
    SELECT 11 parent_id, students.id student_id
        FROM students
        WHERE students.name LIKE '%Potter%';
INSERT INTO parents_students (parent_id, student_id)
    SELECT 4 parent_id, students.id student_id
        FROM students
        WHERE students.name LIKE '%Weasley%';
INSERT INTO parents_students (parent_id, student_id)
    SELECT 12 parent_id, students.id student_id
        FROM students
        WHERE students.name LIKE '%Weasley%';
INSERT INTO parents_students (parent_id, student_id)
    SELECT 5 parent_id, students.id student_id
        FROM students
        WHERE students.name LIKE '%Crabbe%';
INSERT INTO parents_students (parent_id, student_id)
    SELECT 6 parent_id, students.id student_id
        FROM students
        WHERE students.name LIKE '%Diggory%';
INSERT INTO parents_students (parent_id, student_id)
    SELECT 7 parent_id, students.id student_id
        FROM students
        WHERE students.name LIKE '%Goyle%';
INSERT INTO parents_students (parent_id, student_id)
    SELECT 9 parent_id, students.id student_id
        FROM students
        WHERE students.name LIKE '%Lovegood%';






