// supabase/functions/generate-audio/index.ts
// Supabase Edge Function stub for TTS audio generation.
// Calls external TTS API, uploads result to Storage, updates tour_audio_versions.

import { serve } from 'https://deno.land/std/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

serve(async (req) => {
  try {
    const { tourId, languageCode, guideContentJson } = await req.json()

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    )

    // 1. Extract text from guide content JSON
    const sections = guideContentJson.sections ?? []
    const fullText = sections
      .map((s: any) =>
        s.blocks
          .filter((b: any) => b.rpiType === 'text' || b.rpiType === 'highlight')
          .map((b: any) => b.content)
          .join(' ')
      )
      .join('\n\n')

    // 2. Call external TTS API (placeholder: ElevenLabs, Google TTS, etc.)
    // TODO: Replace with actual TTS API call
    // const ttsResponse = await fetch('https://api.elevenlabs.io/v1/text-to-speech/...', { ... })
    // const audioBytes = await ttsResponse.arrayBuffer()

    // 3. Upload to Supabase Storage 'tour-audio' bucket
    // const { data: upload } = await supabase.storage
    //   .from('tour-audio')
    //   .upload(`${tourId}/${languageCode}.mp3`, audioBytes, {
    //     contentType: 'audio/mpeg',
    //     upsert: true,
    //   })

    // 4. Update tour_audio_versions: set status='ready', audio_url=<url>
    // const { data: urlData } = supabase.storage
    //   .from('tour-audio')
    //   .getPublicUrl(`${tourId}/${languageCode}.mp3`)
    // await supabase
    //   .from('tour_audio_versions')
    //   .update({ status: 'ready', audio_url: urlData.publicUrl })
    //   .eq('tour_id', tourId)
    //   .eq('language_code', languageCode)

    // 5. Trigger create-preview-clip function
    // await supabase.functions.invoke('create-preview-clip', { body: { tourId, languageCode } })

    return new Response(JSON.stringify({ success: true, tourId, languageCode }), {
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
