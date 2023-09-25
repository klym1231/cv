import React , {Component} from "react";
import ThreadDisplay from "./ThreadDisplay/components/ThreadDisplay";
import './App.css';
import { initializeApp } from "firebase/app";
import { getDatabase } from "firebase/database";
//import { getDatabase, ref } from "firebase/database";
require('firebase/database');
class App extends Component {
  constructor(props) {
    super(props);

    const firebaseConfig = {
      apiKey: "AIzaSyCFvMWWAC_RMx3fRyKpNR3KYUpfiOMJmUc",
      authDomain: "animated-bit-328409.firebaseapp.com",
      databaseURL: "https://animated-bit-328409-default-rtdb.firebaseio.com",
      projectId: "animated-bit-328409",
      storageBucket: "animated-bit-328409.appspot.com",
      messagingSenderId: "147452714497",
      appId: "1:147452714497:web:f958337ab83c17dab86a00"
    };

    this.app = initializeApp(firebaseConfig);
    this.database = getDatabase(this.app);
  }

  render() {
    return (
      <ThreadDisplay database={this.database} />
    );
  }
}

export default App;