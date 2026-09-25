/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        brand: {
          50: '#f0f9ff',
          100: '#e0f2fe',
          400: '#38bdf8',
          500: '#0ea5e9',
          600: '#0284c7',
          700: '#0369a1',
          900: '#0c4a6e',
          950: '#082f49',
        },
        nation: {
          dragon: '#e11d48', // Dragon Empire (Red)
          keter: '#eab308',  // Keter Sanctuary (Gold)
          brandt: '#06b6d4', // Brandt Gate (Cyan)
          dark: '#9333ea',   // Dark States (Purple)
          stoicheia: '#10b981', // Stoicheia (Emerald Green)
          lyrical: '#ec4899',   // Lyrical Monasterio (Pink)
          collab: '#64748b'
        },
        vg: {
          dark: '#0b0f19',
          cardBg: '#131b2e',
          surface: '#182238',
          border: '#2a3b5c',
          accent: '#38bdf8',
          gold: '#fbbf24',
          crimson: '#f43f5e'
        }
      },
      fontFamily: {
        kanit: ['Kanit', 'sans-serif'],
        cinzel: ['Cinzel', 'serif'],
        mono: ['JetBrains Mono', 'monospace'],
      },
      boxShadow: {
        'neon-blue': '0 0 15px rgba(56, 189, 248, 0.4)',
        'neon-red': '0 0 15px rgba(225, 29, 72, 0.4)',
        'neon-gold': '0 0 15px rgba(251, 191, 36, 0.4)',
        'card': '0 4px 20px -2px rgba(0, 0, 0, 0.5), 0 2px 6px -1px rgba(0, 0, 0, 0.3)',
      }
    },
  },
  plugins: [],
}
