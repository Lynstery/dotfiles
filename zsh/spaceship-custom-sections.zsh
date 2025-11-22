# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_ENVVAR_SHOW="${SPACESHIP_ENVVAR_SHOW=true}"
SPACESHIP_ENVVAR_ASYNC="${SPACESHIP_ENVVAR_ASYNC=false}"
SPACESHIP_ENVVAR_PREFIX="${SPACESHIP_ENVVAR_PREFIX="with"}"
SPACESHIP_ENVVAR_SUFFIX="${SPACESHIP_ENVVAR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_ENVVAR_SYMBOL="${SPACESHIP_ENVVAR_SYMBOL=" "}"
SPACESHIP_ENVVAR_COLOR="${SPACESHIP_ENVVAR_COLOR="yellow"}"
SPACESHIP_ENVVAR_TARGET_NAME="${SPACESHIP_ENVVAR_TARGET_NAME="NONE"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show envvar status
# spaceship_ prefix before section's name is required!
# Otherwise this section won't be loaded.
spaceship_envvar() {
  [[ $SPACESHIP_ENVVAR_SHOW == false ]] && return

  [[ "$SPACESHIP_ENVVAR_TARGET_NAME" == "NONE" ]] && return

  local target_value="${(P)SPACESHIP_ENVVAR_TARGET_NAME}"

  [[ -z "$target_value" ]] && return

  spaceship::section::v4 \
    --color "$SPACESHIP_ENVVAR_COLOR" \
    --prefix "$SPACESHIP_ENVVAR_PREFIX" \
    --suffix "$SPACESHIP_ENVVAR_SUFFIX" \
    --symbol "$SPACESHIP_ENVVAR_SYMBOL" \
    "$SPACESHIP_ENVVAR_TARGET_NAME=$target_value"
}
