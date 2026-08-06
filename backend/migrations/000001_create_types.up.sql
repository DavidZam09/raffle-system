-- ============================
-- USER ROLE
-- ============================

CREATE TYPE user_role AS ENUM (
    'SUPER_ADMIN',
    'ADMIN'
);

-- ============================
-- RAFFLE STATUS
-- ============================

CREATE TYPE raffle_status AS ENUM (
    'DRAFT',
    'PUBLISHED',
    'CLOSED',
    'DRAWN',
    'CANCELLED'
);

-- ============================
-- RAFFLE NUMBER STATUS
-- ============================

CREATE TYPE raffle_number_status AS ENUM (
    'AVAILABLE',
    'RESERVED',
    'SOLD',
    'WINNER'
);

-- ============================
-- PURCHASE STATUS
-- ============================

CREATE TYPE purchase_status AS ENUM (
    'PENDING_PAYMENT',
    'UNDER_REVIEW',
    'PARTIALLY_APPROVED',
    'APPROVED',
    'REJECTED',
    'EXPIRED'
);

-- ============================
-- PURCHASE ITEM STATUS
-- ============================

CREATE TYPE purchase_item_status AS ENUM (
    'PENDING',
    'UNDER_REVIEW',
    'APPROVED',
    'REJECTED',
    'EXPIRED'
);

-- ============================
-- PAYMENT STATUS
-- ============================

CREATE TYPE payment_status AS ENUM (
    'UNDER_REVIEW',
    'APPROVED',
    'REJECTED'
);

-- ============================
-- PURCHASE ORIGIN
-- ============================

CREATE TYPE purchase_origin AS ENUM (
    'WEB',
    'ADMIN_PANEL'
);

-- ============================
-- FILE TYPE (opcional)
-- ============================

CREATE TYPE file_type AS ENUM (
    'PROFILE_IMAGE',
    'RAFFLE_IMAGE',
    'PRIZE_IMAGE',
    'PAYMENT_RECEIPT',
    'OTHER'
);

-- ============================
-- NOTIFICATION TYPE
-- ============================

CREATE TYPE notification_type AS ENUM (
    'INFO',
    'SUCCESS',
    'WARNING',
    'ERROR'
);

-- ============================
-- NOTIFICATION STATUS
-- ============================

CREATE TYPE notification_status AS ENUM (
    'UNREAD',
    'READ'
);

-- ============================
-- DRAW METHOD
-- ============================

CREATE TYPE draw_method AS ENUM (
    'MANUAL',
    'RANDOM_SYSTEM',
    'LOTTERY_RESULT'
);

-- ============================
-- PRIZE TYPE
-- ============================

CREATE TYPE prize_type AS ENUM (
    'MAIN',
    'SECONDARY',
    'BONUS'
);