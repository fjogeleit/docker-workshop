CREATE TABLE workshops (
    "id" UUID NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "speaker" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "date" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    PRIMARY KEY ("id")
);

INSERT INTO workshops (
    "id",
    "name",
    "speaker",
    "description",
    "date"
) VALUES (
    'fe65a6e7-77ed-4032-8882-553b9375871b',
    'Docker Workshop',
    'Frank',
    'How to Dockerize',
    '2020-10-07'
);