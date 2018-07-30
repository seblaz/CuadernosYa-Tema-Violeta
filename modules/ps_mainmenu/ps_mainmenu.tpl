<ul class="navbar-nav">
  {foreach from=$menu.children item=node}
    {if $node.children|count}
    <li class="dropdown">
      <div class="dropdown-group">
        <a class="dropdown-menu-link" href="{$node.url}">{$node.label}</a>
        <span class="dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        </span>
        <div class="dropdown-menu">
          {foreach from=$node.children item=node_children}
            <a class="dropdown-item" href="{$node_children.url}">{$node_children.label}</a>
          {/foreach}
        </div>
      </div>
    </li>
    {else}
      <li><a href="{$node.url}">{$node.label}</a>
    {/if}
  {/foreach}
</ul>

