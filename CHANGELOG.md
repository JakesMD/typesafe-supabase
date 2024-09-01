# Changelog

## 0.0.1-dev.13
- 🐛 Fix type error in `SupaRecord`

## 0.0.1-dev.12
- ✨ Add default JSON converter for DateTime
- ✨ Add `SupaException`
- 🐛 Fix type error in `SupaRecord`

## 0.0.1-dev.11
- ✨ Add custom `foreignKey` option for table joins where more than one relationship is found
- 🐛 Fix `primaryKey` should be a `List<String>` to accommodate composite keys

## 0.0.1-dev.10
- ✨ Add option for nullable one-to-one table join fields

## 0.0.1-dev.9
- 🐛 Fix generator fails when table contains no columns

## 0.0.1-dev.8
- ✨ Add `stream` query
- 🐛 Fix filter `fetch` not optional

## 0.0.1-dev.7
- ✨ Add `count` modifier

## 0.0.1-dev.6
- ✨ Add modifiers to `delete` query
- 🐛 Fix `upsert` taking values instead of `SupaInsert`s as an argument
- 🐛 Fix `insert`, `update`, and `upsert` selecting records when modifier is `SupaNoneModifier`

## 0.0.1-dev.5
- ✨ Add `upsert` query

## 0.0.1-dev.4
- ✨ Add modifiers to `update` query

## 0.0.1-dev.3
- ✨ Add modifiers to `insert` query

## 0.0.1-dev.2
- ✨ Add custom schemas

## 0.0.1-dev.1
- 🎉 Initial release