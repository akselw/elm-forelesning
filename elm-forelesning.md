# Elm
---
## Agenda

* Om oss
* Motivasjon
* Syntaks og språkkonsepter
* Liten app 

^ Har 45 minutter til rådighet, så vi har dessverre ikke tid til å gå veldig i dybden på Elm som språk, men forhåpentligvis får dere smaken på noe av syntaksen og eventuelt motivasjon for å se på det på egenhånd.
---

## Oss

Gikk på IFI, tok INF2810, jobber i bekk

---

## FP i arbeidslivet

God kode
Brukervennlig, testbar, lesbar kode
Scheme: akademisk, men prinsippene er universelle

^ Aksel

---

## Ulike FP-språk
* Lisp og ML: overordnete
* Peke til de ulike språkene som likner.

^ Aksel

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
Det er et utrolig fleksibelt språk, som har ført til en voldsom innovasjon. 

---

![100%](./images/js-tweet.png)

^ 
JavaScript-fatigue
Kan være vanskelig å velge rammeverk og biblioteker.

---

## Tingenes tilstand på frontend

* JS-stacken funker, men er kompleks
* JS har beveget seg i funksjonell retning: React, Redux
* Statisk typing har blitt maintream

---

## Vanlige feil i JS
	
* `Script error.`
* `Cannot read property 'getFullYear' of undefined`
* `Cannot read property 'beskrivelse' of undefined`
* `undefined is not an object (evaluating 't[0].getFullYear')`
* `Kan ikke hente egenskapen beskrivelse når den er udefinert eller har nullreferanse`
* `Kan ikke hente egenskapen getFullYear når den er udefinert eller har nullreferanse`
* `undefined is not an object (evaluating 't.beskrivelse')`
* `Kan ikke hente egenskapen id når den er udefinert eller har nullreferanse`

^
Andre ting som folk irriterer seg grønne over med javascript, er:
* Feiler runtime
* Dårlige feilmeldinger

---
## Elm = React + Redux + Immutable.js ++++

---
## <Logo av ELM>

^ Johanne: Elm er et alternativ til JavaScript. Og per nå kompileres også Elm til JavaScript, for det er det nettleserne har støtte for å kjøre. Men i fremtiden kompilerer det kanskje til noe annet, feks webassembly, som i hvert fall chrome og firefox begynner å  få støtte for, og som er myye raskere.

---

## Elm
* Statisk typet funksjonelt språk
* Kompilerer til JavaScript
* Laget for å lage webapps
* Tydelig, gjennomgående filosofi
    * Lett å lære, enkelt å bruke
* Fokuserer på brukervennlighet
* Gode kompilatorfeilmeldinger
* Offisielt anbefalte biblioteker for det man trenger
* Lover "ingen kjøretidsfeil"

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
    { navn = "Erik"
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

erik : Kunde
erik = 
    { navn = "Erik"
    , alder = 24
    }   
```

#### _**lar oss definere nye typer**_

---

# Type alias

```elm
type alias Coords = (Int, Int)
playerPosition : Coords
playerPosition = (0,0)
```

---

# Type alias

```elm
type alias Kunde =
    { navn: String
    , alder: Int,
    , type: String
    }

erik : Kunde
erik = 
    { navn = "Erik"
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

erik : Kunde
erik = 
    { navn = "Erik"
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

erik : Kunde
erik = 
    { navn = "Erik"
    , alder = 24
    , type = “Bedrift”,
    , studentRabatt = 0
    , bedriftsnavn = "BEKK Consulting"
    }   
```

---

# Tre problemer:
_1. Vi får tomme felter med dummy variabler_
_2. Enkelt å skrive feil i `type`-felter_
_3. Ikke noe hjelp fra kompilatoren_

---

# Union Types

```elm
type KundeKlasse
    = Student
    | Bedrift
    | Privat
```

#### _**som enums på stereoider**_


^ Johanne frem til det står noe annet

---

# Union Types

```elm
type KundeKlasse
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

type KundeKlasse
    = Student Rabatt
    | Bedrift Bedriftsnavn 
    | Privat
```

#### _**som enums på stereoider**_

---

# Pattern Matching

```elm
type KundeKlasse = Student Rabatt | Bedrift Bedriftsnavn | Privat

getRabatt : KundeKlasse -> Rabatt
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

^ Likner på komponenter i React.

---

### The Elm Architecture

Bilde

^

Redux, som veldig mange etter hvert har omfavnet som måten å håndtere tilstand på i JavaScript-applikasjoner er inspirert av måten Elm hån

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

# Takk for oss





