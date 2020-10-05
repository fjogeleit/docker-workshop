<?php

declare(strict_types = 1);

namespace App;

use MathPHP\NumberTheory\Integer;

final class Math
{
    public static function add(float $a, float $b): float
    {
        return $a + $b;
    }

    public static function sub(float $a, float $b): float
    {
        return $a - $b;
    }

    public static function isOdd(int $a): bool
    {
        return Integer::isOdd($a);
    }
}