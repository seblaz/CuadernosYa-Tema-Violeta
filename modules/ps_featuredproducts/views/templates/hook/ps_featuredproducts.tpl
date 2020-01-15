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

{assign var=randomindex value=$products|@array_rand:2 nocache}
<!-- Start entrega -->
<section class="generic-banner relative entrega" id="entrega">
    <div class="container">
        <div class="row align-items-center justify-content-center">
            <div class="col-lg-6 about-left">
                <h1>{l s='Vamos al lugar donde estás' d='Shop.Theme.Index'}</h1>
                <p>
                    {l s='Una vez que realices el pedido online nos contactaremos con vos para coordinar la entrega en la fiuba (por el momento solo relizamos entregas en la sede Paseo Colón). Además garantizamos que tu pedido estará disponible para la entrega en un máximo de tres días hábiles.' d='Shop.Theme.Index'}
                </p>
            </div>
            <div class="col-lg-6 producto-home">
                <section id="products">
                  <div class="products">
                    {include file="catalog/_partials/miniatures/product.tpl" product=$products[$randomindex[0]]}
                  </div>
                </section>
            </div>
        </div>
    </div>
</section>
<!-- End entrega -->

<!-- Start pago-devoluciones -->
<section>
    <div class="container">
        <div class="section-top-border">
            <div class="row align-items-center">
                <div class="col-lg-4 col-md-5 anuncio producto-home">
                  {include file="catalog/_partials/miniatures/product.tpl" product=$products[$randomindex[1]]}
                </div>
                <div class="col-lg-8 col-md-7 mt-sm-20" id="pago">
                    <div class="pago">
                        <h3 class="mb-30">{l s='Pagá solo por lo que recibís' d='Shop.Theme.Index'}</h3>
                        <p>
                            {l s='No es necesario que adelantes dinero, pagá una vez que tengas tus productos en tus manos.' d='Shop.Theme.Index'}
                        </p>
                    </div>
                    <div class="devoluciones" id="devolucion" >
                        <h3 class="mb-30">{l s='Devoluciones sin condiciones' d='Shop.Theme.Index'}</h3>
                        <p>
                            {l s='Si querés devolver de manera total o parcial un pedido podés hacerlo sin cargo hasta 15 días luego de recibido el producto.
                            Al igual que la entrega, las devoluciones se coordinan para realizarlas en la fiuba.
                            Si querés devolver algún producto contactanos ' d='Shop.Theme.Index'}
                            <a href="#contacto">{l s='acá' d='Shop.Theme.Index'}</a>.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End pago-devoluciones -->

{* <section class="featured-products clearfix">
  <h2 class="h2 products-section-title text-uppercase">
    {l s='Popular Products' d='Shop.Theme.Catalog'}
  </h2>
  <div class="products">
    {foreach from=$products item="product"}
      {include file="catalog/_partials/miniatures/product.tpl" product=$product}
    {/foreach}
  </div>
  <a class="all-product-link float-xs-left float-md-right h4" href="{$allProductsLink}">
    {l s='All products' d='Shop.Theme.Catalog'}<i class="material-icons">&#xE315;</i>
  </a>
</section> *}
