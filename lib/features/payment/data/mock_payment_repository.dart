import '../domain/payment_models.dart';
import '../domain/payment_repository.dart';

class MockPaymentRepository implements PaymentRepository {
  @override
  Future<List<ChildPaymentProfile>> getChildrenPayments() async => [
    ChildPaymentProfile(
      idschool: 'SCH001',
      serial: 'DEMO20',
      name: 'Sela Anindya',
      schoolName: 'SMP Demo STELA',
      periodLabel: 'Tahun Ajaran 2026/2027',
      periodReference: '2026/2027',
      className: 'VII A',
      idclass: 'CLS007A',
      items: const [
        PaymentItem(
          idschool: 'SCH001',
          idclass: 'CLS007A',
          serial: 'DEMO20',
          periode: '2026-07',
          jenisPembayaran: PaymentType.spp,
          title: 'SPP Juli 2026',
          amount: 350000,
          status: PaymentStatus.available,
        ),
        PaymentItem(
          idschool: 'SCH001',
          idclass: 'CLS007A',
          serial: 'DEMO20',
          periode: '2026-08',
          jenisPembayaran: PaymentType.spp,
          title: 'SPP Agustus 2026',
          amount: 350000,
          status: PaymentStatus.pending,
        ),
        PaymentItem(
          idschool: 'SCH001',
          idclass: 'CLS007A',
          serial: 'DEMO20',
          periode: '2026/2027',
          jenisPembayaran: PaymentType.other,
          title: 'Daftar Ulang',
          amount: 750000,
          status: PaymentStatus.available,
        ),
        PaymentItem(
          idschool: 'SCH001',
          idclass: 'CLS007A',
          serial: 'DEMO20',
          periode: '2026/2027',
          jenisPembayaran: PaymentType.other,
          referenceTambahan: 'RENANG',
          title: 'Kegiatan Renang',
          amount: 150000,
          status: PaymentStatus.paid,
        ),
      ],
    ),
    ChildPaymentProfile(
      idschool: 'SCH001',
      serial: 'DEMO21',
      name: 'Raka Pratama',
      schoolName: 'SD Demo STELA',
      periodLabel: 'Tahun Ajaran 2026/2027',
      periodReference: '2026/2027',
      className: 'IV B',
      idclass: 'CLS004B',
      items: const [
        PaymentItem(
          idschool: 'SCH001',
          idclass: 'CLS004B',
          serial: 'DEMO21',
          periode: '2026-07',
          jenisPembayaran: PaymentType.spp,
          title: 'SPP Juli 2026',
          amount: 300000,
          status: PaymentStatus.available,
        ),
        PaymentItem(
          idschool: 'SCH001',
          idclass: 'CLS004B',
          serial: 'DEMO21',
          periode: '2026/2027',
          jenisPembayaran: PaymentType.other,
          title: 'Buku Paket',
          amount: 250000,
          status: PaymentStatus.unavailable,
        ),
      ],
    ),
  ];
}
