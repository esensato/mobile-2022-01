package com.example.lutadores

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast

class MainActivity : AppCompatActivity() {

    lateinit var jogador1:EditText
    lateinit var jogador2:EditText
    lateinit var resultado:TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        jogador1 = findViewById(R.id.edtLutador1)
        jogador2 = findViewById(R.id.edtLutador2)
        resultado = findViewById(R.id.txtResultado)

    }

    fun btnLutar_OnClick (view:View){

        val lutador1 = Lutador(jogador1.text.toString())
        val lutador2 = Lutador(jogador2.text.toString())
        val r = lutador1.atacar(lutador2)
        resultado.text = r
    }
}