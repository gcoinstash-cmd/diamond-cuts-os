-- Diamond Cuts Barber & Salon Floor OS Database Schema
-- Row Level Security (RLS) Enabled

CREATE TABLE IF NOT EXISTS appointments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_name TEXT NOT NULL,
  customer_phone TEXT NOT NULL,
  customer_email TEXT,
  service_category TEXT NOT NULL CHECK (service_category IN ('barbering', 'braids', 'locTech', 'hairStylists')),
  service_name TEXT NOT NULL,
  specialist_name TEXT NOT NULL,
  appointment_date DATE NOT NULL,
  appointment_time TEXT NOT NULL,
  price TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'confirmed' CHECK (status IN ('pending', 'confirmed', 'seated', 'completed', 'cancelled')),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS salon_specialists (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  role TEXT NOT NULL,
  specialty TEXT NOT NULL,
  chair_number INT NOT NULL,
  is_available BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS salon_daily_metrics (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  date DATE NOT NULL UNIQUE,
  total_cuts INT DEFAULT 0,
  gross_revenue NUMERIC(10, 2) DEFAULT 0.00,
  active_chairs INT DEFAULT 8,
  walkins_served INT DEFAULT 0,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Row Level Security
ALTER TABLE appointments ENABLE ROW LEVEL SECURITY;
ALTER TABLE salon_specialists ENABLE ROW LEVEL SECURITY;
ALTER TABLE salon_daily_metrics ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read access to appointments"
  ON appointments FOR SELECT
  USING (true);

CREATE POLICY "Allow public insert appointments"
  ON appointments FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Allow public read access to specialists"
  ON salon_specialists FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access to daily metrics"
  ON salon_daily_metrics FOR SELECT
  USING (true);
