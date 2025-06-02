<script lang="ts">
   import { fetchNui } from '../utils/fetchNui';
   import type { Attributes, AttributesLocale } from '../types';

   export let attributes: Attributes;
   export let locale: AttributesLocale;
   let age = attributes.age;
   let description = attributes.description;

   const handleClose = () => {
      fetchNui('closeAttributes');
   };

   const handleSave = () => {
      fetchNui('saveAttributes', {
         age,
         description
      });
   };
</script>

<div class="w-[550px] h-[600px] bg-gradient-to-br from-neutral-950 via-neutral-900 to-black relative">
   <div class="absolute top-4 left-4 flex items-start gap-4">
      <div class="w-14 h-14 border border-neutral-400/20 rounded-lg flex items-center justify-center">
         <img src="./header.svg" alt="icon" class="w-7 h-7" />
      </div>
      <div class="pt-1">
         <h1 class="text-white text-xl font-medium">{locale.title}</h1>
         <p class="text-neutral-400 text-sm mt-1">{locale.subtitle}</p>
      </div>
   </div>
   <button 
      on:click={handleClose}
      class="absolute top-4 right-4 w-8 h-8 flex items-center justify-center hover:bg-neutral-800/80 hover:scale-110 active:scale-95 rounded transition-all duration-200"
   >
      <img src="./close.svg" alt="close" class="w-5 h-5" />
   </button>
   <div class="absolute top-24 left-6 right-6 space-y-6">
      <div>
         <label for="age-range" class="text-neutral-300 text-sm mb-2 block">{locale.age_label}</label>
         <input 
            id="age-range"
            type="text" 
            bind:value={age}
            class="w-full bg-neutral-900/50 border border-neutral-400/20 px-4 py-3 text-white text-sm focus:outline-none focus:border-neutral-400/40 transition-colors" 
            placeholder={locale.age_placeholder}
         />
      </div>
      <div>
         <label for="description" class="text-neutral-300 text-sm mb-2 block">{locale.description_label}</label>
         <textarea 
            id="description"
            bind:value={description}
            class="w-full bg-neutral-900/50 border border-neutral-400/20 px-4 py-3 text-white text-sm focus:outline-none focus:border-neutral-400/40 transition-colors resize-none" 
            placeholder={locale.description_placeholder}
            rows="8"
         ></textarea>
         <p class="text-neutral-500 text-sm mt-2 text-center">{locale.description_hint}</p>
      </div>
   </div>
   <div class="absolute bottom-8 left-6 right-6">
      <button 
         on:click={handleSave}
         class="w-full bg-neutral-900 border border-neutral-400/20 text-white py-3 text-sm font-medium hover:bg-neutral-800 hover:border-neutral-400/40 hover:scale-[1.02] active:scale-[0.98] transition-all duration-200"
      >
         {locale.save_button}
      </button>
   </div>
</div>

