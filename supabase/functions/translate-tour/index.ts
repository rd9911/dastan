// supabase/functions/translate-tour/index.ts
// Supabase Edge Function stub for translating guide content.
// Calls DeepL API to translate text while preserving structure.

import { serve } from 'https://deno.land/std/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

serve(async (req) => {
  try {
    const { tourId, targetLanguage, guideContentJson } = await req.json()

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    )

    // 1. Call DeepL API with guide content
    // Translate only text fields, preserve JSON structure
    // TODO: Replace with actual DeepL API call
    // const deeplKey = Deno.env.get('DEEPL_API_KEY')
    // const translateText = async (text: string) => {
    //   const response = await fetch('https://api-free.deepl.com/v2/translate', {
    //     method: 'POST',
    //     headers: { 'Authorization': `DeepL-Auth-Key ${deeplKey}`, 'Content-Type': 'application/json' },
    //     body: JSON.stringify({ text: [text], target_lang: targetLanguage.toUpperCase() }),
    //   })
    //   const data = await response.json()
    //   return data.translations[0].text
    // }

    // 2. Deep-translate the guide content structure
    // const translatedContent = structuredClone(guideContentJson)
    // for (const section of translatedContent.sections) {
    //   section.chapterTitle = await translateText(section.chapterTitle)
    //   for (const block of section.blocks) {
    //     if (block.content) block.content = await translateText(block.content)
    //     if (block.label) block.label = await translateText(block.label)
    //     if (block.value) block.value = await translateText(block.value)
    //   }
    // }

    // 3. Store translated content in tour_audio_versions
    // await supabase
    //   .from('tour_audio_versions')
    //   .update({ translated_content: translatedContent })
    //   .eq('tour_id', tourId)
    //   .eq('language_code', targetLanguage)

    // 4. Trigger generate-audio for the translated content
    // await supabase.functions.invoke('generate-audio', {
    //   body: { tourId, languageCode: targetLanguage, guideContentJson: translatedContent }
    // })

    return new Response(JSON.stringify({ success: true, tourId, targetLanguage }), {
      headers: { 'Content-Type': 'application/json' },
      status: 200,
    })
  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      headers: { 'Content-Type': 'application/json' },
      status: 500,
    })
  }
})
