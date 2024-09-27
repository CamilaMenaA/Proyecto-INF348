<template>
  <v-app>
    <div id="app">
      <nav v-if="$route.name!='home'">
        <router-link to="/">Inicio</router-link> |
        <span v-if="$route.name=='aboutInstalacion'"> <router-link  to="/aboutInstalacion">Instalaciones</router-link>  </span>
        <span v-if="$route.name!='aboutInstalacion'"> <router-link  to="/aboutSoporte">Instalaciones</router-link> | </span>
        <router-link  v-if="$route.name!='aboutInstalacion'" to="/historial">Historial</router-link>
      </nav>
      <router-view/>
    </div>
  </v-app>
</template>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
