# Payment V1 Required Metadata for Flutter

## Purpose

This document defines the minimum response metadata required to render the
Payment Explorer without mock data, client inference, or fallback values.
Backend remains the source of truth for every payment state and amount.

## 1. Parent students endpoint

```http
GET /api/v1/parents/{parent_reference}/students
```

Return only actual student records. Do not return an OTM/parent account as a
student entry.

| Field | Required | Reason |
| --- | --- | --- |
| `student_reference` | Yes | Exact identifier passed to the bills endpoint. |
| `student_name` | Yes | Student payment tree header. |
| `school_name` | Yes | Student context. |
| `idschool` | Yes | Server-owned school context. |
| `idclass` | Yes | Current class context; bill records may override it. |
| `class_name` | Yes | Human-readable current class. |
| `periode` | Temporarily nullable | Must become a non-null active academic-period reference once the period table is ready. |

## 2. Student bills endpoint

```http
GET /api/v1/students/{student_reference}/bills
```

The response must contain `bills: []`. Every bill needs its own academic and
class context because historic bills may not belong to the student's current
class or period.

| Field | Required | Reason |
| --- | --- | --- |
| `source_reference` | Yes | Opaque server ID sent when adding the item to a cart. |
| `title` | Yes | Bill label in the UI. |
| `amount` | Yes | Integer IDR amount; server remains authoritative. |
| `status` | Yes | Determines payment state; Flutter must not guess it. |
| `is_selectable` | Yes | Explicit server decision whether the item can enter a cart. |
| `jenis_pembayaran` | Yes | `SPP` or `OTHER`, for grouping. |
| `periode` | Yes | Academic period/reference for the payment tree. |
| `idschool` | Yes | Bill school context. |
| `idclass` | Yes | Bill class context. |
| `class_name` | Yes | Human-readable class in invoice/tree. |
| `due_date` | Nullable | ISO-8601 date when applicable. |
| `description` | Nullable | Supporting detail. |
| `disabled_reason` | Required when not selectable | User-facing reason; no client-made reason. |

## 3. Canonical status values

Backend should return one of these uppercase values:

| Status | Selectable | Meaning |
| --- | --- | --- |
| `AVAILABLE` | `true` | Can be added to cart. |
| `OVERDUE` | `true` or `false` | Past due; backend decides eligibility. |
| `PAID` | `false` | Successfully paid. |
| `PENDING` | `false` | Payment is being processed. |
| `DISABLED` | `false` | Temporarily unavailable; send `disabled_reason`. |
| `EXPIRED` | `false` | Payment window expired; send `disabled_reason`. |
| `UNAVAILABLE` | `false` | Not available; send `disabled_reason`. |

`status` and `is_selectable` are deliberately separate. For example, an
overdue bill can still be selectable when the server permits it. Flutter must
use `is_selectable` for the checkbox and `status` for display.

## 4. Example bills response

```json
{
  "student_reference": "ALSN 0563",
  "bills": [
    {
      "source_reference": "BILL-2026-07-001",
      "title": "SPP Juli 2026",
      "description": null,
      "amount": 350000,
      "status": "AVAILABLE",
      "is_selectable": true,
      "disabled_reason": null,
      "jenis_pembayaran": "SPP",
      "periode": "2026/2027",
      "idschool": "ALSMP",
      "idclass": "241148",
      "class_name": "KELAS 9-2",
      "due_date": "2026-07-10"
    }
  ]
}
```

## Implementation gate

Flutter should map only the documented field names and enum values above. A
missing mandatory value is an integration error and must be surfaced to the
user/development team; no mock or substitute value is allowed.
