package com.example.calculadora;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class CalculadoraServiceTest {
    
    private CalculadoraService calculadoraService;
    
    @BeforeEach
    void setUp() {
        calculadoraService = new CalculadoraService();
    }
    
    @Test
    void testSomar() {
        double resultado = calculadoraService.somar(5, 3);
        assertEquals(8, resultado);
    }
    
    @Test
    void testSubtrair() {
        double resultado = calculadoraService.subtrair(10, 4);
        assertEquals(6, resultado);
    }
    
    @Test
    void testMultiplicar() {
        double resultado = calculadoraService.multiplicar(6, 7);
        assertEquals(42, resultado);
    }
    
    @Test
    void testDividir() {
        double resultado = calculadoraService.dividir(15, 3);
        assertEquals(5, resultado);
    }
    
    @Test
    void testDividirPorZero() {
        assertThrows(IllegalArgumentException.class, () -> {
            calculadoraService.dividir(10, 0);
        });
    }
}