<template>

  <div>
    {{user.authorities}}
      <div id="admin-view" v-if="$store.user != null && $store.user.authorities['name'] == 'ROLE_ADMIN'">
     
      <b-container fluid>
    <b-form>
      
     
        <b-form-group
        id="input-group-1"
        label="Search"
        label-for="input-1"
       
      >
        <input ref="autocomplete" class="form-control"/>
        </b-form-group>
        <b-form-group
        id="input-group-1"
        label="Name"
        label-for="input-1"
       
      >
        <b-form-input v-model="name"> </b-form-input>
        </b-form-group>
        <b-form-group
        id="input-group-1"
        label="Description"
        label-for="input-1"
       
      >
        <b-form-input v-model="description"> </b-form-input>
        </b-form-group>
        <b-form-group
        id="input-group-1"
        label="Address"
        label-for="input-1"
        
      >
        <b-form-input v-model="address"> </b-form-input>
        </b-form-group>
        <b-form-group
        id="input-group-1"
        label="Tagline"
        label-for="input-1"
       
      >
        <b-form-input v-model="tagline" maxlength=75> </b-form-input>
        </b-form-group>
        <b-form-group
        id="input-group-1"
        label="Category"
        label-for="input-1"
       
      >
       <b-form-select v-model="category" :options="categoryOptions" class="form-control"></b-form-select>
        </b-form-group>
        <b-form-group
        id="input-group-1"
        label="imgURL"
        label-for="input-1"
       
      >
        <b-form-input v-model="imgURL" type="url"> </b-form-input>
        </b-form-group>
        <b-form-group
        id="input-group-1"
        label="placeId"
        label-for="input-1"
       
    
      >
        <b-form-input v-model="placeId"> </b-form-input>
        </b-form-group>
        <b-form-group
        id="input-group-1"
        label="Longitude"
        label-for="input-1"
       
      >
        <b-form-input v-model="longitude"> </b-form-input>
        </b-form-group>
        <b-form-group
        id="input-group-1"
        label="Latitude"
        label-for="input-1"
       
      >
        <b-form-input v-model="latitude"> </b-form-input>

        </b-form-group>
     
      
        <b-form-group id="input-group-4">
       
          <b-form-checkbox v-model="monday">Monday</b-form-checkbox>
          <b-form-checkbox v-model="tuesday">Tuesday</b-form-checkbox>
          <b-form-checkbox v-model="wednesday">Wednesday</b-form-checkbox>
          <b-form-checkbox v-model="thursday">Thursday</b-form-checkbox>
          <b-form-checkbox v-model="friday">Friday</b-form-checkbox>
          <b-form-checkbox v-model="saturday">Saturday</b-form-checkbox>
          <b-form-checkbox v-model="sunday">Sunday</b-form-checkbox>
         
        
      </b-form-group>
        </b-form>
        </b-container>
  </div>
  <div id="user-view" v-else>
    hi
    </div>
 </div>
 
</template>




<script>
export default {
    name: 'add-landmark',
    
data() {
    return {
        categoryOptions: [
          { value: null, text: '' },
          { value: 'Entertainment', text: 'Entertainment' },
          { value: 'Sports', text: 'Sports' },
          { value: 'Food & Beverage', text: 'Food & Beverage' },
          { value: 'Landmark', text: 'Landmark'},
          
        ],
name: '',
description: '',
tagline: '',
daysHours: '',
category: '',
imgURL: '',
thumbsUp: 0,
thumbsDown: 0,
monday: false,
tuesday: false,
wednesday: false,
thursday: false,
friday: false,
saturday: false,
sunday: false,
placeId: '',
latitude: 0,
user: this.$store.getters.userAuth,
longitude: 0,
address: '',
isLive: false,
options: { 
    bounds: new window.google.maps.LatLngBounds(
    new window.google.maps.LatLng(41.7206, -87.7017),
    new window.google.maps.LatLng(42.0126, -87.6746)),
    strictBounds: true,
     
    fields: ['photos','formatted_address', 'name', 'geometry', 'place_id', 'opening_hours']
  }
}
},


mounted() {
  
    
    this.autocomplete = new window.google.maps.places.SearchBox(
      (this.$refs.autocomplete),
      this.options
    );
   
 this.autocomplete.addListener('places_changed', () => {
  let places = this.autocomplete.getPlaces();
  places.forEach((place => {
      console.log(place)
  this.name = place.name
  this.placeId = place.place_id
  this.address = place.formatted_address
  this.latitude = place.geometry.location.lat()
  this.longitude = place.geometry.location.lng()
  this.imgURL = place.photos[0].getUrl()
  if(place.opening_hours.weekday_text[0] != null && place.opening_hours.weekday_text[0].includes("Open")) {
      this.monday = true;
  }
  if(place.opening_hours.weekday_text[1] != null && place.opening_hours.weekday_text[0].includes("Open")) {
      this.tuesday = true;
  }
  if(place.opening_hours.weekday_text[2] != null && place.opening_hours.weekday_text[0].includes("Open")) {
      this.wednesday = true;
  }
  if(place.opening_hours.weekday_text[3] != null && place.opening_hours.weekday_text[0].includes("Open")) {
      this.thursday = true;
  }
  if(place.opening_hours.weekday_text[4] != null && place.opening_hours.weekday_text[0].includes("Open")) {
      this.friday = true;
  }
  if(place.opening_hours.weekday_text[5] != null && place.opening_hours.weekday_text[0].includes("Open")) {
      this.saturday = true;
  }
  if(place.opening_hours.weekday_text[6] != null && place.opening_hours.weekday_text[0].includes("Open")) {
      this.sunday = true;
  }
 }))
 })

  } 
  


}

</script>

<style>

</style>