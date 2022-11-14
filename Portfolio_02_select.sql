select * from Gremien where Mitglieder.Funktion 'Vorsitzender';

select Name, Geschlecht, Adresse
from Personen;

select *
from Sitzungen
left join Gremium
right join Tagesordnung
outer join Student
outer join Professor
outer join Mitarbeiter
where Sitzungen.Beginn = '06-12-2022'