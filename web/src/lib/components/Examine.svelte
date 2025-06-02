<script lang="ts">
   import { fetchNui } from '../utils/fetchNui';
   import type { Attributes, ExamineLocale } from '../types';

   export let attributes: Attributes;
   export let playerName: string;
   export let locale: ExamineLocale;

   const handleClose = () => {
      fetchNui('closeExamine');
   };
</script>

<div class="w-[490px] h-[540px] bg-gradient-to-br from-neutral-950 via-neutral-900 to-black relative">
   <div class="absolute top-4 left-4 flex items-start gap-4">
      <div class="w-14 h-14 border border-neutral-400/20 rounded-lg flex items-center justify-center">
         <img src="./examine.svg" alt="icon" class="w-7 h-7" />
      </div>
      <div class="pt-1">
         <h1 class="text-white text-xl font-medium">{locale.title.replace('%s', playerName)}</h1>
         <p class="text-neutral-400 text-sm mt-1">{locale.subtitle}</p>
      </div>
   </div>
   <div class="absolute top-24 left-6 right-6 space-y-6">
      <div>
         <label for="examine-age" class="text-neutral-300 text-sm mb-2 block">{locale.age_label}</label>
         <input 
            id="examine-age"
            type="text" 
            readonly
            value={attributes.age}
            class="w-full bg-neutral-900/50 border border-neutral-400/20 px-4 py-3 text-white text-sm cursor-default" 
         />
      </div>
      <div>
         <label for="examine-description" class="text-neutral-300 text-sm mb-2 block">{locale.description_label}</label>
         <textarea 
            id="examine-description"
            readonly
            class="w-full bg-neutral-900/50 border border-neutral-400/20 px-4 py-3 text-white text-sm resize-none cursor-default" 
            rows="9"
         >{attributes.description}</textarea>
      </div>
   </div>
   <div class="absolute bottom-9 left-6 right-6">
      <button 
         on:click={handleClose}
         class="w-full bg-neutral-900 border border-neutral-400/20 text-white py-3 text-sm font-medium hover:bg-neutral-800 hover:border-neutral-400/40 hover:scale-[1.02] active:scale-[0.98] transition-all duration-200"
      >
         {locale.close_button}
      </button>
   </div>
</div>
