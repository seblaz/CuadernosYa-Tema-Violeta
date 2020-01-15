{**
 * 2007-2018 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2018 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div class="container">
  <div class="row">
    {* <div class="col-lg-3  col-md-3">
      {block name='hook_footer'}
        {hook h='displayFooterBefore'}
      {/block}
    </div> *}
    <div class="col-lg-6 col-md-9 offset-lg-3">
      <div class="single-footer-widget newsletter">
        <h6>Novedades</h6>
        <p>Podés confiar en nosotros. Solo enviamos ofertas, ni un solo spam.</p>
        <div id="mc_embed_signup">
          <form target="_blank" novalidate="true" action="https://cuadernosya.us18.list-manage.com/subscribe/post?u=4e6a7312d9406995e06843740&amp;id=72df1edee1" method="get" class="form-inline">

            <div class="form-group row" style="width: 100%">
              <div class="col-lg-8 col-md-12">
                <input name="EMAIL" placeholder="Correo electrónico" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Correo electrónico'" required type="email">
                <div style="position: absolute; left: -5000px;">
                  <input name="b_4e6a7312d9406995e06843740_72df1edee1" tabindex="-1" value="" type="text">
                </div>
              </div> 
              <div class="col-lg-4 col-md-12 boton-suscribir">
                <button class="nw-btn primary-btn boton-suscripcion">Suscribite<span class="lnr lnr-arrow-right"></span></button>
              </div> 
            </div>
            <div class="info col-lg-12"></div>
          </form>
        </div>		
      </div>
    </div>
    <div class="col-lg-3  col-md-12">
      <div class="single-footer-widget mail-chimp">
        <h6 class="mb-20">Social</h6>
        <div class="footer-social">
          <a target="_blank" href="https://www.facebook.com/Cuadernos-Ya-2173636302868010"><i class="fa fa-facebook"></i></a>
          <a target="_blank" href="https://wa.me/5491155798100"><i class="fa fa-whatsapp"></i></a>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    {block name='hook_footer'}
      {hook h='displayFooter'}
    {/block}
    {* {block name='hook_footer_after'}
      {hook h='displayFooterAfter'}
    {/block} *}
  </div>
  <div class="row footer-bottom d-flex justify-content-between">
          <p class="col-lg-8 col-sm-12 footer-text m-0 text-white">Copyright &copy;<script>document.write(new Date().getFullYear());</script> Todos los derechos reservados | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
    </div>
</div>