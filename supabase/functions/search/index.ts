import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
    // Handle CORS
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        const supabaseClient = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_ANON_KEY') ?? '',
            { global: { headers: { Authorization: req.headers.get('Authorization')! } } }
        )

        // 1. Get user (verifies JWT automatically)
        const { data: { user }, error: authError } = await supabaseClient.auth.getUser()

        // Allow guest access if explicitly handled, otherwise require auth
        // For now, let's enforce auth as per plan for multi-search
        if (authError || !user) {
            // In a real app, you might check a 'guest_token' or allow 1-time search
            // return new Response(JSON.stringify({ error: 'Unauthorized' }), { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } })
        }

        // 2. Parse request
        const { vertical, params } = await req.json()

        // 3. Check Cache in Postgres
        const cacheKey = `${vertical}:${JSON.stringify(params)}`
        const { data: cached } = await supabaseClient
            .from('search_cache')
            .select('response')
            .eq('key', cacheKey)
            .gt('expires_at', new Date().toISOString())
            .single()

        if (cached) {
            console.log('Cache hit for:', cacheKey)
            return new Response(JSON.stringify(cached.response), {
                headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            })
        }

        // 4. Call Scraper (Placeholder for now)
        // NOTE: This will eventually call your serverless scraper
        console.log('Cache miss. Calling scraper for:', vertical)

        // MOCK RESPONSE (compliant with SearchResponse)
        const mockResult = {
            items: [],
            page: 0,
            pageSize: 20,
            totalItems: 0,
            meta: {
                searchRequestId: 'mock_req_123',
                tookMs: 10,
                providers: []
            }
        }

        // 5. Store in Cache (5 minute TTL)
        const expiresAt = new Date()
        expiresAt.setMinutes(expiresAt.getMinutes() + 5)

        await supabaseClient.from('search_cache').upsert({
            key: cacheKey,
            vertical: vertical,
            response: mockResult,
            expires_at: expiresAt.toISOString(),
        })

        return new Response(JSON.stringify(mockResult), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        })

    } catch (error) {
        return new Response(JSON.stringify({ error: error.message }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 400,
        })
    }
})
