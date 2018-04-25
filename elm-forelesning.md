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

---

## Ulike FP-språk
* Lisp og ML: overordnete
* Peke til de ulike språkene som likner.

---

## Frontendprogrammering
* Elm er et språk for nettsider

---

## Javascript
* Brendan Eich: ville egentlig lage Scheme i nettleseren
* Litt historikk
* Litt om hva vi bruker språket til

---

## Problemer med JavaScript
* Ikke typer
* Hybrid mellom OO og FP
* Feiler runtime
* Dårlige feilmeldinger

---

## Elm:
* Typesikkert/bra typesystem
* Rent funksjonelt
* Kompilator!
* Bra feilmeldinger
* Elm kompilerer til JavaScript (i dag).

---
# Functions & type inference
```elm
increment x =
    x + 1
five = increment 4
```
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




