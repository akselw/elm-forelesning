# Elm
---
## Agenda

* Om oss
* Motivasjon
* Syntaks og språkkonsepter
* Liten app 

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

# Functions & type inference

```elm
increment x =
    x + 1

five = increment 4
```

^ Aksel frem til det står noe annet

---

# Type Signatures

```elm

increment : Int -> Int
increment x =
    x + 1

five : Int
five = increment 4
```

---

# Records and bindings

```elm
x : Int
x = 42

customer : { name : String, age : Int }
customer = 
    { name = "Erik"
    , age = 24
    }
```

---

# Type alias

```elm
type alias Customer =
    { name: String
    , age: Int
    }

erik : Customer
erik = 
    { name = "Erik"
    , age = 24
    }   
```

#### _**allows us to define new types**_

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
type alias Customer =
    { name: String
    , age: Int,
    , type: String
    }

erik : Customer
erik = 
    { name = "Erik"
    , age = 24
    , type = "Student"
    }   
```

---

# Type alias

```elm
type alias Customer =
    { name: String
    , age: Int,
    , type: String
    , studentDiscount: Int
    }

erik : Customer
erik = 
    { name = "Erik"
    , age = 24
    , type = "Student",
    , studentDiscount = 50
    }   
```

---

# Type alias

```elm
type alias Customer =
    { name: String
    , age: Int,
    , type: String
    , studentDiscount: Int
    , companyName: String
    }

erik : Customer
erik = 
    { name = "Erik"
    , age = 24
    , type = "Corporate",
    , studentDiscount = 0
    , companyName = "BEKK Consulting"
    }   
```

---

# Three problems:
_1. We get empty fields with dummy values_
_2. Easy to mistype `type`-field_
_3. No help from the compiler_

---

# Union Types

```elm
type CustomerClass
    = Student
    | Corporate
    | Private
```

#### _**like enums on stereoids**_


^ Johanne frem til det står noe annet

---

# Union Types

```elm
type CustomerClass
    = Student Int
    | Corporate String 
    | Private
```

#### _**like enums on stereoids**_

---

# Union Types

```elm
type alias Discount = Int
type alias CompanyName = String
type CustomerClass
    = Student Discount
    | Corporate CompanyName 
    | Private
```

#### _**like enums on stereoids**_

---

# Pattern Matching

```elm
type CustomerClass = Student Discount | Corporate CompanyName | Private

getDiscount : CustomerClass -> Discount
getDiscount class =
    case class of
        Student discount ->
            discount
        Corporate name ->
            0
        Private ->
            0
```

#### _**forgot a branch? compiler has you covered!**_

---

```html
<div>
    <img src=“/image.png” />
    <h1>Min elm-app!</h1>
</div>
```

---

```
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

```
$ npm install -g create-elm-app
$ create-elm-app min-forste-app
$ cd min-forste-app
$ elm-app start
```	



