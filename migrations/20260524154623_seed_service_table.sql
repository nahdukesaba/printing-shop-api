-- +goose Up

INSERT INTO services (
    id,
    category_id,
    title,
    slug,
    description,
    price,
    unit,
    status,
    icon,
    img,
    active
)
VALUES
    (
        'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
        '11111111-1111-1111-1111-111111111111',
        'Cetak Foto Pro',
        'cetak-foto-pro',
        'Cetak foto berkualitas studio dengan kertas premium dan tinta tahan pudar hingga puluhan tahun.',
        'Rp 5.000',
        'Mulai Dari',
        'Tersedia',
        'print',
        'https://lh3.googleusercontent.com/aida-public/AB6AXuABswVYLHy3yIg-CPy2G8knnqLN9oGNaFhtVFCyKfLdev2io8BGTsa4CV76S3kmnIqsZt81jdb_OCXwtBp_M01lW-0opTbNNQArfJtpdFwVt0KOpvyvl3mrXKbO4jNA8_ZD4VBxE0DEM7iKxFDbfuE3kdFAhwYTsT5gd2ZWSBdJjJ2j7XDbmqItph2lP5bcdJCbZ2QD90f8g2PdIKY-8kjyUpPEzPylRX3Gc3Fuze2k_7fNc7_pgBh0OJXe5phsxta4W7n6kaClJkZT',
        true
    ),
    (
        'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
        '22222222-2222-2222-2222-222222222222',
        'Service Laptop',
        'service-laptop',
        'Perbaikan hardware, install ulang OS, pembersihan internal, dan upgrade komponen untuk performa maksimal.',
        'Rp 50.000',
        'Estimasi Biaya',
        'Teknisi Ready',
        'laptop_chromebook',
        'https://lh3.googleusercontent.com/aida-public/AB6AXuAIklsF_hxaesoBvxF-vaCYBB5Ouf5xFgrZJmTjImNN8uciPAhr3AnUvh0f1kb1N1GPyXsRdcyUV2M8MfisSRA4HdOpLCaCSxwSCWVTVXTTSXmbxx_yUjLNG8OoDU7INIl0JHRMWS2OC-f22eARF_r0wPAJYeec_-Diwu3w7TlOUKJs5qHHdEkj2xuu_i7piB8t-mYxPsKWnSUFYfcwYA8FRp7vzJa0bqhXjyrzHu49f1iVmbZuloogq1uqyVejxqcogjZce6FzrgoV',
        true
    ),
    (
        'cccccccc-cccc-cccc-cccc-cccccccccccc',
        '44444444-4444-4444-4444-444444444444',
        'Desain Grafis',
        'desain-grafis',
        'Jasa pembuatan logo, banner, kartu nama, dan materi promosi lainnya dengan revisi sampai puas.',
        'Rp 35.000',
        'Mulai Dari',
        'Desainer Aktif',
        'palette',
        'https://lh3.googleusercontent.com/aida-public/AB6AXuAIvAZO_aNokOW7sR7MTKh5BHnwwPKFhMqSaqk_7ssJveAS-TsLAIEokoFVvQ-K3KRV3GtxZfs7CsPVUyuS3MrTxJRIB_xVWzilU5DzX3M9c0xZciOERTc23vCWCiGnF9XAbw3XR0ZZYxb5TLOxraICI4mJfqLP75jUy-HmtYnY7LSpkzG8DkhXST7axEtQyal-SvddOlwUwocg08VzpLb0rUnQkcYiR_ooEJDqLPynVQolg7gdwacmRZhwIlCYbTLIsSHL8U6XDpVp',
        true
    ),
    (
        'dddddddd-dddd-dddd-dddd-dddddddddddd',
        '11111111-1111-1111-1111-111111111111',
        'Fotocopy & Jilid',
        'fotocopy-jilid',
        'Layanan penggandaan dokumen cepat dengan berbagai pilihan jilid (lakban, spiral, hard cover).',
        'Rp 250',
        'Per Lembar',
        'Siap Pakai',
        'content_copy',
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBLST0aByNqVS_o-RAxCSbBe00IJ5NrxJAVdv2SrMySFX7fM4ftM_u9Kn9wPC9t9ieH32gltdWleWsC4Zm7LKdYFlPvEnnfoA2LvqwRKIr_aHFgta5Q9IDvqyRyMNi1QU3CH0NQpPitsU8j00244fEkRuG2gK2AfdwD6-j-Smd7V-wfLWtYQnEhhYzTIPQsHyInCJW4tfsh6G2epDl_sfjDZwtSUfaHE36PyVZNgpdG3LqqGt2FtMiDULn3elvgxi6J1d-pjSS1P3m-',
        true
    ),
    (
        'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',
        '33333333-3333-3333-3333-333333333333',
        'Warnet High-Speed',
        'warnet',
        'Akses internet super cepat untuk browsing, gaming, atau pendaftaran CPNS/Sekolah secara online.',
        'Rp 4.000',
        'Per Jam',
        '12 PC Kosong',
        'monitor',
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDDG5P9Yw34mvOXAahwgqleluaMPRprUYBGIvIqPOz7Pa9ZULeWPHMTA6jT375RSQBOY8KtzsYcj1t96HRHqcgdlrj6SU-TgrTMO2J2k5n9_0xdr4vJm6XhSDWIelF6eE-znJvA4CBxI_9ok5lXs4jCzDBjKoq9nlJyjyf7KZTrV1UMfN9Pf2g60yF5WPg3ft1m5TtZXCribHL_Cw9BCi7Ukbja0ntCZyGiCSnDS3DEr16z_FHP4D5-fZAsZz-Gc-xArzWLGgTZbW9x',
        true
    ),
    (
        'ffffffff-ffff-ffff-ffff-ffffffffffff',
        '55555555-5555-5555-5555-555555555555',
        'Scan & Edit Dokumen',
        'scan',
        'Konversi dokumen fisik ke digital PDF/JPG dengan resolusi tinggi dan jasa pengetikan ulang.',
        'Rp 2.000',
        'Mulai Dari',
        'Tersedia',
        'scanner',
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDin-4QogsVmv9bm5g6iEnq32OkDmYdKlsmzkLcLKmbFZHh2S4UsogeIdBHqYVeaNvEmVC6K9LPJSbmiN1g45FdoU6tH3BW7TcBAtNJROVQkCbh_H7B3lOsiGDiRN3Ewqj1_W_6W4CsJZhG8aYptU5J8EQbKAPV0YdLF3FZEut-NPMOBFsMFg3JMcTqJb3A7HYpCznGUWgY17frI6gEfth7ckGuYpybNXwREMbvqZcU7uW8xIDVOzM_v9xtsLQa7kn0DKGBBZqee1Vb',
        true
    )
    ON CONFLICT DO NOTHING;

-- +goose Down

DELETE FROM services
WHERE id IN (
             'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
             'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
             'cccccccc-cccc-cccc-cccc-cccccccccccc',
             'dddddddd-dddd-dddd-dddd-dddddddddddd',
             'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',
             'ffffffff-ffff-ffff-ffff-ffffffffffff'
    );