<template>
  <v-container>
    <v-row  class="pt-16">
      <v-col>
        <h1>
          Bienvenido! Selecciona cómo quieres entrar
        </h1>
      </v-col>
    </v-row>
    <v-row class="pt-16">
      <v-spacer></v-spacer>
      <v-col cols="3">
        <v-btn text x-large to="/aboutSoporte">Soporte</v-btn>
      </v-col>
      <v-col cols="3">
        <v-btn text x-large  to="/aboutInstalacion">Instalación</v-btn>
      </v-col >
      <v-spacer></v-spacer>
    </v-row>
  </v-container>
</template>

<script>
// @ is an alias to /src

export default {
  name: 'HomeView',
}
</script>
