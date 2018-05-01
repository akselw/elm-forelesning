# Elm
---
## Agenda

* Om oss
* Motivasjon
* Syntaks og språkkonsepter
* Liten app 

---

## Oss

* Gikk ut av IFI i 2016
* Tok INF2810 (og digga det)
* Jobber i Bekk

---

## Funksjonell programmering i arbeidslivet

* God kode
* Brukervennlig, testbar, lesbar kode
* Vi bruker kanskje ikke Scheme, men prinsippene er universelle

^ Aksel: Da jeg skulle velge fag på våren andre året så fikk jeg høre at funksjonell programmering var et kult fag, selv om det ikke er så relevant for arbeidslivet. Men det viste seg å ikke stemme i det hele tatt. Funksjonell programmering er nok et av de fagene jeg har hatt mest nytte av etter at jeg begynte å jobbe.

^ Funksjonell programmering har fått mer og mer fotfeste de siste årene, og man ser at prinsippene i funksjonell programmering er anvendelige på mange forskjellige bruksområder.

^ Noen av grunnene til det er at om man skriver funksjonelt så skriver man kode uten sideeffekter, som gjør det lett å resonnere om hva et program gjør ved å se på koden.

^ Funksjonell kode er også lett å teste og lett å lese, og det blir ofte mindre kode.

---

## Ulike FP-språk
* Lisp-familien: Scheme, Clojure
* ML-familien: Haskell, Elm

^ Aksel: Scheme er et språk i Lisp-familien av funksjonelle språk, som ofte kjennetegnes ved at det er dynamisk typet (og har masse parenteser)

^ Elm er en del av ML-familien, som har veldig mange av de samme konseptene, men med et typesystem i tillegg

^ Men i motsetning til typesystemene dere kanskje er kjent med fra Java, så er typesystemene i ML-språk både mye kraftigere, og mye mindre i veien. Det hjelper deg bare å unngå feil.

---

## <Bilde av en nettside>

^ 
Johanne: I Bekk jobber de aller fleste av oss med å utvikle datasystemer, og da er det gjerne en eller annet web- eller mobilløsning med i miksen.
Siden Elm er et programmeringsspråk for nettsider, er det greit å bruke noen minutter på å snakke om hva en nettside består av, for å forstå hvilken verden Elm befinner seg i.

---

## <Logo av HTML>

^
Johanne:   Dette er sikkert kjent for en del av dere, men en nettside består av HTML, som vi bruker til å strukturere tekst. Det er faktisk ikke et programmeringsspråk, men markup.

---

## <Logo av CSS>

^
Johanne: Vi bruker CSS til å style nettsidene våre, altså for å sette opp layouten vi ønsker, få farger, rett og slett gjøre det pent. CSS hadde faktisk sitt opphav i en doktorgrad fra en fyr her på IFI, som også jobbet i CERN. Litt kult å kjenne til :)

---

## <Logo av JavaScript>

^ Og så selve rosinen i pølsa: JavasScript. Vi bruker JavaScript, gjerne i form av ett eller flere rammeverk, til å hente ut data fra fra andre systemer, vise det frem på nettsidene våre, få avansert oppførsel som vi kaller “Single page app”, dvs at vi ikke merker at siden laster selv om vi hopper mellom ulike, og mye annet. Egentlig bruker vi JavaScript til så å si alt som ikke har med tekst og stiler å gjøre.
Og historien til JavaScript er egentlig litt gøyal å kjenne til.

---

### Tegning av fyr med scheme-logo i tankeboble.

^ 
For JavaScript ble laget av en fyr som heter Brendan Eich. Og han ville egentlig lage Scheme i nettleseren.

---

### Tegning av forretningsfolk med java-logo i tankeboble.

^ Men Java var veldig i vinden den gangen, og netscape navigator, nettleseren han skulle lage dette språket for, ville at han skulle ta språket i en mer objektorientert retning.
Og det gjorde han. Ikke minst inngikkk netscape navigator en avtale med sun, som hadde lisensrettighetene til java, om at de fikk lov til å bruke java i navnet til dette nye programmeringsspråket.

---
## Java != JavaScript

^ Men ellers har disse to språkene så å si ingenting å gjøre med hverandre.

---

### JavaScript

* Ikke kompilert
* Dynamisk typet
* Funksjonelt og objektorientert
* Svært fleksibelt

^ JavaScript kompileres ikke, det kjører bare rett i nettleseren. Som scheme, har det ikke statiske typer, det vil si: vi får ikke klager på om vi forsøker å sende inn en int der vi forventer en streng.

---

## Problemer med JavaScript
* Feiler runtime
* Dårlige feilmeldinger
* Kan være vanskelig å velge rammeverk og biblioteker.


^ Johanne

---

## Elm:
* Kompilator!
* Typesikkert/bra typesystem
* Rent funksjonelt
* Bra feilmeldinger


---

## <Logo av ELM>

