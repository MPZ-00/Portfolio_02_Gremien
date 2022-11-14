-- connect remote:fbe-neptun2.rwu.de/DABS_42 DABS_42 DABS_42
-- load script Downloads/Portfolio_02_fill.sql

set echo true;
set ignoreErrors true;

script sql;
begin;

let gremium1 = create vertex Gremium set Name = 'Hochschulrat', offiziell = true, inoffiziell = false, Aufgabengebiete = 'HS Angelegenheiten', Start = '2000-01-01', Ende = '2050-12-31';
let gremium2 = create vertex Gremium set Name = 'Fachschaft E', offiziell = true, inoffiziell = false, Aufgabengebiete = 'Hängt ganz davon ab..', Start = '2000-02-01', Ende = '2050-12-31';
let gremium3 = create vertex Gremium set Name = 'Studierendenrat', offiziell = true, inoffiziell = false, Aufgabengebiete = ['Haushaltsplan', 'Mittel für Hochschulsport', 'Unterstützung für besondere Projekte'], Start = '2000-03-01', Ende = '2050-12-31'

let sitzung1 = create vertex Sitzung set Beginn = '2022-12-06 14:00', Ende = '2022-12-06 16:00', Einladung_am = '2022-11-01', oeffentlich = false, Ort = 'Gebäude H (Hauptgebäude)', Protokoll = '';
let sitzung2 = create vertex Sitzung set Beginn = '2022-11-23 19:30', Ende = '2022-11-23 20:00', Einladung_am = '2022-11-01', oeffentlich = true; Ort = 'Gebäude B', Protokoll = '';

let person1 = create vertex Student set Name = {'Vorname': 'Hanna', 'Nachname': 'Moos'}, Adresse = {'Strasse': 'Obere Str.', 'Hausnummer': 57, 'PLZ': 12209, 'Ort': 'Berlin'}, Studiengang = 'AI', Studienbeginn = '2020-09-01', MatrikelNr = 22111;
let person2 = create vertex Student set Name = {'Vorname': 'Hanna', 'Nachname': 'Moos'}, Adresse = {'Strasse': 'Forsterstr.', 'Hausnummer': 57, 'PLZ': 67000, 'Ort': 'Mannheim'}, Studiengang = 'AI', Studienbeginn = '2020-09-01', MatrikelNr = 22112;
let person3 = create vertex Professor set Name = {'Vorname': 'Frédérique', 'Nachname': 'Citeaux'}, Adresse = {'Strasse': 'place Kléber', 'Hausnummer': 24, 'PLZ': 13008, 'Ort': 'Marseille'}, Titel = 'Prof.';
let person4 = create vertex Mitarbeiter set Name = {'Vorname': 'Elizabeth', 'Nachname': 'Lincoln'}, Adresse = {'Strasse': 'rue des Bouchers', 'Hausnummer': 23, 'PLZ': 13008, 'Ort': 'Marseille'};
commit;

let dokument1 = create vertex Dokument set Author = 'Moos', Mime_Typ = 'Excel-Tabelle', Inhalt = 'Deputatsstunden der Professoren', Erstelldatum = '2015-03-05';
let dokument2 = create vertex Dokument set Author = 'Unbekannt', Mime_Typ = 'Text', Inhalt = 'Eiusmod fugiat ipsum adipisicing officia dolore laboris id labore mollit irure sint et.', Erstelldatum = '2022-11-14';
commit;

let tago1 = create vertex Tagesordnung set Titel = 'Wahl des neuen AStA', Kurzbeschreibung = 'Wahlen der Verfasste Studierendenschaft', Protokolltext = '';
let tago2 = create vertex Tagesordnung set Titel = 'StupApfel', Kurzbeschreibung = 'Gratis-Obst für die Studierenden', Protokolltext = '';
let tago3 = create vertex Tagesordnung set Titel = 'Sonstiges', Kurzbeschreibung = '', Protokolltext = '';
let tago4 = create vertex Tagesordnung set Titel = 'Ersti Hüttensitzung', Kurzbeschreibung = 'Ankündigung', Protokolltext = '';
commit;

/* Edges */
let top1 = create edge top from $gremium1 to $sitzung1;
let top2 = create edge top from $gremium2 to $sitzung2;
commit;

let mitglied1 = create edge mitglieder from $person1 to $gremium1 set Funktion = 'Vorsitzender';
let mitglied2 = create edge mitglieder from $person2 to $gremium2 set Funktion = 'Lehrling';
let mitglied3 = create edge mitglieder from $person3 to $gremium2 set Funktion = 'Leiter';
let mitglied4 = create edge mitglieder from $person4 to $gremium1 set Funktion = 'Lehrling';
let mitglied5 = create edge mitglieder from $person3 to $gremium3 set Funktion = 'Vorsitzender';
let mitglied6 = create edge mitglieder from $person4 to $gremium3 set Funktion = '';
commit;

let hat1 = create edge hat from $gremium1 to $sitzung1;
let hat2 = create edge hat from $gremium2 to $sitzung2;
commit;

let fuehrt_Protokoll_bei1 = create edge fuehrt_Protokoll_bei from $person2 to $sitzung1;
let fuehrt_Protokoll_bei2 = create edge fuehrt_Protokoll_bei from $person4 to $sitzung2;
commit;

let top1 = create edge top from $sitzung2 to $tago2;
let top2 = create edge top from $sitzung2 to $tago3;
let top3 = create edge top from $sitzung2 to $tago4;
let top4 = create edge top from $sitzung1 to $tago1;
commit;

let nimmt_teil1 = create edge nimmt_teil from $person1 to $sitzung1;
let nimmt_teil2 = create edge nimmt_teil from $person2 to $sitzung1;
let nimmt_teil3 = create edge nimmt_teil from $person3 to $sitzung2;
let nimmt_teil4 = create edge nimmt_teil from $person4 to $sitzung2;
commit;

let erstellt_von1 = create edge erstellt_von from $person2 to $dokument1;
let erstellt_von2 = create edge erstellt_von from $person2 to $dokument2;
commit;

end;