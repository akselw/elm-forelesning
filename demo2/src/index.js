import { Elm } from './Main.elm';
console.log(document.getElementById("elm-node"))

Elm.Main.init({
    node: document.getElementById("elm-node")
});