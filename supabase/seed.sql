-- Diamond Cuts Barber & Salon Floor OS Seed Data

INSERT INTO salon_specialists (slug, name, role, specialty, chair_number, is_available) VALUES
  ('marcus', 'Marcus Stirling', 'Master Barber & Founder', 'Precision Fades & Straight Razor', 1, true),
  ('kiara', 'Kiara J.', 'Lead Braiding Artist', 'Artistic Cornrows & Box Braids', 2, true),
  ('andre', 'Andre Vance', 'Loc Architect & Specialist', 'Loc Maintenance & Scalp Hydration', 3, true),
  ('elena', 'Elena Ramos', 'Senior Shear Stylist', 'Silk Press, Color & Blowouts', 4, true);

INSERT INTO appointments (customer_name, customer_phone, customer_email, service_category, service_name, specialist_name, appointment_date, appointment_time, price, status) VALUES
  ('Dominic West', '(310) 555-0142', 'dom.west@gmail.com', 'barbering', 'The Diamond Experience (Cut, Beard, Facial)', 'Marcus Stirling', CURRENT_DATE, '10:00 AM', '$110', 'seated'),
  ('Nia Jones', '(323) 555-0189', 'nia.j@icloud.com', 'braids', 'Premium Feed-in Cornrows', 'Kiara J.', CURRENT_DATE, '11:30 AM', '$95', 'confirmed'),
  ('Marcus Vance', '(424) 555-0231', 'mvance@outlook.com', 'locTech', 'Premium Hair Loc Retwist & Grooming', 'Andre Vance', CURRENT_DATE, '01:00 PM', '$120', 'confirmed'),
  ('Julian Cole', '(310) 555-0912', 'jcole@agency.co', 'barbering', 'Signature Skin Fade & Edge-up', 'Marcus Stirling', CURRENT_DATE, '02:30 PM', '$55', 'pending');

INSERT INTO salon_daily_metrics (date, total_cuts, gross_revenue, active_chairs, walkins_served) VALUES
  (CURRENT_DATE, 24, 2480.00, 8, 6);
