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

## Frontendprogrammering
* Elm er et språk for nettsider


^ Johanne

---

## Javascript
* Brendan Eich: ville egentlig lage Scheme i nettleseren
* Litt historikk
* Litt om hva vi bruker språket til


^ Johanne

---

## Problemer med JavaScript
* Ikke typer
* Hybrid mellom OO og FP
* Feiler runtime
* Dårlige feilmeldinger


^ Johanne

---

## Elm:
* Typesikkert/bra typesystem
* Rent funksjonelt
* Kompilator!
* Bra feilmeldinger
* Elm kompilerer til JavaScript (i dag).


^ Johanne

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

# Takk for oss





