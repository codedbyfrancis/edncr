# Nuxt 4 NuxtUi Supabase TailwindCss Boilerplate

## Material Design

https://9to5google.com/2025/08/17/google-material-3-expressive-redesign/

## Google One Tap Sign in do not show

Remove the url to allow
chrome://settings/content/federatedIdentityApi

Look at the [Nuxt documentation](https://nuxt.com/docs/getting-started/introduction) to learn more.

# Run Project

Run: npm run devsecure -- --host

# Supabase Locally

## If can not start

Run: colima start
Run: supabase stop --no-backup && supabase start

Run: colima start && supabase stop --no-backup && supabase start

# AI CLI

gemini
cursor-agent

# Supabase Migration

## Initial Schema

Run: supabase db diff --use-migra initial_schema -f initial_schema.sql

## New Table and Column

Run: supabase db diff --use-migra new_table_column -f new_table_column.sql
# edncr
