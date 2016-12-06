# gemy

## irc

* cinch - https://github.com/cinchrb/cinch

## cli

* optparse - http://ruby-doc.org/stdlib-2.3.3/libdoc/optparse/rdoc/OptionParser.html
* mixlib-cli - https://github.com/chef/mixlib-cli
* slop - https://github.com/leejarvis/slop
* trollop - https://github.com/manageiq/trollop
* docopt - https://github.com/docopt/docopt.rb

## doc

* rdoc - https://github.com/rdoc/rdoc
* sdoc - https://github.com/zzak/sdoc
* yard - https://github.com/lsegal/yard
* rspec_api_documentation - https://github.com/zipmark/rspec_api_documentation
* apipie-rails - https://github.com/Apipie/apipie-rails

# Domácí úkol

Napsat klienta pro jednoduché API, které se nachází na https://api.mtgjester.com/.

Klient bude mít 2 uživatelská rozhraní:
* IRC bot
* CLI

Klient bude mít dokumentaci, např:
* napsanou zvlášť
* vygenerovanou z komentářů a anotací kódu
* velmi dobré komentáře s příklady
* velmi dobře napsané README nebo podobný dokument

API podporuje 2 endpointy:
* /cards/:uuid
* /cards/search?query=foo

## Detail karty - /cards/:uuid
_:uuid_ je univerzální identifilátor, API používá verzi 4 - https://en.wikipedia.org/wiki/Universally_unique_identifier#Version_4_.28random.29

Plné URL vypadá takto https://api.mtgjester.com/cards/11733148-a081-4652-bf9e-fba8cc4b3ee2

## Hledání karet - /cards/search?query=foo
_query_ je parametr, podle kterého se hledá. Momentálně ho API interpretuje jako regulární výraz a hledá v atributech _name_ a _text_.

Plné URL pro hledání vypadá takto https://api.mtgjester.com/cards/search?query=Air

Prázdné _query_ vrátí všechny záznamy.

## API

* Pokud dostane neplatná data, vrací chybu (není to doladěné, vrací někdy 500)
* API vrací application/json
* všechny hodnoty v jsonu považujte za _string_
* karta obsahuje momentálně pouze 3 položky
 * id
 * name
 * text
* ^ tohle se může změnit :-) (mohou pouze přibýt, nebudu žádné odebírat)


## UI
Uživatelské rozhraní umožní uživateli hledat karty a zobrazit detail konkrétní karty.

## IRC
Použijte kanál #municz-ruby na freenode.net

Konfigurace IRC (server, kanál, nick) může být přímo ve zdrojovém kódu _natvrdo_,
doporučuji ale použít třeba dotenv - https://github.com/bkeepers/dotenv. Každopádně je nutné zdokumentovat, jak se má klient nakonfigurovat.


# Další odkazy
* hwping - https://github.com/skateman/hwping/
* cowsay bot a jiní - https://github.com/petrblaho/varbots/
* ruby cowsay - https://github.com/PatrickTulskie/ruby_cowsay

# Kontakt
* petrblaho@gmail.com
* petrblaho nebo pblaho v #municz-ruby, #manageiq, #openstack, #ruby-fog na freenode
