<template>
  <v-container>
    <v-row>
      <v-col class="about">
        <h1>Historial de Instalaciones</h1>
      </v-col>
    </v-row>
    <v-row>
      <historial/>
    </v-row>
    
    

  </v-container>
</template>

<script>
import Historial from '../components/Historial.vue'


export default {
  name: 'App',
  components: {
    Historial
},
  methods:{

  }
}
</script>

