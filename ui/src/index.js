import React from "react"
import ReactDOM from "react-dom"
import image from "./img/world.png"

const App = () => {
  return (
      <div>
          <h1>Hello world!</h1>
          <img src={image} />
      </div>
    
    
  );  
};

ReactDOM.render(<App/>, document.getElementById("app"))