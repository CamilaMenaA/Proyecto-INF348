<template>
  <v-container grid-list-xs>
    <v-row>
      <v-col>
        <v-data-table
          :headers="headers"
          :items="registros_instalaciones"
          class="elevation-1"
        >
          <template v-slot:top>
            <v-toolbar flat>
              <v-toolbar-title>Instalaciones</v-toolbar-title>         
            </v-toolbar>
          </template>

          <template v-slot:[`item.actions`]="{ item }">
                <v-btn color="blue darken-1" text @click="getItem(item)"
                >ver más</v-btn> 
  
              </template>


        </v-data-table>
      </v-col>
    </v-row>

    <v-dialog v-model="readDialog" max-width="500px">
      <v-card>
        <v-card-title>
          <span class="text-h5">{{ "Información adicional" }}</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
                <v-col class="my-2" cols="12"> 
                  <template v-for="(item,index) in readItem" >
                    <li v-if="item!=null" :key="index"  class="text-left align-self-start">
                      <b>{{index}} :</b>  {{item}}
                    </li>
                   </template>
                </v-col>
            </v-row>
          </v-container>
        </v-card-text>
      </v-card>
    </v-dialog>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  name: "Historial",
  data() {
    return {
      registros_instalaciones: [],
      reg: [],
      readItem: "",
      readDevice: "",
      newInstalacion: {
        instalationid: 0,
        date_history: "",
        clientid: 0,
        action: "",
        date_instalation: "",
        position: "",
        status: "Pending",
        tecnicoid: 1,
      },
      readDialog: false,

      dialogDelete: false,
      headers: [
        {
          text: "Instalation Id",
          align: "start",
          sortable: false,
          value: "instalationid",
        },
        { text: "Action", value: "action"},
        { text: "Date History", value: "date_history" },
        {
          text: "Client Id", value: "clientid",
        },
        { text: "Date Instalation", value: "date_instalation" },
        { text: "Position", value: "position" },
        { text: "Status", value: "status" },
        { text: "Tecnicoid", value: "tecnicoid" },
        { text: "Tipo", value: "tipo" },
        { text: "Actions", value: "actions", sortable: false },
      ],

      headers2: [
        {
          text: "Instalation Id",
          align: "start",
          sortable: false,
          value: "instalationid",
        },
        { text: "Action", value: "action"},
        { text: "Date History", value: "date_history" },
        {
          text: "Client Id", value: "clientid",
        },
        { text: "Date Instalation", value: "date_instalation" },
        { text: "Position", value: "position" },
        { text: "Status", value: "status" },
        { text: "Tecnicoid", value: "tecnicoid" },
        { text: "Tipo", value: "tipo" },
      ],

    };
  },
  computed: {
  },

  watch: {
  },
  created() {
    this.getInstalaciones();
  },
  methods: {
    getInstalaciones() {
      console.log("buscar historial");
      axios.get("http://localhost:80/history/all").then((res) => {
        console.log("instalaciones", res.data);
        this.registros_instalaciones = res.data;
      });
    },

    async getInstalacion(id){
      let temp = await axios.get("http://localhost:80/history/"+id);
      console.log("Conseguido");
      return temp.data; 
    },

    getItem(item){
      console.log("Buscando Historial",item.id);
      axios.get("http://localhost:80/history/detalles/"+item.id).then((res) =>{
        console.log("instalacion", res);
        this.readItem = res.data;
        this.readDialog=true;

      });
      
    }


  },
};
</script>

<style>
</style>