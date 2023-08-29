autoload -Uz colors
autoload -Uz vcs_info

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

# PROMPT変数内で変数参照
setopt prompt_subst

function get-kube-cluster-info() {
    local kube_context=$(grep current-context ~/.kube/config | cut -d' ' -f2)

    if [[ ${kube_context} =~ aws ]]; then
        # 一旦 EKS に関してはクラスター名のみを表示
        # TODO: AWS のアカウント ID からアカウント名を表示する
        cluster_info="%F{red}eks%f:$(echo ${kube_context} | cut -d/ -f 2)"
    elif [[ ${kube_context} =~ gke ]]; then
        cluster_info="%F{blue}gke%f:$(echo ${kube_context} | cut -d_ -f 2,4 | sed 's/_/\//')"
    fi

    echo "${cluster_info}"
}

function get-aws-profile-info()
{
    local aws_profile_info=''
    if [ -n "${AWS_PROFILE}" ]; then
        aws_profile_info="%F{red}aws%f:${AWS_PROFILE}"
    fi

    echo ${aws_profile_info}
}

function precmd () {
    vcs_info
    if [ -z "${NEW_LINE_BEFORE_PROMPT}" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "${NEW_LINE_BEFORE_PROMPT}" -eq 1 ]; then
        echo ""
    fi

    local endl=$'\n'

    if [ -n "${SHOW_KUBE_INFO_PROMPT}" ]; then
        local kube_info="$(get-kube-cluster-info) "
    fi

    if [ -n "${SHOW_AWS_INFO_PROMPT}" ]; then
        local aws_info="$(get-aws-profile-info) "
    fi

    PROMPT="%~ ${aws_info}${kube_info}${vcs_info_msg_0_}${endl}> "
}
