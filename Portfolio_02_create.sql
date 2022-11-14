-- connect remote:fbe-neptun2.rwu.de/DABS_42 DABS_42 DABS_42
-- connect remote:localhost:10111/DABS_42 DABS_42 DABS_42
-- load script /Downloads/Portfolio_01.sql

set echo true;
set ignoreErrors true;

delete edge E;
delete vertex V;

drop class Gremien;
drop class Lehrbeauftrage;
drop class Mitarbeiter;
drop class Professoren;
drop class Student;
drop class Sonstige_Personen;
drop class Personen;
drop class Namen;
drop class Adresse;
drop class Sitzungen;
drop class Tagesordnung;
drop class Mitglieder;
drop class Dokument;
drop class nimmt_teil;
drop class fuehrt_Protokoll_bei;
drop class top;
drop class hat;

create class Gremien extends V;
create class Personen extends V;
create class Namen;
create class Adresse extends V;
create class Sitzungen extends V;
create class Tagesordnung extends V;
create class Lehrbeauftrage extends Personen;
create class Mitarbeiter extends Personen;
create class Professoren extends Personen;
create class Student extends Personen;
create class Sonstige_Personen extends Personen;
create class Dokument extends V;

create class Mitglieder extends E;
create property Mitglieder.Funktion string;
create class nimmt_teil extends E; /* Person nimmt_teil an Sitzung */
create class fuehrt_Protokoll_bei extends E; /* Person führt Protokoll bei Sitzung */
create class top extends E; /* Sitzung hat ein top*/
create class hat extends E; /* Gremium hat Sitzung */

create property Gremien.Name string;
create property Gremien.Aufgabengebiete embeddedlist string;
create property Gremien.offiziell BOOLEAN;
create property Gremien.inoffiziell BOOLEAN;
create property Gremien.Start date;
create property Germien.Ende date;

create property Sitzungen.Beginn datetime;
create property Sitzungen.Ende datetime;
create property Sitzungen.Einladung_am date;
create property Sitzungen.oeffentlich boolean;
create property Sitzungen.Ort string;
create property Sitzungen.Protokoll string;
create property Sitzungen.Tagesordnung embeddedlist Tagesordnung;

create property Tagesordnung.Titel string;
create property Tagesordnung.Kurzbeschreibung string;
create property Tagesordnung.Protokoltext string;

create property Adresse.Strasse string;
create property Adresse.Hausnummer number;
create property Adresse.PLZ number;
create property Adresse.Ort string;

create property Namen.Vorname string;
create property Namen.Nachname string (mandatory, notnull);

create property Personen.Name embedded Namen (mandatory, notnull);
create property Personen.Geburtsdatum date;
create property Personen.Geschlecht string;
alter property Personen.Geschlecht regexp 'm|w|d';
create property Personen.Adresse embedded Adresse;

create property Student.Studiengang string;
create property Student.Studienbeginn date;
create property Student.MatrikelNr number;

create property Dokument.Author string;
create property Dokument.Mime_Typ embeddedlist string;
create property Dokument.Erstelldatum date;
create property Dokument.Inhalt string;