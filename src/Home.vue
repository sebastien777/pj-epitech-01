<script>

</script>

<template>
    <body>
        <h1>Hello!</h1>
        <br>
        <div id="app">
            <!--<router-link to="/currentweather" class='route'>Go to CurrentWeather</router-link>-->
            <router-link :to="{ name: 'home'}">Go to the homepage</router-link>
            <br>
            <router-link :to="{ name: 'currentweatherParams', params: { city: 'Bordeaux' }}">Go to CurrentWeather</router-link>
        </div>

        
        <div class='container'>
            <router-view/>  
        </div>     

    </body>
    
</template>

<style>
body {
  background-color: white !important;
}

h1{
    color:black;
}
.route {
    color:black;
}
</style>
