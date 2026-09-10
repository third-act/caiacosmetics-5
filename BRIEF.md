# BRIEF — CAIA Cosmetics (caiacosmetics-5)

Draft for Demo QA port. Research date: **10 September 2026**. English (skills). App UI: **Swedish**.

**Build gate:** OPEN — Demo QA **kjør** 10 Sep 2026.

**New project (full test).** Slug `caiacosmetics-5`, repo `third-act/caiacosmetics-5`. Do **not** reuse `caiacosmetics` / `caiacosmetics-2` / `caiacosmetics-3` code, seed, photos, or URLs. QA: https://www.thirdact.no/demo/caiacosmetics-5. Customer: https://www.thirdact.se/caiacosmetics-5 (form/market **SE** → `.se`). Skills pin: `ac5055d`. Track: **Demo Web / Composer** (not Demo Web Opus).

Do **not** contact the brand. Never put `info@caiacosmetics.com` in the UI. Form To `pal@thirdact.se` — never in UI.

---

## 0. HARD REQUIREMENT — onske (verbatim)

Confirmed character-for-character with Norway Scout **10 Sep 2026** (91 chars):

> **Man ska kunna scanna ansiktet och få rekommendationer på vilka produkter som passar min hud**

Must ship walkable: **face scan** → **resultat** → **rekommendationer** → **produkt-detalj**, plus **favoritter** and **profil**. Swedish UI. Brand from caiacosmetics.se. Elevate thin site layout with KIT. Do not paraphrase. Do not drop.

---

## 1. Client

| | |
|---|---|
| Name | Beauty Icons AB (CAIA Cosmetics) |
| Org | 559153-2493 |
| Site | https://caiacosmetics.se/ |
| Audience | KUNDE — shoppers; mer-salg via ansiktsscan → produktanbefaling (make up / hudvård) |
| Slug | caiacosmetics-5 |
| Form To | pal@thirdact.se — never in UI |
| Customer URL | https://www.thirdact.se/caiacosmetics-5 |
| QA | https://www.thirdact.no/demo/caiacosmetics-5 |

Founded by Bianca Ingrosso with beauty experts. SE D2C: makeup, skincare, hair, fragrance. Live heroes: Dewy Drops (18 shades), Soft Melt Peptide Lip Balm, Wake Me Up Cream, Soft Blend Brush F27, kits, Glow Blush, beauty cases. Soft cream/blush photography; Scandi-minimal white chrome with dusty-rose accents. Prices in KR.

**Brand tokens (live site 10 Sep):** primary blush `#E0CCC7`, cream `#FFFCF7` / soft pink `#F4EFEB`, ink `#333333`, hover `#6F6464`, sale accent `#996466`. Type: **Artico** (bundled close sans for web — no runtime google_fonts). Wordmark: `caia_logo.png` / dark SVG from caiacosmetics.se themes. Tone: informal *du*, CTAs Köp nu / Lägg till / UPPTÄCK / Shoppa. Shade finder + Shoppa efter hudtyp already on site — pitch is face-scan that answers hudtyp/underton *for* her, then recommends across makeup + hudvård.

---

## 2. Audience

Logged-in CAIA customer (mock). Primary job: scan the face and get product recommendations that fit their skin. Not staff/admin. Not loyalty backoffice.

---

## 2c. Art direction

| Soft depth | ☑ proposed — cream/pink beauty paper (caiacosmetics.se research) |
| Editorial light | ☐ |
| Warm document | ☐ |
| Dark luxury | ☐ |
| High-contrast sport | ☐ |

**Proposed:** **Soft depth** — cream paper `#FFFCF7`, primary blush `#E0CCC7`, ink `#333333`; CAIA wordmark as asset. Soft SE beauty glow, not black luxury chrome. Opus §6 may lock/adjust in §6e. Bundled fonts only (no runtime `google_fonts`).

---

## 5. Job flows (Demo QA)

**A. Face scan → resultat → rekommendationer**  
Open app → start **ansiktsscan / hudanalys** (mock scan + optional quiz decline path) → see **resultat** → land on **rekommendationer**.

**B. Rekommendation → produkt-detalj**  
From recommendations → tap a product → **produkt-detalj** (seed from caiacosmetics.se).

Favoritter / profil = shallow shell (Scout screen list). Handlekurv shallow OK.

---

## 6. Features

**§0 served (verbatim):**

> **Man ska kunna scanna ansiktet och få rekommendationer på vilka produkter som passar min hud**

→ **F1** = *scanna ansiktet*. **F2** = *rekommendationer på vilka produkter*. **F3** = *som passar min hud*.

**§6 owned by Cloud Agent `claude-opus-5` + `product/SKILL.md`.** Do not fill the three / signature here. After Demo QA opens the build gate, Opus writes 10–15 research, builds three, signature among those three.

---

## Screens (Scout)

face scan · resultat · rekommendationer · produkt-detalj · favoritter · profil

Splash → straight in as logged-in. No login route. No Firebase / Azure / TestFlight / Codemagic.
