# n8n on Render — AMA Automations

## Files in this repo
| File | Purpose |
|---|---|
| `Dockerfile` | Builds the n8n container |
| `render.yaml` | Render blueprint (auto-configures the service) |
| `.env.example` | Reference for all environment variables |

---

## Deployment Steps

### 1. Push to GitHub
```bash
git add Dockerfile render.yaml .env.example README.md
git commit -m "Add Render deployment config"
git push
```

### 2. Deploy on Render
- Go to https://render.com → New → Web Service
- Connect your GitHub repo
- Render will auto-detect `render.yaml` and configure everything
- Click **Deploy**

### 3. Update environment variables
In Render Dashboard → Your Service → Environment:
- Replace all `your-supabase-*` values with your real Supabase credentials
- Update `WEBHOOK_URL` to your actual Render URL after first deploy

### 4. Keep it alive with UptimeRobot
- Sign up at https://uptimerobot.com (free)
- New Monitor → HTTP(S)
- URL: `https://your-service-name.onrender.com/healthz`
- Interval: **5 minutes**

---

## Your Webhook Base URL
```
https://your-service-name.onrender.com/webhook/
```
Update this in n8n: Settings → Webhook URL

---

## Troubleshooting
| Problem | Fix |
|---|---|
| Bot goes offline | Set up UptimeRobot ping |
| DB connection error | Check Supabase SSL is enabled |
| Workflows lost after redeploy | Supabase DB stores them — safe |
| Webhook not triggering | Update WEBHOOK_URL env var |
