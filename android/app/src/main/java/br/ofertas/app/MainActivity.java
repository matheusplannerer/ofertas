package br.ofertas.app;

import android.os.Bundle;

import androidx.annotation.NonNull;

import java.security.Provider;
import java.security.Security;

import br.com.moip.encryption.entities.CreditCard;

import br.com.moip.encryption.exception.MoipEncryptionException;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    
  private static final String CHANNEL = "flutter.native";
  // private static final BasicAuth BASIC_AUTH = new
  // BasicAuth("TZ1A1PJBG1KH195FIWZZXMGZ5K1DK14K",
  // "RZV90DVRDZMBPRVVQQROR2XG2LM9FB3RQDAJUHOU");

  final String PUBLIC_KEY = "-----BEGIN PUBLIC KEY-----\n"
      + "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCUq1qNXAUiSodR+ZjoIElR/rOc\n"
      + "IpvRmgcMXyxHbGwcPA3bjL0gVp5CmiIO1ewxhE6TtckN2MS0exAGs1Tkv6VBpIFB\n"
      + "gQ+7pVpk0qSJ3UTnImWNf7wgl5mECu++ASwskZXewjd7JMSg7xcIq8/mPED/Uj2u\n"
      + "JzGFPIFhBc2guDYM/QIDAQAB\n"
      + "-----END PUBLIC KEY-----";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    // GeneratedPluginRegistrant.registerWith(this);
    
  }

  // @Override
  // public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
  //   GeneratedPluginRegistrant.registerWith(flutterEngine);
  //   Security.addProvider(new org.spongycastle.jce.provider.BouncyCastleProvider());
  //   new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
  //       .setMethodCallHandler((call, result) -> {
  //         if (call.method.equals("powerManage")) {

  //           String myMessage = "aí sim";
  //           result.success(myMessage);

  //         }

  //         if (call.method.equals("helloFromNativeCode")) {
  //           CreditCard creditCard = new CreditCard();
  //           creditCard.setPublicKey(PUBLIC_KEY);
  //           creditCard.setExpirationYear("22");
  //           creditCard.setExpirationMonth("12");
  //           creditCard.setNumber("5555666677778884");
  //           creditCard.setCvc("123");
  //           try {
  //             String dado = creditCard.encrypt();
  //             result.success(dado);
  //           } catch (MoipEncryptionException e) {
  //             e.printStackTrace();
  //             result.success("erro");
  //           }

  //         }

  //       });
  // }
}