^ Johanne: Elm er et alternativ til JavaScript. Og per nå kompileres også Elm til JavaScript, for det er det nettleserne har støtte for å kjøre. Men i fremtiden kompilerer det kanskje til noe annet, feks webassembly, som i hvert fall chrome og firefox begynner å  få støtte for, og som er myye raskere.

---
## Logo av react og redux (?)

^ Er det noen av dere som har hørt om javascript-rammeverkene react og redux?
Disse to rammeverkene har egentlig blitt en bransjestandard i dag for å lage nettsider - det er ukontroversielt å velge dem i nye web-prosjekter. Det interessante er at redux er inspirert av måten elm håndterer state på. Og React sine komponenter kan likne til forveksling på Elm sine moduler.
Så elm er bygget på konsepter som har blitt omfavnet av webutviklere, og som har inspirert en del 

---

# Funksjoner & typeinferens

```elm
increment x =
    x + 1

five = increment 4
```

^ Aksel frem til det står noe annet

---

# Typesignaturer

```elm

increment : Int -> Int
increment x =
    x + 1

five : Int
five = increment 4
```

---

# Records og bindinger

```elm
x : Int
x = 42

kunde : { navn : String, alder : Int }
kunde = 
    { navn = "Ingar"
    , alder = 24
    }
```

---

# Type alias

```elm
type alias Kunde =
    { navn: String
    , alder: Int
    }

ingar : Kunde
ingar =
    { navn = "Ingar"
    , alder = 24
    }   
```

#### _**lar oss definere nye typer**_

---

# Type alias

```elm
type alias Koordinater = (Int, Int)

spillerposisjon : Koordinater
spillerposisjon = (0,0)
```

---

# Type alias

```elm
type alias Kunde =
    { navn: String
    , alder: Int,
    , type: String
    }

ingar : Kunde
ingar =
    { navn = "Ingar"
    , alder = 24
    , type = "Student"
    }   
```

---

# Type alias

```elm
type alias Kunde =
    { navn: String
    , alder: Int,
    , type: String
    , studentRabatt: Int
    }

ingar : Kunde
ingar =
    { navn = "Ingar"
    , alder = 24
    , type = "Student",
    , studentRabatt = 50
    }   
```

---

# Type alias

```elm
type alias Kunde =
    { navn: String
    , alder: Int,
    , type: String
    , studentRabatt: Int
    , bedriftsnavn: String
    }

ingar : Kunde
ingar =
    { navn = "Ingar"
    , alder = 24
    , type = “Bedrift”,
    , studentRabatt = 0
    , bedriftsnavn = "BEKK Consulting"
    }   
```

---

# Tre problemer:
_1. Vi får tomme felter med_ dummy-_verdier_
_2. Enkelt å skrive feil i `type`-feltet_
_3. Ikke noe hjelp fra kompilatoren_

---

# Union Types

```elm
type Kunde
    = Student
    | Bedrift
    | Privat
```

#### _**som enums på stereoider**_


^ Johanne frem til det står noe annet

---

# Union Types

```elm
type Kunde
    = Student Int
    | Bedrift String 
    | Privat
```

#### _**som enums på stereoider**_

---

# Union Types

```elm
type alias Rabatt = Int
type alias Bedriftsnavn = String

type Kunde
    = Student Rabatt
    | Bedrift Bedriftsnavn 
    | Privat
```

#### _**som enums på stereoider**_

---

# Pattern Matching

```elm
type Kunde = Student Rabatt | Bedrift Bedriftsnavn | Privat

getRabatt : Kunde -> Rabatt
getRabatt kunde =
    case kunde of
        Student rabatt ->
            rabatt
        Bedrift navn ->
            0
        Private ->
            0
```


#### _**glemt en branch? kompilatoren sier fra!**_

---

# HTML

```html
<div>
    <img src=“/image.png” />
    <h1>Min elm-app!</h1>
</div>
```

---

# HTML

```elm
div []
    [ img [src “/image.png”] []
    , h1 [] [ text “Min elm-app!”]
    ]
```

---

### The Elm Architecture

Bilde

---

# Live-koding


^ Aksel


---

# Vil du prøve selv?

```
$ npm install -g create-elm-app
$ create-elm-app min-forste-app
$ cd min-forste-app
$ elm-app start
```

---

# Andre ressurser

Elm-miljøet har en slack: [elmlang.herokuapp.com](https://elmlang.herokuapp.com)

Elm-workshop: [ewendel.github.io/elm-workshop/](https://ewendel.github.io/elm-workshop/)


^ Elm-miljøet har en slack der alle kan bli med. Alle er veldig vennlige, og de har en policy om at ingen spørsmål er dumme, og alle spørsmål skal få svar. De har til og med en egen beginner-kanal, der det er masse bra hjelp å få.

^ Noen kollegaer av oss i Bekk har også laget en workshop i elm, hvor man lager et lite spill, som de har reist land og strand rundt med. Både i Norge og i utlandet.

---

# Takk for oss





