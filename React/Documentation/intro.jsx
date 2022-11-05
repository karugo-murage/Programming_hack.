// You can imagine a framework is like a car — while it is interesting and useful to know how the engine works or how to fix a transmission, that knowledge isn't necessary for using the car to get where you want to go. What is necessary is that you understand how to use the pedals, turn the wheel and change gears.
node -v
npm -v
// This will be used to test the version of node installed in the machine.
// Jest and Mocha are used for tests.
// Package.json file . Adding scripts.
// Google components extension debugging tool for devs.
// Below is the imperative approach
const header = document.createElement("h1")
header.id = "header"
header.className = "blue"
header.textContent = "Hello from Vanilla JS!"
document.getElementById("root").append(header)
// React declarative way
ReactDOM.render(
    // what we to display (our entire app)
    element,
    // where we want to display it
    document.getElementById("root")
  )
// Babel is a transpiller that is used to transfer jsx to js that the browser can understand.
// Features of Jsx
//  1.{}Inside this curly braces, we can evaluate js variables or functions
//  2.When using jsx it returns only one top level element , If you wanna return multiple lines, enclose them in a <div></div> container.

// Good programming practice is to eliminate unneccessary dom elements
function createCard(greeting, subheader) {
    return (
      <React.Fragment>
        <h1>{greeting}</h1>
        <h2>{subheader}</h2>
      </React.Fragment>
    )
  }