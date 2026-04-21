// Copyright (c) 2025, Fotocolab Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 08/12/2025

const String appDomain = String.fromEnvironment('BASE_URL');
const String pinUrl = String.fromEnvironment('PING_URL');
const String env = String.fromEnvironment('ENV');
const String helpEmail = String.fromEnvironment('HELP_EMAIL');
const String encryptKey = String.fromEnvironment('ENCRYPT_KEY');
const String encryptIV = String.fromEnvironment('ENCRYPT_IV');
const bool isEncryption = bool.fromEnvironment('IS_ENCRYPTION');
const bool enableDebugPrint = bool.fromEnvironment('ENABLE_DEBUG_PRINT');
const String privacyPolicyUrl = String.fromEnvironment('PRIVACY_POLICY');
const String termsAndConditionsUrl = String.fromEnvironment(
  'TERMS_AND_CONDITION',
);
