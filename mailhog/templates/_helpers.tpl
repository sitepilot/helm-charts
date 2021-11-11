{{- define "mailhog.name" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "mailhog.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "mailhog.labels" -}}
helm.sh/chart: {{ include "mailhog.chart" . }}
{{ include "mailhog.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: "{{ .Values.image.tag | default .Chart.AppVersion }}"
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "mailhog.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mailhog.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
