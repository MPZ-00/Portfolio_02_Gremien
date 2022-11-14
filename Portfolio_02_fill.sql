-- connect remote:fbe-neptun2.rwu.de/DABS_42 DABS_42 DABS_42
-- load script Downloads/Portfolio_02_fill.sql

set echo true;
set ignoreErrors true;

script sql;
begin;

let g1 = create vertex Gremium set Name = 'Hochschulrat', offiziell = true, inoffiziell = false, Aufgabengebiete = 'HS Angelegenheiten', Start = '2000-01-01', Ende = '2050-31-12';
let g2 = create vertex Gremium set Name = 'Fachschaft E', offiziell = true, inoffiziell = false, Aufgabengebiete = 'Hängt ganz davon ab..', Start = '2004-01-01', Ende = '2050-31-12';

let s1 = create vertex Sitzung set Beginn = '06-12-2022 14:00', Ende = '06-12-2022 16:00', Einladung_am = '01-11-2022', oeffentlich = false, Ort = 'Gebäude H (Hauptgebäude)', Protokoll = '';
let s2 = create vertex Sitzung set Beginn = '23-11-2022 19:30', Ende = '23-11-2022 20:00', Einladung_am = '01-11-2022', oeffentlich = true; Ort = 'Gebäude B', Protokoll = '';

let p1 = create vertex Student set Name = {'Vorname': 'Hanna', 'Nachname': 'Moos'}, Adresse = {'Strasse': 'Obere Str.', 'Hausnummer': 57, 'PLZ': 12209, 'Ort': 'Berlin'}, Studiengang = 'AI', Studienbeginn = '01-09-2020', MatrikelNr = 22111;
let p2 = create vertex Student set Name = {'Vorname': 'Hanna', 'Nachname': 'Moos'}, Adresse = {'Strasse': 'Forsterstr.', 'Hausnummer': 57, 'PLZ': 67000, 'Ort': 'Mannheim'}, Studiengang = 'AI', Studienbeginn = '01-09-2020', MatrikelNr = 22112;
let p3 = create vertex Professor set Name = {'Vorname': 'Frédérique', 'Nachname': 'Citeaux'}, Adresse = {'Strasse': 'place Kléber', 'Hausnummer': 24, 'PLZ': 13008, 'Ort': 'Marseille'}, Titel = 'Prof.';
let p4 = create vertex Mitarbeiter set Name = {'Vorname': 'Elizabeth', 'Nachname': 'Lincoln'}, Adresse = {'Strasse': 'rue des Bouchers', 'Hausnummer': 23, 'PLZ': 13008, 'Ort': 'Marseille'};
commit;

let d1 = create vertex Dokument set Author = 'Moos', Mime_Typ = 'Excel-Tabelle', Inhalt = 'Deputatsstunden der Professoren', Erstelldatum = '05-03-2015';
commit;

let top1 = create edge top from $g1 to $s1;
let top2 = create edge top from $g2 to $s2;

let m1 = create edge mitglieder from $p1 to $g1 set Funktion = 'Vorsitzender';
let m2 = create edge mitglieder from $p2 to $g2 set Funktion = 'Lehrling';
let m3 = create edge mitglieder from $p3 to $g2 set Funktion = 'Leiter';
let m4 = create edge mitglieder from $p4 to $g1 set Funktion = 'Lehrling';
commit;

let h1 = create edge hat from $g1 to $s1;
let h2 = create edge hat from $g2 to $s2;
commit;

end;