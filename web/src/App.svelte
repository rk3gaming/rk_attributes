<script lang="ts">
   import './app.css'
   import Attributes from './lib/components/Attributes.svelte'
   import Examine from './lib/components/Examine.svelte'
   import { useNuiEvent } from './lib/utils/useNuiEvent'
   import type { SetVisibleData, SetExamineVisibleData } from './lib/types'
   
   let showAttributes = false;
   let showExamine = false;
   let attributes = { age: '', description: '' };
   let playerName = '';
   let attributesLocale: any;
   let examineLocale: any;

   useNuiEvent<SetVisibleData>('setVisible', (data) => {
      showAttributes = data.visibility;
      if (data.attributes) {
         attributes = data.attributes;
      }
      if (data.locale) {
         attributesLocale = data.locale;
      }
   });

   useNuiEvent<SetExamineVisibleData>('setExamineVisible', (data) => {
      showExamine = data.visibility;
      if (data.attributes) {
         attributes = data.attributes;
      }
      if (data.playerName) {
         playerName = data.playerName;
      }
      if (data.locale) {
         examineLocale = data.locale;
      }
   });
</script>

<main class="min-h-screen flex items-center">
   {#if showAttributes}
      <div class="fixed inset-0 bg-black/50"></div>
      <div class="flex justify-center w-full relative z-10">
         <Attributes {attributes} locale={attributesLocale} />
      </div>
   {/if}
   {#if showExamine}
      <div class="fixed inset-0 bg-black/50"></div>
      <div class="ml-auto mr-8 relative z-10">
         <Examine {attributes} {playerName} locale={examineLocale} />
      </div>
   {/if}
</main>

<style>
 
</style>
