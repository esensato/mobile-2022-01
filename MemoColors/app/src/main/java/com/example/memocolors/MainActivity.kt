package com.example.memocolors

import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.ImageButton
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import java.util.*
import kotlin.random.Random

class MainActivity : AppCompatActivity() {

    lateinit var txtNivel:TextView
    lateinit var sorteados:IntArray
    lateinit var timer:Timer
    var repeticoes = 1
    var pos = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        txtNivel = findViewById(R.id.txtNivel)
        txtNivel.text = repeticoes.toString()

    }

    fun iniciar_OnClick(view:View) {
        this.sorteados = sortear()
        this.pos = 0
        this.timer = Timer()
        var apagar = true
        var corOriginal = 0
        var context = this

        timer.schedule(object: TimerTask() {
            override fun run() {
                Log.i("SORTEIO", "Pos = " + pos + " - sorteados.size = " + sorteados.size)
                if (pos == sorteados.size) {
                    timer.cancel()
                    pos = 0
                    runOnUiThread {
                        Toast.makeText(context, "Sua vez!", Toast.LENGTH_LONG).show()
                    }

                } else {
                    var btnAtual = obterBotao(sorteados[pos])
                    if (apagar) {
                        corOriginal = (btnAtual.background as ColorDrawable).color
                        btnAtual.setBackgroundColor(Color.GRAY)
                        apagar = false
                    } else {
                        runOnUiThread {
                            btnAtual.setBackgroundColor(corOriginal)
                        }
                        apagar = true
                        pos++

                    }
                }
            }
        }, 0, 1000)

    }

    fun selecionarBotao_onClick(view:View) {

        var idBotaoClick = view.id
        var botaoSorteado = obterBotao(sorteados[pos])
        Log.i("Botao Sorteado", botaoSorteado.id.toString())
        Log.i("Botao Clicado", idBotaoClick.toString())
        if (idBotaoClick == botaoSorteado.id) {

            pos++

            if (pos == sorteados.size) {

                val builder = AlertDialog.Builder(this)
                builder.setTitle(R.string.app_name)
                builder.setIcon(R.drawable.ic_launcher_foreground)
                builder.setMessage(R.string.lblCorretoDialog)
                builder.show()

                repeticoes++
                txtNivel.text = repeticoes.toString()
            }

        } else {

            val builder = AlertDialog.Builder(this)
            builder.setTitle(R.string.app_name)
            builder.setIcon(R.drawable.ic_launcher_foreground)
            builder.setMessage(R.string.lblErroDialog)
            builder.show()
            repeticoes = 1
            txtNivel.text = repeticoes.toString()
        }

    }

    fun sortear():IntArray {
        var ret = IntArray(repeticoes)

        for (i in 0..repeticoes - 1) {
            ret[i] = Random.nextInt(4)
        }

        return ret
    }

    fun obterBotao(nro:Int):ImageButton {
        return when(nro) {
            0 -> findViewById<ImageButton>(R.id.btnCima)
            1 -> findViewById<ImageButton>(R.id.btnDireita)
            2 -> findViewById<ImageButton>(R.id.btnBaixo)
            else -> findViewById<ImageButton>(R.id.btnEsquerda)
        }
    }
}