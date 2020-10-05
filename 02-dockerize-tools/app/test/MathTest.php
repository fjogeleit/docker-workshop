<?php

declare(strict_types=1);

namespace App\Test;

use PHPUnit\Framework\TestCase;
use App\Math;

class MathTest extends TestCase
{
    public function testAdd()
    {
        $this->assertEquals(6, Math::add(2, 4));
    }

    public function testSub()
    {
        $this->assertEquals(-2, Math::sub(2, 4));
    }

    public function testIsOdd()
    {
        $this->assertTrue(Math::isOdd(1));
        $this->assertFalse(Math::isOdd(2));
    }
}
