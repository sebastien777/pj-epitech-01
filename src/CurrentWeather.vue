<script>
import axios from 'axios'
export default {
  data() {
    console.log(this.$route.params.city);
    return {
      question: 'Où?',   
      meteo: 'Météo actuelle à',
      text_temperature: 'Temperature:',
      temperature: 0,
      date: 'Date: 14 Juin 2019',
      selected: this.$route.params.city,
      url: ''
    }
    
  },
  methods: {
    randomNumber: function () {
      return Math.floor(Math.random() * 30);
    }
  },
  mounted() {
    let url = 'http://api.openweathermap.org/data/2.5/weather?q=Lyon&?units=metric&APPID=???'
    axios
      .get(url)
      .then(response => {
        console.log(response.data);
        })
      .catch(error => {
        console.log(error);
        });
  }
}
</script>

<template>
  <body>

    <div class="flex-container">

      <div class="row">
        <select v-model="selected" @click=randomNumber()>
          <option selected>{{ this.$route.params.city }}</option>
          <option>Lyon</option>
          <option>Marseille</option>
          <option>Paris</option>
        </select>
      </div>

      <div class="row">
        <h1 class="meteo">{{ meteo }}</h1> 
        <br>
        <h1 class="selected">{{ selected }}</h1>
      </div>

      <br>

      <div class="row">
        <p class="text_temperature">{{ text_temperature }}</p>

        <div class="rand">
          {{randomNumber()}}°C
        </div>
      </div>

      <br>
      <p class="date">{{ date }}</p>

      <h1>Vous avez choisi: {{ $route.params.city }}</h1>
    </div>


  </body>
</template>

<style>
body {
  background-color: white !important;
}

.row {
  width: 100%;
  text-align: center;
}

.question {
  color:black;
  font-weight: bold;
}

.selected {
  color:black;
  font-weight: bold;
  display: inline-block;
}
.meteo {
  color:black;
  font-weight: bold;
  display: inline-block;
}

.text_temperature {
  color:black;
  font-weight: bold;
}

.rand {
  color:black;
  font-weight: bold;
}

.date {
  color:black;
  font-weight: bold;
}

</style>

