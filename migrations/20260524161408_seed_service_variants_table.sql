-- +goose Up

INSERT INTO service_variants (
    id,
    service_id,
    name,
    price,
    unit,
    icon,
    active
)
VALUES
    (
        'aaaaaaaa-aaaa-aaaa-aaaa-111111111111',
        'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
        'Pasfoto (2x3, 3x4, 4x6)',
        'Rp 5.000',
        'Per lembar',
        'photo_library',
        true
    ),
    (
        'aaaaaaaa-aaaa-aaaa-aaaa-222222222222',
        'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
        'Paket Kilat Pasfoto (Edit + Cetak)',
        'Rp 15.000',
        'Paket isi 8',
        'photo_library',
        true
    ),
    (
        'aaaaaaaa-aaaa-aaaa-aaaa-333333333333',
        'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
        'Cetak Postcard (4R)',
        'Rp 3.500',
        'Per lembar',
        'photo_library',
        true
    ),
    (
        'aaaaaaaa-aaaa-aaaa-aaaa-444444444444',
        'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
        'Cetak Jumbo (10R / A4)',
        'Rp 12.000',
        'Per lembar',
        'photo_library',
        true
    ),
    (
        'aaaaaaaa-aaaa-aaaa-aaaa-555555555555',
        'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
        'Cetak Super Jumbo (A3+)',
        'Rp 25.000',
        'Per lembar',
        'photo_library',
        true
    ),
    (
        'dddddddd-dddd-dddd-dddd-111111111111',
        'dddddddd-dddd-dddd-dddd-dddddddddddd',
        'Print Dokumen HVS Hitam Putih',
        'Rp 500',
        'Per halaman',
        'print',
        true
    ),
    (
        'dddddddd-dddd-dddd-dddd-222222222222',
        'dddddddd-dddd-dddd-dddd-dddddddddddd',
        'Print Dokumen HVS Warna',
        'Rp 1.000 - Rp 2.500',
        'Sesuai cakupan warna',
        'print',
        true
    ),
    (
        'dddddddd-dddd-dddd-dddd-333333333333',
        'dddddddd-dddd-dddd-dddd-dddddddddddd',
        'Print Art Paper 150/210gsm',
        'Rp 7.000',
        'Per lembar A3+',
        'print',
        true
    ),
    (
        'dddddddd-dddd-dddd-dddd-444444444444',
        'dddddddd-dddd-dddd-dddd-dddddddddddd',
        'Sticker Vinyl (Cetak + Kiss Cut)',
        'Rp 15.000',
        'Per lembar A3+',
        'print',
        true
    ),
    (
        'bbbbbbbb-bbbb-bbbb-bbbb-111111111111',
        'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
        'Instal Ulang Windows (Original) + Driver',
        'Rp 75.000',
        'Per unit',
        'laptop_mac',
        true
    ),
    (
        'bbbbbbbb-bbbb-bbbb-bbbb-222222222222',
        'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
        'Pembersihan Hardware (Cleaning + Repaste)',
        'Rp 100.000',
        'Per unit',
        'laptop_mac',
        true
    ),
    (
        'bbbbbbbb-bbbb-bbbb-bbbb-333333333333',
        'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
        'Ganti Keyboard Laptop (Exclude Part)',
        'Rp 50.000',
        'Jasa pasang',
        'laptop_mac',
        true
    ),
    (
        'bbbbbbbb-bbbb-bbbb-bbbb-444444444444',
        'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
        'Cek Kerusakan (Konsultasi)',
        'FREE',
        'Konsultasi gratis',
        'laptop_mac',
        true
    ),
    (
        'bbbbbbbb-bbbb-bbbb-bbbb-555555555555',
        'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
        'Kabel USB Charger Fast Charging',
        'Rp 25.000',
        'Per unit',
        'cable',
        true
    ),
    (
        'bbbbbbbb-bbbb-bbbb-bbbb-666666666666',
        'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
        'Mouse Wireless Ergonomic',
        'Rp 45.000',
        'Per unit',
        'cable',
        true
    ),
    (
        'bbbbbbbb-bbbb-bbbb-bbbb-777777777777',
        'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
        'Flashdisk 32GB High Speed',
        'Rp 65.000',
        'Per unit',
        'cable',
        true
    )
    ON CONFLICT DO NOTHING;

-- +goose Down

DELETE FROM service_variants
WHERE id in (
    'aaaaaaaa-aaaa-aaaa-aaaa-111111111111',
    'aaaaaaaa-aaaa-aaaa-aaaa-222222222222',
    'aaaaaaaa-aaaa-aaaa-aaaa-333333333333',
    'aaaaaaaa-aaaa-aaaa-aaaa-444444444444',
    'aaaaaaaa-aaaa-aaaa-aaaa-555555555555',
    'dddddddd-dddd-dddd-dddd-111111111111',
    'dddddddd-dddd-dddd-dddd-222222222222',
    'dddddddd-dddd-dddd-dddd-333333333333',
    'dddddddd-dddd-dddd-dddd-444444444444',
    'bbbbbbbb-bbbb-bbbb-bbbb-111111111111',
    'bbbbbbbb-bbbb-bbbb-bbbb-222222222222',
    'bbbbbbbb-bbbb-bbbb-bbbb-333333333333',
    'bbbbbbbb-bbbb-bbbb-bbbb-444444444444',
    'bbbbbbbb-bbbb-bbbb-bbbb-555555555555',
    'bbbbbbbb-bbbb-bbbb-bbbb-666666666666',
    'bbbbbbbb-bbbb-bbbb-bbbb-777777777777'
            );